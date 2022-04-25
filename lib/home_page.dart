

import 'dart:ffi';
import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tik_tak_toe_game/custom_dialogue.dart';
import 'package:tik_tak_toe_game/game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List <GameButton> buttonlist;
  var player1;
  var player2;
  var activePlayer;



  @override
  void initState() {
    // TODO: implement initState
    buttonlist = doInit();
    super.initState();

  }

  List <GameButton> doInit(){
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gamebuttons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];

    return gamebuttons;
  }


  void playGame(GameButton gb){
    setState(() {
      if(activePlayer == 1){
        gb.text = 'Player 1';
        gb.bg = Color(0xff006666);
        activePlayer = 2;
        player1.add(gb.id);
      }else{
        gb.text = "Player 2";
        gb.bg = Color(0xff5E3C58);
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int Winner = checkWinner();
      if(Winner == -1){
        if(buttonlist.every((element) => element.text != "")){
          showDialog(
              context: context,
              builder: (_) => CustomDialogue("Game Tied", "Press the reset button to start again.", resetGame));
        }else{
          // activePlayer == 2? autoPlay() : null;
        }
      }
    });
  }

  //this autoplay button about you and your computer...I don't use this button because it doesn't successfully work.

//   void autoPlay(){
//     var emptyCells = [];
//     var list = List.generate(9, (i) => i + 1);
//     for(var cellId in list){
//       if(player1.contains(cellId) || player2.contains(cellId)){
//         emptyCells.add(cellId);
//       }
//     }
//
//     var r = Random();
//     var ranIndex = r.nextInt(emptyCells.length - 1);
//     var cellId = emptyCells[ranIndex];
//     int i = buttonlist.indexWhere((element) => element.id == cellId);
//     playGame(buttonlist[i]);
// }


  int checkWinner(){
    var Winner = -1;
    if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
      Winner = 1;
    }
    if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
      Winner = 2;
    }


    //row 2
    if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
      Winner = 1;
    }
    if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
      Winner = 2;
    }


    //row 3
    if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
      Winner = 1;
    }
    if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
      Winner = 2;
    }

    //column1
    if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
      Winner = 1;
    }
    if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
      Winner = 2;
    }

    //column2
    if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
      Winner = 1;
    }
    if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
      Winner = 2;
    }

    //column3
    if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
      Winner = 1;
    }
    if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
      Winner = 2;
    }

    //diagonal(top left to right bottom)
    if(player1.contains(1) && player1.contains(5) && player1.contains(9)){
      Winner = 1;
    }
    if(player2.contains(1) && player2.contains(5) && player2.contains(9)){
      Winner = 2;
    }


    //diagonal(top right to left bottom)
    if(player1.contains(3) && player1.contains(5) && player1.contains(7)){
      Winner = 1;
    }
    if(player2.contains(3) && player2.contains(5) && player2.contains(7)){
      Winner = 2;
    }


    if(Winner != -1){
      if(Winner == 1){
        showDialog(
            context: context,
            builder: (_) => CustomDialogue("Player 1 Won","Press the reset button to start again",resetGame)
        );
      }else{
        showDialog(
            context: context,
            builder: (_) => CustomDialogue("Player 2 Won","Press the reset button to start again",resetGame)
        );
      }
    }
    return Winner;
  }

  void resetGame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonlist = doInit();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff01214F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        title: ClayContainer(
          height: 35,
          width: 110,
          color: Color(0xff01214F),

          child: Container(
            width: 100,
            height: 35,

            child: Center(child: Text('Tik Tak Toe',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          Expanded(
            child: ClayContainer(
              color: Color(0xff01214F),
              child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: buttonlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 3,
                       childAspectRatio: 1.0,
                       crossAxisSpacing: 12,
                       mainAxisSpacing: 12,
                   ),


                  itemBuilder: (context, i) => SizedBox(
                    width: 100,
                    height: 100,

                    child: RaisedButton(
                      padding: EdgeInsets.all(8.0),

                        onPressed: buttonlist[i].enabled ? () => playGame(buttonlist[i]) : null,
                        child: Text(buttonlist[i].text,style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "Bushetch"),),

                      color: buttonlist[i].bg,
                      disabledColor: buttonlist[i].bg,
                    ),
                  )
              ),
            ),
          ),
         FlatButton(onPressed: (){ final player = AudioCache(); player.play('my_audio.mp3');}, child: Text('Play',style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),color: Color(0xff668ABE),),

          ClayContainer(
            child: RaisedButton(onPressed: resetGame,child: Text("Reset",style: TextStyle(fontSize: 20.0,color: Colors.white),),
            color: Color(0xff01214F),
            padding: EdgeInsets.all(20.0),
            ),
          )
        ],
      )
    );
  }
}
