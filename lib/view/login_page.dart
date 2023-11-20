import 'package:easypeasy/utils/colors.dart';
import 'package:easypeasy/view/widgets/custom_button.dart';
import 'package:easypeasy/view/widgets/custome_text.dart';
import 'package:easypeasy/view/widgets/custome_textfield.dart';
import 'package:easypeasy/view/widgets/home_page.dart';
import 'package:easypeasy/viewmodel/firbase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordHide = true;
  FirebaseAuths firebaseAuths = FirebaseAuths();

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: hight,
          width: width,
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const SizedBox(
              height: 120,
            ),
            Container(
                height: hight * .2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 10)),
                child: Image.asset("assets/auth.png")),
            Text(
              "Login",
              style: GoogleFonts.poppins(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(30),
                height: hight * .44,
                width: width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customeText(
                        text: "Username:",
                        textcolor: Colors.black54,
                      ),
                      customeTextField(
                          controller: userNameController,
                          hintText: "Enter your Username",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter name";
                            }
                            return null;
                          },
                          icon: Image.asset(
                            "assets/userr.png",
                            color: appThemeBlue,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      customeText(
                        text: "Password:",
                        textcolor: Colors.black54,
                      ),
                      customeTextField(
                        controller: passwordController,
                        obsecure: isPasswordHide,
                        icon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordHide = !isPasswordHide;
                              });
                            },
                            icon: Icon(
                              isPasswordHide
                                  ? Icons.lock
                                  : Icons.lock_open_outlined,
                              color: appThemeBlue,
                            )),
                        hintText: "******************",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter new password";
                          }
                          if (value.length < 6) {
                            return "password must be  6 digit ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {},
                            child: customeText(
                                text: "Forgot Password ?",
                                textcolor: appThemeBlue)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
        bottomNavigationBar: SizedBox(
          height: hight * .22,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 2,
                      width: width * .4,
                      color: const Color.fromARGB(255, 232, 244, 255),
                    ),
                    customeText(
                      text: "or",
                      textcolor: const Color.fromARGB(255, 232, 244, 255),
                    ),
                    Container(
                      height: 2,
                      width: width * .4,
                      color: const Color.fromARGB(255, 232, 244, 255),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 232, 244, 255),
                        border: Border.all(color: appThemeBlue, width: 1.5)),
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      "assets/google.png",
                      scale: 1.5,
                    ),
                  ),
                ),
                customeButton(
                    onpressed: () {
                      // setState(() {
                      if (_formKey.currentState!.validate()) {
                        firebaseAuths.login(userNameController.text,
                            passwordController.text, context);
                      }
                    },
                    context: context,
                    text: "Login",
                    textcolor: white,
                    bgColor: const MaterialStatePropertyAll(appThemeBlue)),
              ],
            ),
          ),
        ));
  }
}
