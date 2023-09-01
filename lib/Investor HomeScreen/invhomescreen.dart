import 'package:flutter/material.dart';
import 'package:now_acquire_app/AllStartups/allstartups.dart';
import 'package:now_acquire_app/Investor%20HomeScreen/invhomebody.dart';
import 'package:now_acquire_app/WelcomeScreen/welcome_screen.dart';

import '../AllStartups/allstartupsBody.dart';

class InvhomeScreen extends StatefulWidget {
 late var investor;
  InvhomeScreen({required this.investor, super.key});

  @override
  _InvhomeScreenState createState() => _InvhomeScreenState();
}


class _InvhomeScreenState extends State<InvhomeScreen> {
  late var InvDetails = widget.investor;

  void _logout() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen(/*investor: InvDetails,*/)), (route) => false,);
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F5FF),
        title: Image.asset('assets/images/namenlogo.png', width: 200,),
        titleSpacing: 5,
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            color: Color(0xFF9B51B0),
            surfaceTintColor: Colors.white,
            shadowColor: Colors.white,
            onSelected: (value) {
              if (value == 'logout') {
                _logout();
              } else {
                if (value == 'option1'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InvhomeScreen(investor: InvDetails,)));
                }
                else if (value == 'option2'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AllStartupsBody(investor: InvDetails)));
                }
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'option1',
                child: Text('Investor Dashboard'),
              ),
              PopupMenuItem<String>(
                value: 'option2',
                child: Text('All Startups'),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      body: InvHomeBody(investor: InvDetails,),
    );
  }
}

