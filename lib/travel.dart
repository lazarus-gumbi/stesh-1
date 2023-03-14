import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var _trip_status = "accepted";

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Row(children: [
                Icon(
                  Icons.circle,
                  color: _trip_status == "pending"
                      ? Colors.amber
                      : _trip_status == "accepted"
                          ? Colors.green
                          : Colors.red,
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xffffa700),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Corner Plaza",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: Color(0xffffa700),
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Swazi Plaza",
                              style: GoogleFonts.roboto(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        _trip_status == 'accepted'
                            ? TextButton(
                                onPressed: () {
                                  // showDriverAlert(context);
                                  _showDriverInformation();
                                },
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size(40, 30),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    alignment: Alignment.centerLeft),
                                child: const Text(
                                  "Sandile Dlamini",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(0, 183, 255, 1),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDriverInformation() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Driver Information",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Icon(
                              Icons.close,
                              color: Color(0xffffa700),
                            ))
                      ],
                    ),
                    Divider(
                      color: Color.fromARGB(117, 37, 32, 44),
                    ),
                    Text(
                      "Sandile Dlamini",
                      style: GoogleFonts.roboto(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Car:",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Toyota",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Model:",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Corolla",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Licence Plate #:",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "ASD 656 AL",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Color:",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Red",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // handleSubmit();
                        //  TODO: confirm all fields are filled then add to the cards datastructure
                      },
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff25202C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50)),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Call Driver',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffffa700),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
