import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellingScreen extends StatefulWidget {
  const SellingScreen({Key? key}) : super(key: key);

  @override
  _SellingScreenState createState() => _SellingScreenState();
}

class _SellingScreenState extends State<SellingScreen> {
  double backImageOpacity = 0;
  double logoOpacity = 0;
  double payAreaOpacity = 0;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        backImageOpacity = 1;
      });
    });
    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        logoOpacity = 1;
      });
    });
    Timer(Duration(milliseconds: 2500), () {
      setState(() {
        payAreaOpacity = 1;
      });
    });
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: backImageOpacity,
            duration: Duration(microseconds: 500),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'assets/carPhoto.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          AnimatedOpacity(
            curve: Curves.elasticOut,
            opacity: logoOpacity,
            duration: Duration(microseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: payAreaOpacity,
            duration: Duration(microseconds: 500),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        'Summary',
                        style: TextStyle(color: Colors.grey, fontSize: 25),
                      ),
                    ),
                    Text(
                      'Your Model Y',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '60,000\$',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(color: Colors.red))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Text(
                            'Pay',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
