import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(JokenpoApp());

class JokenpoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Jokenpo',
           style: TextStyle(
            fontSize: 36,
            color: Colors.red,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: JokenpoGame(),
        ),
      ),
    );
  }
}

class JokenpoGame extends StatefulWidget {
  @override
  _JokenpoGameState createState() => _JokenpoGameState();
}

class _JokenpoGameState extends State<JokenpoGame> {
  String playerChoice = '';
  String appChoice = '';
  String result = '';

  void chooseOption(String option) {
    setState(() {
      playerChoice = option;
      appChoice = _getRandomChoice();
      result = _determineWinner(playerChoice, appChoice);
    });
  }

  String _getRandomChoice() {
    List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
    Random random = Random();
    return choices[random.nextInt(choices.length)];
  }

  String _determineWinner(String player, String app) {
    if (player == app) {
      return 'Empate!';
    } else if ((player == 'Pedra' && app == 'Tesoura') ||
        (player == 'Papel' && app == 'Pedra') ||
        (player == 'Tesoura' && app == 'Papel')) {
      return 'Você ganhou!';
    } else {
      return 'Você perdeu!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Escolha do jogador: $playerChoice',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Escolha do aplicativo: $appChoice',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Text(
          'Resultado: $result',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => chooseOption('Pedra'),
              child: Image.asset('assets/pedra.png', width: 100, height: 100),
            ),
             ElevatedButton(
              onPressed: () => chooseOption('Papel'),
              child: Image.asset('assets/images/papel.png',width: 100, height: 100),
            ),
             ElevatedButton(
              onPressed: () => chooseOption('Tesoura'),
              child: Image.asset('assets/images/tesoura.png', width: 100, height: 100),
            ),
          ],
        ),
      ],
    );
  }
}
