import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mathgame/secondpage.dart';
import 'package:mathgame/fourthpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class First_Page extends StatefulWidget {
  static int levelNum = 0;
  static SharedPreferences? sp;
  static List levelStateList = [];
  static String lock = "lock";
  static String skip = "skip";
  static String clear = "clear";

  @override
  State<StatefulWidget> createState() {
    return State_First_Page();
  }
}

class State_First_Page extends State<First_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharePerferenceFun();
  }

  Future<void> sharePerferenceFun() async {
    First_Page.sp = await SharedPreferences.getInstance();

    First_Page.levelStateList.clear();
    for (int i = 0; i < 75; i++) {
      setState(() {
        String levelStatus =
            First_Page.sp!.getString('levelStatusKey${i}') ?? First_Page.lock;
        First_Page.levelStateList.add(levelStatus);
      });
      print(
          '===levelStatus ${First_Page.levelNum} = ${First_Page.levelStateList}');
    }

    setState(() {
      First_Page.levelNum = First_Page.sp!.getInt("indexNumberSet") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("asset/images/background.png"))),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 80, 10, 10),
              child: Text(
                "Math puzzle - Pradip",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontFamily: "mathGameFont",
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 150),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("asset/images/blackboard_firstpage.png"),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Second_Page.controller.text = "";

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Second_Page(First_Page.levelNum);
                              },
                            ));
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "mathGameFont",
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Fourth_Page(First_Page.levelNum);
                              },
                            ));
                          },
                          child: Text(
                            "Puzzles",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "mathGameFont",
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Buy Pro",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "mathGameFont",
                                fontSize: 45,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 10, 5),
                  child: Column(
                    children: [
                      Text(
                        "AD",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: "mathGameFont",
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 55,
                          width: 55,
                          child: Image.asset("asset/images/ad.png"))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(177, 15, 10, 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Wrap(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Image.asset(
                                  "asset/images/share.png",
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                child: Image.asset(
                                  "asset/images/mail.png",
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Center(
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "mathGameFont",
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
