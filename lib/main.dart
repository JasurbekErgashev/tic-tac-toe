import 'package:flutter/material.dart';
import 'dart:math';

import './card.dart';

void main() => runApp(const TicTacToe());

class TicTacToe extends StatelessWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<List<dynamic>>> _tomatoValues = [
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ],
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ],
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ]
  ];
  List<List<List<dynamic>>> cucumberValues = [
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ],
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ],
    [
      [false, 0, false],
      [false, 0, false],
      [false, 0, false]
    ]
  ];
  final List<List<int>> _cardIndexProvider = [
    [0, 0],
    [0, 1],
    [0, 2],
    [1, 0],
    [1, 1],
    [1, 2],
    [2, 0],
    [2, 1],
    [2, 2]
  ];

  int _player = 0;
  bool _gameStart = false;
  bool _gameEnd = false;
  int _whoWinTheGame = 0;

  bool whoWin() {
    for (int i = 0; i < 3; i++) {
      if (_tomatoValues[0][i][0] &&
          _tomatoValues[1][i][0] &&
          _tomatoValues[2][i][0]) {
        _tomatoValues[0][i][2] = true;
        _tomatoValues[1][i][2] = true;
        _tomatoValues[2][i][2] = true;
        _whoWinTheGame = 1;
        return true;
      }
      if (cucumberValues[0][i][0] &&
          cucumberValues[1][i][0] &&
          cucumberValues[2][i][0]) {
        cucumberValues[0][i][2] = true;
        cucumberValues[1][i][2] = true;
        cucumberValues[2][i][2] = true;
        _whoWinTheGame = 2;
        return true;
      }
      if (_tomatoValues[i][0][0] &&
          _tomatoValues[i][1][0] &&
          _tomatoValues[i][2][0]) {
        _tomatoValues[i][0][2] = true;
        _tomatoValues[i][1][2] = true;
        _tomatoValues[i][2][2] = true;
        _whoWinTheGame = 1;
        return true;
      }
      if (cucumberValues[i][0][0] &&
          cucumberValues[i][1][0] &&
          cucumberValues[i][2][0]) {
        cucumberValues[i][0][2] = true;
        cucumberValues[i][1][2] = true;
        cucumberValues[i][2][2] = true;
        _whoWinTheGame = 2;
        return true;
      }
    }
    if (_tomatoValues[0][0][0] &&
        _tomatoValues[1][1][0] &&
        _tomatoValues[2][2][0]) {
      _tomatoValues[0][0][2] = true;
      _tomatoValues[1][1][2] = true;
      _tomatoValues[2][2][2] = true;
      _whoWinTheGame = 1;
      return true;
    }
    if (_tomatoValues[0][2][0] &&
        _tomatoValues[1][1][0] &&
        _tomatoValues[2][0][0]) {
      _tomatoValues[0][2][2] = true;
      _tomatoValues[1][1][2] = true;
      _tomatoValues[2][0][2] = true;
      _whoWinTheGame = 1;
      return true;
    }
    if (cucumberValues[0][0][0] &&
        cucumberValues[1][1][0] &&
        cucumberValues[2][2][0]) {
      cucumberValues[0][0][2] = true;
      cucumberValues[1][1][2] = true;
      cucumberValues[2][2][2] = true;
      _whoWinTheGame = 2;
      return true;
    }
    if (cucumberValues[0][2][0] &&
        cucumberValues[1][1][0] &&
        cucumberValues[2][0][0]) {
      cucumberValues[0][2][2] = true;
      cucumberValues[1][1][2] = true;
      cucumberValues[2][0][2] = true;
      _whoWinTheGame = 2;
      return true;
    }
    int tracker = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_tomatoValues[i][j][0] || cucumberValues[i][j][0]) {
          tracker++;
        }
      }
    }
    if (tracker == 9) {
      _whoWinTheGame = 3;
      return true;
    } else {
      return false;
    }
  }

  void _tabHandler(int i, int j) {
    if (_gameStart &&
        !_tomatoValues[i][j][0] &&
        !cucumberValues[i][j][0] &&
        !_gameEnd) {
      setState(() {
        if (_player == 1) {
          _tomatoValues[i][j][0] = true;
          _tomatoValues[i][j][1] = 1;
          _player = 2;
        } else {
          cucumberValues[i][j][0] = true;
          cucumberValues[i][j][1] = 2;
          _player = 1;
        }
        if (whoWin()) {
          _gameEnd = true;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontFamily: 'Ubuntu',
          ),
        ),
        foregroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      !_gameStart
                          ? 'Welcome, 👋'
                          : _gameEnd
                              ? _whoWinTheGame == 3
                                  ? 'Draw 🤝'
                                  : 'Player '
                              : 'Player ',
                      style: TextStyle(
                        color: _gameEnd ? Colors.green[800] : Colors.black87,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    SizedBox(
                      height: !_gameStart || _whoWinTheGame == 3 ? 0.0 : 40.0,
                      width: !_gameStart || _whoWinTheGame == 3 ? 0.0 : 40.0,
                      child: !_gameStart
                          ? Container()
                          : !_gameEnd
                              ? Image.asset('assets/images/$_player.png')
                              : _whoWinTheGame == 1
                                  ? Image.asset('assets/images/1.png')
                                  : _whoWinTheGame == 2
                                      ? Image.asset('assets/images/2.png')
                                      : Container(),
                    ),
                    _whoWinTheGame == 1 || _whoWinTheGame == 2
                        ? Text(
                            ' Won',
                            style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Ubuntu',
                            ),
                          )
                        : const Text(''),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25.0),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width > 500
                    ? MediaQuery.of(context).size.width * 0.5
                    : double.infinity,
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: _cardIndexProvider.map((point) {
                    return EachCard(
                      tabHandler: _tabHandler,
                      cucumbers: cucumberValues,
                      tomatos: _tomatoValues,
                      gameStart: _gameStart,
                      i: point[0],
                      j: point[1],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (!_gameStart) {
                      _gameStart = true;
                      _player = Random().nextInt(2) + 1;
                    }
                    if (_gameEnd) {
                      _tomatoValues = [
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ],
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ],
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ]
                      ];
                      cucumberValues = [
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ],
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ],
                        [
                          [false, 0, false],
                          [false, 0, false],
                          [false, 0, false]
                        ]
                      ];
                      _player = 0;
                      _gameStart = false;
                      _gameEnd = false;
                      _whoWinTheGame = 0;
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black87,
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 45.0),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                child: Text(
                  !_gameStart
                      ? 'Start'
                      : !_gameEnd
                          ? 'Playing...'
                          : 'Close',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
