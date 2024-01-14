import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
                onPressed: () {}, child: const Text('Mostrar Dialogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showCustomSnackBar(context);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
          label: const Text("Mostrar snackbar")),
    );
  }

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas de acuerdo?'),
        content: const Text('Exercitation consequat laborum dolore do aliquip aliqua laborum cupidatat occaecat laboris aliqua culpa. In voluptate qui magna officia amet occaecat et sint duis amet est dolore est dolor. Ex dolore incididunt dolore commodo nulla. Aliquip cillum do esse veniam eiusmod ad. Incididunt id ad irure minim labore sunt deserunt elit.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }
}
