import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // Map related valuse
    final LatLng _MapCenter = LatLng(-26.31667, 31.13333);
    final CameraPosition _InitialPosition =
        CameraPosition(target: _MapCenter, zoom: 20.0, tilt: 0, bearing: 0);

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          GoogleMap(initialCameraPosition: _InitialPosition),
          Container(
            color: const Color(0xff25202C),
            padding: const EdgeInsets.fromLTRB(15, 40, 20, 20),
            child: Wrap(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xffffa700),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            // controller: fullnameController,
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white)),
                                hintText: 'Your Source'),
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 10,
                            )),
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: Color(0xff757575),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.circle,
                            size: 18,
                            color: Color(0xffffa700),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: TextField(
                            // controller: fullnameController,
                            decoration: InputDecoration(
                                hintStyle: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                                enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white)),
                                hintText: 'Your Destination'),
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Material(
                            type: MaterialType.transparency,
                            clipBehavior: Clip.hardEdge,
                            elevation: 0,
                            shape: const CircleBorder(),
                            child: Ink(
                              child: IconButton(
                                splashColor: Colors.amber,
                                color: const Color(0xff757575),
                                onPressed: () {
                                  _showConfirmationDialog();
                                },
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xffffa700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: ((context) {
        return Dialog(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: const Color(0xff25202C),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xffffa700),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Corner Plaza",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Expanded(
                            flex: 1,
                            child: Icon(
                              size: 16,
                              Icons.circle_outlined,
                              color: Color(0xffffa700),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "Malkerns Square",
                              style: GoogleFonts.roboto(
                                  fontSize: 18, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "E 230.00",
                        style: GoogleFonts.robotoMono(
                          fontSize: 30,
                          color: const Color(0xffffa700),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff25202C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Close",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffffa700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xffffa700),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Confirm",
                            style: GoogleFonts.roboto(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
