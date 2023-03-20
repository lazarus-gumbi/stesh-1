import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stesh/driverHome.dart';
import 'package:stesh/sign_up.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  State<DriverLoginScreen> createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25.0),
          height: height,
          width: width,
          color: const Color(0xff25202C),
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
                          enabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          hintText: 'Email'),
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
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
                          enabledBorder: const UnderlineInputBorder(
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
                                    builder: (context) => DriverHomeScreen(),
                                  ),
                                );
                              }),
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  backgroundColor:
                                      const Color.fromRGBO(255, 167, 0, 1),
                                  elevation: 0,
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0)),
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
                              builder: (context) => const SignUpScreen(),
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
