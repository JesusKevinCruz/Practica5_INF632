import 'package:flutter/material.dart';

class ModeloJuego with ChangeNotifier {
  List<String> tablero = List.filled(9, '');
  String turnoActual = 'X';
  String mensaje = '';
  int puntosX = 0;
  int puntosO = 0;
  bool contraMaquina = true;

  void realizarMovimiento(int index) {
    if (tablero[index] == '' && mensaje == '') {
      tablero[index] = turnoActual;
      if (_verificarGanador(turnoActual)) {
        mensaje = '¡$turnoActual ha ganado!';
        if (turnoActual == 'X') {
          puntosX++;
        } else {
          puntosO++;
        }
      } else if (!tablero.contains('')) {
        mensaje = '¡Es un empate!';
      } else {
        turnoActual = turnoActual == 'X' ? 'O' : 'X';
        if (contraMaquina && turnoActual == 'O') {
          _turnoMaquina();
        }
      }
      notifyListeners();
    }
  }

  void reiniciarTablero() {
    tablero = List.filled(9, '');
    turnoActual = 'X';
    mensaje = '';
    notifyListeners();
  }

  void reiniciarTodo() {
    reiniciarTablero();
    puntosX = 0;
    puntosO = 0;
    notifyListeners();
  }

  bool _verificarGanador(String jugador) {
    const combinacionesGanadoras = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var combinacion in combinacionesGanadoras) {
      if (tablero[combinacion[0]] == jugador &&
          tablero[combinacion[1]] == jugador &&
          tablero[combinacion[2]] == jugador) {
        return true;
      }
    }
    return false;
  }

  void _turnoMaquina() {
    for (int i = 0; i < tablero.length; i++) {
      if (tablero[i] == '') {
        tablero[i] = 'O';
        break;
      }
    }
    if (_verificarGanador('O')) {
      mensaje = '¡O ha ganado!';
      puntosO++;
    } else if (!tablero.contains('')) {
      mensaje = '¡Es un empate!';
    } else {
      turnoActual = 'X';
    }
    notifyListeners();
  }
}
