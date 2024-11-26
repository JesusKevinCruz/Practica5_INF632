import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modelo_juego.dart';
import 'pagina_principal.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ModeloJuego(),
      child: const JuegoDelGatoApp(),
    ),
  );
}

class JuegoDelGatoApp extends StatelessWidget {
  const JuegoDelGatoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego del Gato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PaginaPrincipal(),
    );
  }
}
