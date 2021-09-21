import 'package:flutter/material.dart';

/// Tipos de animacion disponibles.
enum AnimationType {
  normal,
  fadeIn,
  rotation,
  scale,
  slide,
}

/// ROUTETRANSITION
///
/// [context] Contexto de la aplicación.
///
/// [child] Widget al que se va a navegar.
///
/// [replacement] Permite agregar o eliminar widgets en el stack de rutas.
///
/// [duration] Duracion de la transición.
///
/// [type] Indica la animacion para la transición.
///
class RouteTransition {
  RouteTransition(
    this.context, {
    @required this.child,
    this.replacement = false,
    this.duration = const Duration(milliseconds: 250),
    this.type = AnimationType.normal,
  }) {
    switch (type) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      case AnimationType.rotation:
        _rotationTransition();
        break;
      case AnimationType.scale:
        _scaleTransition();
        break;
      case AnimationType.slide:
        _slideTransition();
        break;
    }
  }

  final Widget child;
  final bool replacement;
  final Duration duration;
  final AnimationType type;
  final BuildContext context;

  /// Transición normal entre rutas.
  void _normalTransition() =>
      _navigate(MaterialPageRoute(builder: (context) => child));

  /// Transición con efecto de desvanecimiento entre rutas.
  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        child: child,
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
    _navigate(route);
  }

  /// Transición con efecto de rotación entre rutas.
  void _rotationTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) => RotationTransition(
        child: child,
        turns: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
    _navigate(route);
  }

  /// Transición con efecto de escalado entre rutas.
  void _scaleTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) => ScaleTransition(
        child: child,
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
    _navigate(route);
  }

  /// Transición con efecto de deslizamiento entre rutas.
  void _slideTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) => SlideTransition(
        child: child,
        position:
            Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
      ),
    );
    _navigate(route);
  }

  /// Navega entre rutas.
  ///
  /// Elimina el stack de rutas o agrega una nueva.
  void _navigate(Route route) {
    (replacement)
        ? Navigator.pushReplacement(context, route)
        : Navigator.push(context, route);
  }
}

// https://flutter.dev/docs/development/packages-and-plugins/developing-packages
