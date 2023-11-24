import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn = true; // the first player is O
  List<String> displayValue = ['', '', '', '', '', '', '', '', ''];
  var myTextStyle = const TextStyle(color: Colors.white,fontSize: 26);
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var myNewFontWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.black, Colors.pink.shade900, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Player O', style: myNewFontWhite),
                              const SizedBox(height: 20,),
                              Text(oScore.toString(), style: myNewFontWhite),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Player X', style: myNewFontWhite),
                              const SizedBox(height: 20,),
                              Text(xScore.toString(), style: myNewFontWhite),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              _tapped(index);
                            },
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(color: Colors.black26)),
                              child: Center(
                                child: Text(
                                  displayValue[index],
                                  style: const TextStyle(color: Colors.white, fontSize: 33),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    child: Center(
                        child: Text('TIC TAC TOE', style: myNewFontWhite,)
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {

    setState(() {
      if (onTurn && displayValue[index] == '') {
        displayValue[index] = 'o';
        filledBoxes += 1;
      } else if (!onTurn && displayValue[index] == ''){
        displayValue[index] = 'x';
        filledBoxes += 1;
      }
      onTurn = !onTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    
    // check 1st row
    if (displayValue[0] == displayValue[1] &&
        displayValue[0] == displayValue[2] &&
        displayValue[0] != '') {
      _showWinDialogue(displayValue[0]);
    }
    
    //check 2nd row
    if (displayValue[3] == displayValue[4] &&
        displayValue[3] == displayValue[5] &&
        displayValue[3] != '') {
      _showWinDialogue(displayValue[3]);
    }

    //check 3rd row
    if (displayValue[6] == displayValue[7] &&
        displayValue[6] == displayValue[8] &&
        displayValue[6] != '') {
      _showWinDialogue(displayValue[6]);
    }

    // check 1st column
    if (displayValue[0] == displayValue[3] &&
        displayValue[0] == displayValue[6] &&
        displayValue[0] != '') {
      _showWinDialogue(displayValue[0]);
    }

    //check 2nd column
    if (displayValue[1] == displayValue[4] &&
        displayValue[1] == displayValue[7] &&
        displayValue[1] != '') {
      _showWinDialogue(displayValue[1]);
    }

    //check 3rd column
    if (displayValue[2] == displayValue[5] &&
        displayValue[2] == displayValue[8] &&
        displayValue[2] != '') {
      _showWinDialogue(displayValue[2]);
    }

    //check diagonal
    if (displayValue[0] == displayValue[4] &&
        displayValue[0] == displayValue[8] &&
        displayValue[0] != '') {
      _showWinDialogue(displayValue[0]);
    }

    //check diagonal
    if (displayValue[2] == displayValue[4] &&
        displayValue[2] == displayValue[6] &&
        displayValue[2] != '') {
      _showWinDialogue(displayValue[2]);
    }

    else if(filledBoxes == 9){
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('DRAW'),
            actions: [
              TextButton(
                  child: Text('Play Again!',style: TextStyle(
                    color: Colors.pink.shade900
                  ),),
                  onPressed: (){
                    _clearBoard();
                    Navigator.pop(context);
                  },
              )
            ],
          );
        }
    );
  }

  void _showWinDialogue(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('WINNER IS: ${winner}'),
            actions: [
              TextButton(
                  onPressed: (){
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text('Play Again!')
              )
            ],
          );
        }
    );

    if(winner == 'o'){
      oScore += 1;
    }else if(winner == 'x'){
      xScore += 1;
    }
  }

  void _clearBoard(){

    setState(() {
      for(int i=0; i<9; i++){
        displayValue[i] = '';
      }
    });

    filledBoxes =0;
  }
}
