import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mathgame/firstpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'thirdpage.dart';

class Second_Page extends StatefulWidget {
  int levelNum;

  Second_Page(this.levelNum);

  static TextEditingController controller = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return State_Second_Page();
  }
}

class State_Second_Page extends State<Second_Page> {
  List trueAns = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
    "60",
    "61",
    "62",
    "63",
    "64",
    "65",
    "66",
    "67",
    "68",
    "69",
    "70",
    "71",
    "72",
    "73",
    "74",
    "75",
  ];
  String textFiledAns = "";

  void submitCheck() {
    textFiledAns = Second_Page.controller.text;

    if (textFiledAns == trueAns[widget.levelNum]) {
      First_Page.sp!
          .setString('levelStatusKey${widget.levelNum}', First_Page.clear);
      First_Page.levelStateList[widget.levelNum] = First_Page.clear;

      setState(() {
        widget.levelNum++;
      });
      if (First_Page.levelNum < widget.levelNum) {
        First_Page.levelNum = widget.levelNum;
        First_Page.sp!.setInt('indexNumberSet', widget.levelNum);
        print("this is Second Page data ====>  widget.levelNum = ${widget.levelNum}");
        print("this is Second Page data ====>  First_Page.levelNum = ${First_Page.levelNum}");
      }
      print("====> widget.levelNum --> ${widget.levelNum}");
      print("====> First_Page.levelNum --> ${First_Page.levelNum}");

      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Third_Page(widget.levelNum);
        },
      ));
    } else if (textFiledAns != trueAns[widget.levelNum]) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.grey,
              title: Text("Please enter right answer !"),
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "mathGameFont"),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Center(
                      child: Text(
                        "OKAY",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: "mathGameFont"),
                      ),
                    ))
              ],
            );
          });
      Second_Page.controller.text = "";
    }
  }

  void skipLevel() {
    if (First_Page.levelStateList[widget.levelNum] != First_Page.clear) {
      First_Page.sp
          ?.setString('levelStatusKey${widget.levelNum}', First_Page.skip);
      First_Page.levelStateList[widget.levelNum] = First_Page.skip;
    }

    setState(() {
      widget.levelNum++;
    });
    if (First_Page.levelNum < widget.levelNum) {
      First_Page.levelNum = widget.levelNum;
      First_Page.sp!.setInt('indexNumberSet', widget.levelNum);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/images/secondpage_background.png"))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 1),
              // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.all(5),
                      child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Container(
                                    height: 150,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      '''Are you sure want to skip this level ? you can play skipped leves late by clicking on PUZZLES menu from main screen''',
                                      style: TextStyle(
                                          fontFamily: 'mathGameFont',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: Text(
                                          'CANCEL',
                                          style: TextStyle(
                                              fontFamily: 'mathGameFont',
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          skipLevel();
                                        },
                                        child: Text(
                                          'OKAY!',
                                          style: TextStyle(
                                              fontFamily: 'mathGameFont',
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            "asset/images/skip.png",
                            height: 40,
                            width: 40,
                          ))),
                  Container(
                    height: 60,
                    width: 185,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/images/level_board.png"),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: Text(
                        "Puzzle ${widget.levelNum + 1}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "mathGameFont",
                            fontSize: 30),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Image.asset(
                      "asset/images/hint.png",
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Image.asset(
                    "asset/images/p${widget.levelNum + 1}.png",
                    height: 350,
                    width: 350,
                  ),
                )
              ],
            ),
            Container(
              height: 120,
              margin: EdgeInsets.fromLTRB(5, 222, 5, 5),
              // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          controller: Second_Page.controller,
                          readOnly: true,
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "mathGameFont",
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              if (Second_Page.controller.text.isNotEmpty) {
                                Second_Page.controller.text = "";
                              }
                            });
                          },
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (Second_Page.controller.text.isNotEmpty) {
                                  print(Second_Page.controller.text =
                                      Second_Page.controller.text.substring(
                                          0,
                                          Second_Page.controller.text.length -
                                              1));
                                }
                              });
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {
                            submitCheck();
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: "mathGameFont"),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                Second_Page.controller.text += "${index}";
                              });
                            },
                            child: Text(
                              "${index}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontFamily: "mathGameFont"),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
