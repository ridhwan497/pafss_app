import 'package:flutter/material.dart';
import 'package:software_project_1/widgets/mobile/mobile_appbar.dart';
import 'package:software_project_1/widgets/mobile/mobile_drawer.dart';

class MobileSendScreen extends StatelessWidget {

  const MobileSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF134859),
      appBar: MobileAppbar(),
      body: Center(
        child: Text(
          'Mobile Send Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      drawer: MobileDrawer(),
    );
  }
  
}