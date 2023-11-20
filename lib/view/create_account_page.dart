import 'package:easypeasy/utils/colors.dart';
import 'package:easypeasy/view/login_page.dart';
import 'package:easypeasy/view/widgets/custom_button.dart';
import 'package:easypeasy/view/widgets/custome_text.dart';
import 'package:easypeasy/view/widgets/custome_textfield.dart';
import 'package:easypeasy/viewmodel/firbase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPasswordHide = true;
  FirebaseAuths firebaseAuths = FirebaseAuths();
  bool isindicated = false;

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: hight,
          width: width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/people.png",
              scale: 6,
            ),
            Text(
              "Join Us!",
              style: GoogleFonts.poppins(
                  fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                // height: hight * .44,
                // width: width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customeText(
                        text: "Your Name:",
                        textcolor: Colors.black54,
                      ),
                      customeTextField(
                          controller: nameController,
                          hintText: "Enter your full name",
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
                          text: "Your Mobile:", textcolor: Colors.black54),
                      customeTextField(
                          controller: mobileController,
                          hintText: "Mobile number",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "enter mobile number";
                            }
                            if (value.length <= 9) {
                              return "enter coreect number";
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
                        text: "Your Email:",
                        textcolor: Colors.black54,
                      ),
                      customeTextField(
                        controller: emailController,
                        hintText: "hello@gmail.com",
                        icon: const Icon(
                          Icons.arrow_right,
                          size: 50,
                          color: appThemeBlue,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "enter email address";
                          }
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return "enter correct email address";
                          }
                          return null;
                        },
                      ),
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
                  onTap: () {
                    firebaseAuths.signWithGoogle(context);
                  },
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
                        firebaseAuths.sign(emailController.text,
                            passwordController.text, context);
                      }
                    },
                    context: context,
                    text: "Create an account ",
                    textcolor: white,
                    bgColor: const MaterialStatePropertyAll(appThemeBlue)),
              ],
            ),
          ),
        ));
  }
}
//  isindicated
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )