import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathgame/firstpage.dart';
import 'package:mathgame/secondpage.dart';

class Fourth_Page extends StatefulWidget {
  int levelNum;

  Fourth_Page(this.levelNum);

  @override
  State<StatefulWidget> createState() {
    return State_Fourth_Page();
  }
}

class State_Fourth_Page extends State<Fourth_Page> {
  @override
  Widget build(BuildContext context) {
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
                itemCount: 3,
                itemBuilder: (context, pageIndex) {
                  int gridViewItemCount = 0;
                  int startIndex = 0;

                  if (pageIndex == 0) {
                    gridViewItemCount = 28;
                    startIndex = 0;
                  } else if (pageIndex == 1) {
                    gridViewItemCount = 28;
                    startIndex = 28;
                  } else {
                    gridViewItemCount = 19;
                    startIndex = 56;
                  }

                  print("First_Page.levelNum =====>   ${First_Page.levelNum}");
                  print("widget.levelNum =====>   ${widget.levelNum}");

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemCount: gridViewItemCount,
                    itemBuilder: (context, gridIndex) {
                      print('checkonylGridIndex = ${gridIndex}');

                      int currentLevel = widget.levelNum + 1;
                      print('== currentlevel = ${currentLevel}');

                      String statePg0 = First_Page.levelStateList[gridIndex];
                      print('0 == ${First_Page.levelStateList[gridIndex]}');

                      String statePg1 =
                          First_Page.levelStateList[gridIndex + startIndex];
                      print(
                          '1 == ${First_Page.levelStateList[gridIndex + startIndex]}');

                      String statePg2 =
                          First_Page.levelStateList[gridIndex + startIndex];
                      print(
                          '2 == ${First_Page.levelStateList[gridIndex + startIndex]}');

                      if (pageIndex == 0) {
                        print('===0 = ${[gridIndex]}');

                        return Container(
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
                                if (statePg0 == First_Page.clear ||
                                    statePg0 == First_Page.skip ||
                                    currentLevel == gridIndex + 1) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      widget.levelNum = gridIndex + startIndex;
                                      return Second_Page(widget.levelNum);
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(statePg0 ==
                                                First_Page.clear
                                            ? "asset/images/tick.png"
                                            : (statePg0 == First_Page.skip ||
                                                    currentLevel ==
                                                        gridIndex + 1
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: currentLevel == gridIndex + 1 ||
                                          statePg0 == First_Page.clear ||
                                          statePg0 == First_Page.skip
                                      ? Text(
                                          ' ${gridIndex + 1}',
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
                        );
                      } else if (pageIndex == 1) {
                        print('===1 = ${[gridIndex + startIndex]}');

                        return Container(
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
                                if (statePg1 == First_Page.clear ||
                                    statePg1 == First_Page.skip ||
                                    currentLevel == gridIndex + 1) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      widget.levelNum = gridIndex + startIndex;
                                      return Second_Page(widget.levelNum);
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(statePg1 ==
                                                First_Page.clear
                                            ? "asset/images/tick.png"
                                            : (statePg1 == First_Page.skip ||
                                                    currentLevel ==
                                                        gridIndex + 29
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: currentLevel == gridIndex + 29 ||
                                          statePg1 == First_Page.clear ||
                                          statePg1 == First_Page.skip
                                      ? Text(
                                          ' ${gridIndex + 29}',
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
                        );
                      } else {
                        print('===2 = ${gridIndex + startIndex}');
                        print('\n');

                        return Container(
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
                                if (statePg2 == First_Page.clear ||
                                    statePg2 == First_Page.skip ||
                                    currentLevel == gridIndex + 1) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      widget.levelNum = gridIndex + startIndex;
                                      return Second_Page(widget.levelNum);
                                    },
                                  ));
                                }
                              },
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(statePg2 ==
                                                First_Page.clear
                                            ? "asset/images/tick.png"
                                            : (statePg2 == First_Page.skip ||
                                                    currentLevel ==
                                                        gridIndex + 57
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: currentLevel == gridIndex + 57 ||
                                          statePg2 == First_Page.clear ||
                                          statePg2 == First_Page.skip
                                      ? Text(
                                          ' ${gridIndex + 57}',
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
                        );
                      }
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
