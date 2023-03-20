import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stesh/secrets.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  static const LatLng _MapCenter = LatLng(-26.31667, 31.13333);
  static final CameraPosition _InitialPosition =
      const CameraPosition(target: _MapCenter, zoom: 20.0, tilt: 0, bearing: 0);

  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  var uuid = const Uuid();
  String _sessionToken = const Uuid().toString();
  List<dynamic> _placeList = [];

  late var _textField;

  List<Marker> _markers = [];

  Set<Polyline> polylines = {};

  bool _buttonEnable = false;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _addMarkersToMap(
      String sourceAddress, String destinationAddress) async {
    final markers =
        await _getMarkersFromAddresses(sourceAddress, destinationAddress);
    setState(() {
      _markers = markers;

      _mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
                _markers.map((marker) => marker.position.latitude).reduce(min),
                _markers
                    .map((marker) => marker.position.longitude)
                    .reduce(min)),
            northeast: LatLng(
                _markers.map((marker) => marker.position.latitude).reduce(max),
                _markers
                    .map((marker) => marker.position.longitude)
                    .reduce(max)),
          ),
          50.0,
        ),
      );
    });
  }

  Future<List<Marker>> _getMarkersFromAddresses(
      String sourceAddress, String destinationAddress) async {
    final sourceLatLng = await _getLatLngFromAddress(sourceAddress);
    final destinationLatLng = await _getLatLngFromAddress(destinationAddress);

    final sourceMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: const MarkerId('source_marker'),
      position: LatLng(sourceLatLng.latitude, sourceLatLng.longitude),
    );

    final destinationMarker = Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      markerId: const MarkerId('destination_marker'),
      position: LatLng(destinationLatLng.latitude, destinationLatLng.longitude),
    );

    _getDirections(sourceLatLng, destinationLatLng);

    return [sourceMarker, destinationMarker];
  }

  Future<void> _getDirections(LatLng source, LatLng destination) async {
    String kPLACESAPIKEY = Secrets.API_KEY;
    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${source.latitude},${source.longitude}&destination=${destination.latitude},${destination.longitude}&mode=driving&key=$kPLACESAPIKEY';
    var response = await http.get(Uri.parse(url));
    var decoded = json.decode(response.body);

    List<PointLatLng> result = PolylinePoints()
        .decodePolyline(decoded['routes'][0]['overview_polyline']['points']);
    var points =
        result.map((point) => LatLng(point.latitude, point.longitude)).toList();

    setState(() {
      polylines.clear();
      polylines.add(Polyline(
          polylineId: const PolylineId('route'),
          color: const Color(0xffffa700),
          zIndex: 10,
          points: points));
    });
  }

  Future<LatLng> _getLatLngFromAddress(String address) async {
    final location = await locationFromAddress(address);
    // final loc = await
    return LatLng(location.first.latitude, location.first.longitude);
  }

  void getSuggestion(
    String input,
  ) async {
    String country = 'SZ';
    String kPLACESAPIKEY = Secrets.API_KEY;
    String type = '(regions)';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&components=country:$country&key=$kPLACESAPIKEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));
    if (response.statusCode == 200) {
      setState(() {
        _placeList = jsonDecode(response.body)['predictions'];
      });
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  void _validateInputs() {
    setState(() {
      _buttonEnable = _sourceController.text.isNotEmpty &&
          _destinationController.text.isNotEmpty;
    });
  }

  void _source_onChanged() {
    _textField = 'source';
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_sourceController.text);
  }

  void _destination_onChanged() {
    _textField = 'destination';
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_destinationController.text);
  }

  @override
  void initState() {
    super.initState();
    _sourceController.addListener(() {
      _validateInputs();
      _source_onChanged();
    });
    _destinationController.addListener(() {
      _validateInputs();
      _destination_onChanged();
    });
  }

  @override
  void dispose() {
    _sourceController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // Map related valuse

    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _InitialPosition,
            markers: _markers.toSet(),
            polylines: polylines,
          ),
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
                            controller: _sourceController,
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
                        const Expanded(
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
                            controller: _destinationController,
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
                                disabledColor: Colors.grey,
                                color: const Color(0xff757575),
                                onPressed: _buttonEnable
                                    ? () {
                                        _showConfirmationDialog(
                                            _sourceController.text,
                                            _destinationController.text);
                                        _addMarkersToMap(_sourceController.text,
                                            _destinationController.text);
                                      }
                                    : null,
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
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _placeList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                WidgetsBinding
                                    .instance.focusManager.primaryFocus
                                    ?.unfocus();
                                if (_textField == 'source') {
                                  _sourceController.text =
                                      _placeList[index]['description'];
                                  _placeList = [];
                                } else if (_textField == 'destination') {
                                  _destinationController.text =
                                      _placeList[index]['description'];
                                  _placeList = [];
                                }
                              });
                            },
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white30,
                            ),
                            title: Text(
                              _placeList[index]['description'],
                              style:
                                  GoogleFonts.robotoMono(color: Colors.white),
                            ),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showConfirmationDialog(
      String source, String destination) async {
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
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
                              source,
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
                              destination,
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
                              color: const Color(0xffffa700),
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
