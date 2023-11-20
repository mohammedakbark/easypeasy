import 'package:easypeasy/utils/colors.dart';
import 'package:easypeasy/view/widgets/custom_button.dart';
import 'package:easypeasy/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
    
      body: SizedBox(
        height: hight,
        width: width,
        child: Column(
          children: [
            Container(
              color: appThemeBlue,
              height: hight * .40,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  "assets/girl.png",
                  scale: 15,
                ),
                // SizedBox(
                //   width: width / 2,
                // ),
                SizedBox(
                    // color: black,
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        customeText(text: "Avoid the ", size: 34),
                        customeText(text: "scare of", size: 34),
                        customeText(text: "coronavirus", size: 34),
                      ],
                    ))
              ]),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                width: width,
                margin: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customeText(text: "Symptoms", size: 23),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: width * .36,
                            height: hight * .12,
                            child: Card(
                              margin: const EdgeInsets.all(2),
                              surfaceTintColor: white,
                              elevation: 6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/cold.png",
                                    scale: 10,
                                  ),
                                  customeText(text: "Cold", size: 20)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * .36,
                            height: hight * .12,
                            child: Card(
                              surfaceTintColor: white,
                              elevation: 6,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  customeText(text: "Cough", size: 20),
                                  Image.asset(
                                    "assets/caugh.jpg",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      customeText(text: "Emergency Guide", size: 23),
                      Center(
                        child: SizedBox(
                          width: width * .8,
                          height: hight * .22,
                          child: Card(
                            surfaceTintColor: white,
                            elevation: 6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: width * .4,
                                      child: Column(
                                        children: [
                                          customeText(
                                              text: "Avoid the scare of ",
                                              size: 20),
                                          customeText(
                                              text: "coronavirus", size: 20),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: width * .35,
                                        child: customeButton(
                                            context: context,
                                            text: "Call",
                                            textcolor: black,
                                            bgColor:
                                                const MaterialStatePropertyAll(
                                                    appThemeBlue)))
                                  ],
                                ),
                                Image.asset(
                                  "assets/coronavirus.png",
                                  // color: Colors.blue,
                                  scale: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
