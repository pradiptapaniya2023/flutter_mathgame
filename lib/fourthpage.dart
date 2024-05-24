import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mathgame/secondpage.dart';

class Fourth_Page extends StatefulWidget {
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
                    startIndex = 1;
                  } else if (pageIndex == 1) {
                    gridViewItemCount = 28;
                    startIndex = 29;
                  } else {
                    gridViewItemCount = 19;
                    startIndex = 57;
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    shrinkWrap: true,
                    itemCount: gridViewItemCount,
                    itemBuilder: (context, gridIndex) {
                      int currentLevel = Second_Page.levelNum;
                      int pageStartingIndex = startIndex + gridIndex;
                      String state =
                          Second_Page.levelStateList[pageStartingIndex];

                      if (pageIndex == 0) {
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
                              onDoubleTap: () {},
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(state == "clear"
                                            ? "asset/images/tick.png"
                                            : (state == "skip" ||
                                                    currentLevel ==
                                                        gridIndex + 1
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: currentLevel == gridIndex + 1 ||
                                          state == "clear" ||
                                          state == "skip"
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
                              onDoubleTap: () {},
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(state == "clear"
                                            ? "asset/images/tick.png"
                                            : (state == "skip" ||
                                                    currentLevel ==
                                                        gridIndex + 1
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: Text(
                                    ' ${gridIndex + 29}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'mathGameFont',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
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
                              onDoubleTap: () {},
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(state == "clear"
                                            ? "asset/images/tick.png"
                                            : (state == "skip" ||
                                                    currentLevel ==
                                                        gridIndex + 1
                                                ? ""
                                                : "asset/images/lock.png")))),
                                child: Center(
                                  child: Text(
                                    ' ${gridIndex + 57}',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontFamily: 'mathGameFont',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
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
