
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/screens/homepage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Container(
                        child: Text(
                          'TIC TAC TOE', style: myNewFontWhite.copyWith(fontSize: 28),
                        ),
                      ),
                  )
              ),
              Expanded(
                flex: 2,
                  child: Container(
                    child: AvatarGlow(
                        endRadius: 140,
                        duration: const Duration(seconds: 2),
                        glowColor: Colors.white,
                        repeat: true,
                        repeatPauseDuration: const Duration(seconds: 1),
                        startDelay: const Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none
                            ),
                            shape: BoxShape.circle
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.pink.shade900,
                            child: Image.asset('images/tic-tac-toe.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                            radius: 80,
                          ),
                        ),
                    ),
                  )
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'PLAY GAME', style: myNewFont,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
