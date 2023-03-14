import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stesh/home.dart';
import 'package:stesh/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // get screen width and height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25.0),
          height: height,
          width: width,
          color: Color(0xff25202C),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sawubona!",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Login to continue",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 20,
                        // fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      // controller: fullnameController,
                      decoration: InputDecoration(
                          hintStyle: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          hintText: 'Email'),
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      // controller: fullnameController,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintStyle: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          hintText: 'Password'),
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                      obscureText: !_passwordVisible,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        )),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }),
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  elevation: 0,
                                  padding:
                                      EdgeInsets.only(top: 15.0, bottom: 15.0),
                                  primary: Color.fromRGBO(255, 167, 0, 1)),
                              child: Text(
                                "Login",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "CREATE ACCOUNT",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
