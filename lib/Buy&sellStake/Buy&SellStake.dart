import 'package:flutter/material.dart';

class BuySellStake extends StatelessWidget {
  const BuySellStake({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F5FF),
        title: Image.asset(
          'assets/images/namenlogo.png',
          width: 200,
        ),
        titleSpacing: 5,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
