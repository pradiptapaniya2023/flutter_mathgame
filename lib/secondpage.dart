import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mathgame/firstpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'thirdpage.dart';

class Second_Page extends StatefulWidget {
  static int levelNum = 0;
  static TextEditingController controller = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return State_Second_Page();
  }
}

class State_Second_Page extends State<Second_Page> {
  @override
  List trueAns = [
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
    "50",
    "34",
    "6",
    "41",
    "16",
    "126",
    "82",
    "14",
    "7",
    "132",
    "34",
    "48",
    "42",
    "288",
    "45",
    "4",
    "111",
    "47",
    "27",
    "87",
    "22",
    "253",
    "12",
    "38",
    "178",
    "1",
    "6",
    "10",
    "2",
    "20",
    "7",
    "511",
    "143547",
    "84",
    "11",
    "27",
    "3",
    "5",
    "39",
    "31",
    "10",
    "130",
    "22",
    "3",
    "14",
    "42",
    "164045",
    "11",
    "481",
    "86",
    "84",
    "13",
    "8"
  ];
  String textFiledAns = "";

  void submitCheck() {
    textFiledAns = Second_Page.controller.text;

    if (textFiledAns == trueAns[Second_Page.levelNum]) {

      First_Page.sp!.setString('levelStatusKey${Second_Page.levelNum}', First_Page.clear);

      setState(() {
        Second_Page.levelNum++;
      });
      First_Page.sp!.setInt('indexNumberSet', Second_Page.levelNum);

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Third_Page();
        },
      ));
    } else if (textFiledAns != trueAns[Second_Page.levelNum]) {
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
    First_Page.sp?.setString('levelStatusKey${Second_Page.levelNum}', First_Page.skip);

    setState(() {
      Second_Page.levelNum++;
    });
    First_Page.sp!.setInt('indexNumberSet', Second_Page.levelNum);
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
                        "Puzzle ${Second_Page.levelNum + 1}",
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
                    "asset/images/p${Second_Page.levelNum + 1}.png",
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
