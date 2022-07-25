import 'package:flutter/material.dart';

class EachCard extends StatelessWidget {
  final Function tabHandler;
  final List<List<List<dynamic>>> tomatos;
  final List<List<List<dynamic>>> cucumbers;
  final bool gameStart;
  final int i, j;
  const EachCard({
    Key? key,
    required this.tabHandler,
    required this.tomatos,
    required this.cucumbers,
    required this.gameStart,
    required this.i,
    required this.j,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tabHandler(i, j),
      child: Card(
        color: tomatos[i][j][2] || cucumbers[i][j][2]
            ? Colors.grey[300]
            : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 5.0,
        child: !gameStart
            ? Container()
            : tomatos[i][j][0]
                ? Image.asset('assets/images/${tomatos[i][j][1]}.png')
                : cucumbers[i][j][0]
                    ? Image.asset('assets/images/${cucumbers[i][j][1]}.png')
                    : Container(),
      ),
    );
  }
}
