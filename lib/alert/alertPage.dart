import 'package:flutter/material.dart';
import 'package:qlert/home/home.dart';

import '../alert/profile_details.dart';
import '../alert/alert_button.dart';

class AlertPage extends StatefulWidget {

  final String id;

  const AlertPage({super.key, required this.id});

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        children: [
          // Gradient container that extends behind the AppBar
          Container(
            height: MediaQuery.of(context).size.height / 2.75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.shade100,
                  Colors.purpleAccent
                ], // Replace with your gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(child: SizedBox()),
          ),
          // AppBar with a transparent background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  print(Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())));
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const MyHomePage()),
                  // );
                },
              ),
              // title: Text('Your App Title'),
            ),
          ),
          // Rest of the content
          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 0,
            right: 0,
            bottom: 0,
            child: Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white70
                    ], // Replace with your gradient colors
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ), // Set your desired background color
                  borderRadius: BorderRadius.circular(
                      30), // Adjust the border-radius for rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                // Replace with your desired height
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Profile(uid: widget.id,),
            )),
          ),
          Positioned(
            top: 110,
            left: 70,
            right: 70,
            child: BreathingButton(),
          ),
        ],
      ),
    );
  }
}
