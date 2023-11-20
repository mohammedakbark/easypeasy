import 'package:easypeasy/utils/colors.dart';
import 'package:easypeasy/view/create_account_page.dart';
import 'package:easypeasy/view/widgets/custom_button.dart';
import 'package:easypeasy/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
          width: width,
          height: hight,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/delivery.png"),
                customeText(
                    text: "Ready to Feast?", textcolor: appThemeBlue, size: 33),
                customeText(
                    text: "Let's Begin!", textcolor: appThemeBlue, size: 33)
              ]),
        ),
        bottomNavigationBar: SizedBox(
          height: hight * .15,
          width: double.infinity,
          child: Center(
            child: customeButton(
                onpressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountPage()));
                },
                context: context,
                text: "Get Started",
                textcolor: white,
                bgColor: const MaterialStatePropertyAll(appThemeBlue)),
          ),
        ));
  }
}
