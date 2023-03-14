import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stesh/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isDriver = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    // get screen width and height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: const Color.fromRGBO(255, 167, 0, 1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Create Account",
                      style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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
                          hintText: 'Full Name'),
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                          hintText: 'Phone Number'),
                      style:
                          GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 15.0,
                    ),
                    _isDriver
                        ? Container(
                            child: Column(
                              children: [
                                TextField(
                                  // controller: fullnameController,
                                  decoration: InputDecoration(
                                      hintStyle: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.white)),
                                      hintText: 'Car Brand'),
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  // controller: fullnameController,
                                  decoration: InputDecoration(
                                      hintStyle: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.white)),
                                      hintText: 'Car Model'),
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  // controller: fullnameController,
                                  decoration: InputDecoration(
                                      hintStyle: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.white)),
                                      hintText: 'License Plate #'),
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  // controller: fullnameController,
                                  decoration: InputDecoration(
                                      hintStyle: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      enabledBorder: const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.white)),
                                      hintText: 'Color'),
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                              activeColor: Colors.white,
                              checkColor: const Color.fromRGBO(255, 167, 0, 1),
                              value: _isDriver,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isDriver = value!;
                                });
                              }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "I am a driver",
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: (() {}),
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                elevation: 0,
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15.0),
                                primary: const Color(0xff25202C),
                              ),
                              child: Text(
                                "Create",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.roboto(
                          color: const Color(0xff25202C),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
