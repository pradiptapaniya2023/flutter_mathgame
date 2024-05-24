import 'package:flutter/material.dart';
import 'package:mathgame/secondpage.dart';
import 'firstpage.dart';

class Third_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return State_Third_Page();
  }
}

class State_Third_Page extends State<Third_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/background.png"),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
              // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Puzzle ${Second_Page.levelNum} completed",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blueAccent,
                        fontFamily: "mathGameFont",
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Image.asset(
                  "asset/images/trophy.png",
                  height: 250,
                  width: 250,
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2)),
              child: TextButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Second_Page();
                    },
                  ));

                  setState(() {
                    Second_Page.controller.text = "";
                  });
                },
                child: Text(
                  "Contiune",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "mathGameFont"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return First_Page();
                    },
                  ));
                },
                child: Text(
                  "Main menu",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "mathGameFont"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Buy pro",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: "mathGameFont"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
