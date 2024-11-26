import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modelo_juego.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final modelo = Provider.of<ModeloJuego>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego del Gato'),
        actions: [
          Switch(
            value: modelo.contraMaquina,
            onChanged: (valor) {
              modelo.contraMaquina = valor;
              modelo.reiniciarTodo();
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text('Contra Máquina'),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 255, 42),
              Color.fromARGB(255, 123, 255, 167)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Jugador X',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${modelo.puntosX}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Jugador O',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${modelo.puntosO}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              modelo.mensaje,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      modelo.realizarMovimiento(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: Center(
                        child: Text(
                          modelo.tablero[index],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: modelo.reiniciarTablero,
              child: const Text('Reiniciar Tablero'),
            ),
            ElevatedButton(
              onPressed: modelo.reiniciarTodo,
              child: const Text('Reiniciar Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
