import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathgame/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fourth_Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return State_Fourth_Page();
  }
}

class StatefulWidget {
}

class State_Fourth_Page extends State<Fourth_Page> {
  int levelPerPage = 28;
  int totalLevel = 75;
  SharedPreferences? sp;
  List levelState = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSP();
  }

  Future<void> getSP() async {
    sp = await SharedPreferences.getInstance();

    setState(() {
      levelState = sp!.getStringList('levelState') ??
          List.generate(totalLevel , (index) => "lock");
    });
  }

  List pageViewFun(int levelPerPage, int totalLevel) {
    List startingLevelList = List.generate(totalLevel, (index) => index + 1);
    List showLevelNumber = [];

    for (int i = 0; i < totalLevel; i = i + levelPerPage) {
      showLevelNumber.add(startingLevelList.sublist(
          i, (i + levelPerPage < totalLevel) ? i + levelPerPage : totalLevel));
    }

    return showLevelNumber;
  }

  @override
  Widget build(BuildContext context) {
    List pageViewList = pageViewFun(levelPerPage, totalLevel);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/background.png"),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 2),
              // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select Puzzle",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "mathGameFont",
                        color: Colors.blueAccent,
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: pageViewList.length,
                itemBuilder: (context, pageIndex) {
                  print(
                      '=== Page $pageIndex: ${pageViewList[pageIndex].length} items');
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: pageViewList[pageIndex].length,
                    itemBuilder: (context, gridIndex) {
                      int levelNum = pageViewList[pageIndex][gridIndex] ;
                      String state = levelState[levelNum - 1];

                      return (Container(
                        margin: EdgeInsets.all(5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: InkWell(
                            onDoubleTap: () {
                              // winingFun();
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(state == "clear"
                                          ? "asset/images/tick.png"
                                          : (state == "skip"
                                              ? ""
                                              : "asset/images/lock.png")))),
                              child: Center(
                                child: state == "clear" || state == "skip"
                                    ? Text(
                                        ' ${ pageViewList[pageIndex][gridIndex] } ',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'mathGameFont',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      )
                                    : null,
                              ),
                            ),
                          ),
                        ),
                      ));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
