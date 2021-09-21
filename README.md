## Custom route transitions

Este paquete permite realizar transiciones entre paginas de una forma mucho mas sencilla además de incluir la opción de agregar animaciones a las mismas.


## Ejemplo de uso

```dart
    RouteTransition(
        context,
        child: Page(),
        type: AnimationType.fadeIn,
        replacement: true,
        duration: Duration(milliseconds: 700),
    );
```