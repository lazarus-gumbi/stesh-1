import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    List trips = [
      {'source': "Corner Plaza", 'destination': "Malandela's Lodge"},
      {'source': "Corner Plaza", 'destination': "Malandela's Lodge"},
      {'source': "Corner Plaza", 'destination': "Malandela's Lodge"}
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: const Text('Available Trips'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: trips.length,
            itemBuilder: ((BuildContext context, index) => ListTile(
                  title: Column(children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Color(0xffffa700),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          trips[index]['source'],
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: Color(0xffffa700),
                          size: 23,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          trips[index]['destination'],
                          style:
                              GoogleFonts.roboto(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ]),
                  trailing: Container(
                    // width: 200,
                    // height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff25202C),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Accept',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}
