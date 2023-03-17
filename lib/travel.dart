import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  @override
  Widget build(BuildContext context) {
    List _elements = [
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "12/01/2023",
        "price": "E300"
      },
      {
        'source': "Malandela's Lodge",
        'destination': "Corner Plaza",
        "date": "12/01/2023",
        "price": "E350"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Solani's",
        "date": "12/01/2023",
        "price": "E150"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "14/01/2023",
        "price": "E350"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "16/01/2023",
        "price": "E350"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "18/01/2023",
        "price": "E250"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "19/01/2023",
        "price": "E300"
      },
      {
        'source': 'Corner Plaza',
        'destination': "Malandela's Lodge",
        "date": "19/01/2023",
        "price": "E250"
      },
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var _trip_status = "accepted";

    return Scaffold(
      body: SingleChildScrollView(
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
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xffffa700),
                            ),
                            const SizedBox(
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
                            const Icon(
                              Icons.circle_outlined,
                              color: Color(0xffffa700),
                              size: 20,
                            ),
                            const SizedBox(
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
            ),
            GroupedListView<dynamic, String>(
              physics: const BouncingScrollPhysics(),
              elements: _elements,
              stickyHeaderBackgroundColor: Colors.red,
              shrinkWrap: true,
              groupBy: (element) => element['date'],
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: false,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
              itemBuilder: (c, element) {
                return Card(
                  elevation: 0,
                  color: Colors.white24,
                  shape: const Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(188, 196, 196, 196), width: 1),
                  ),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color.fromRGBO(255, 167, 0, 1),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                element['source'],
                                style: GoogleFonts.robotoMono(
                                    color: const Color(0xff25202C),
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const Icon(
                                    Icons.circle,
                                    color: const Color(0xff25202C),
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  Text(
                                    element['destination'],
                                    style: GoogleFonts.robotoMono(
                                        color: const Color(0xff25202C),
                                        // fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                              Text(
                                element["price"],
                                style: GoogleFonts.robotoMono(
                                    color: Color.fromRGBO(255, 167, 0, 1),
                                    // fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
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
            child: SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
                            child: const Icon(
                              Icons.close,
                              color: Color(0xffffa700),
                            ))
                      ],
                    ),
                    const Divider(
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
