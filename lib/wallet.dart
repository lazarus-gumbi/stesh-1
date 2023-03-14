import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScrren extends StatefulWidget {
  const WalletScrren({super.key});

  @override
  State<WalletScrren> createState() => _WalletScrrenState();
}

class _WalletScrrenState extends State<WalletScrren> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Column(
        children: [
          Container(
            width: width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cards",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xff25202C),
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: () {
                        _showAddCardForm();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.add,
                          color: Color(0xffffa700),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: Color(0xff25202C),
                width: 2,
              ),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: Icon(Icons.credit_card_outlined)),
                  Expanded(
                    flex: 4,
                    child: Text(
                      "1111 2222 3333 4444",
                      style: GoogleFonts.robotoMono(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_forever,
                        color: Color(0xffffa700),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// BELOW: Add card dialog box containing the form
  Future<void> _showAddCardForm() async {
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add new card",
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
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xff25202C),
                          ),
                        ),
                        hintText: '0000 0000 0000 0000',
                        labelText: 'Card Number',
                        suffixIcon: Icon(Icons.credit_card),
                        iconColor: Color(0xff25202C)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff25202C)),
                              ),
                              hintText: 'MM/YY',
                              labelText: 'Expiary Date',
                              labelStyle: TextStyle(fontSize: 12),
                              suffixIcon: Icon(Icons.date_range),
                              iconColor: Color(0xff25202C)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        flex: 2,
                        child: const TextField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff25202C)),
                              ),
                              hintText: '000',
                              labelText: 'CVC',
                              suffixIcon: Icon(Icons.info),
                              iconColor: Color(0xff25202C)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff25202C)),
                        ),
                        hintText: 'John Doe',
                        labelText: "Cardholder's Name",
                        suffixIcon: Icon(Icons.person),
                        iconColor: Color(0xff25202C)),
                  ),
                  const SizedBox(
                    height: 30,
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
                        'Add Card',
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
      }),
    );
  }
}
