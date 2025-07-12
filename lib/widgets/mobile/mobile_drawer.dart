import 'package:flutter/material.dart';
import 'package:software_project_1/functions/navigation.dart';
import 'package:software_project_1/screens/about/mobile_about.dart';
import 'package:software_project_1/screens/receive/mobile_receive.dart';
import 'package:software_project_1/screens/send/mobile_send.dart';
import 'package:software_project_1/widgets/build_drawer_item.dart';

class MobileDrawer extends StatelessWidget{

  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Color(0xFFFFC93C),
      width: screenWidth * 0.60,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.04, 
          horizontal: screenWidth * 0.02
          ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start, //align items to the start
          crossAxisAlignment: CrossAxisAlignment.end,

          children: [
            //--------------------------------------------------
            //------------------ Close Icon --------------------
            //--------------------------------------------------
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, screenHeight * 0.03, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
                child: Icon(
                  Icons.close_rounded,
                  size: screenHeight * 0.05,
                  color: Color(0xFF134859), // Dark teal color for the close icon
                ),
              ),
              ),
            //--------------------------------------------------
            //------------------ Send Row ---------------------
            //--------------------------------------------------
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, screenHeight * 0.03, 0, 0),
              child: BuildDrawerItem(
                icon: Icons.send_rounded,
                label: 'Send',
                onTap: () => navigateTo(context, const MobileSendScreen()),
              ),
            ),
          //-------------------------------------------------
          //------------------- Recieve Row -----------------
          //-------------------------------------------------
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, screenHeight * 0.03, 0, 0),
            child: BuildDrawerItem(
              icon: Icons.download_rounded,
              label: 'Receive',
              onTap: () => navigateTo(context, const MobileReceiveScreen()), // Replace with actual receive screen
            ),  
            ),
          //-------------------------------------------------
          //------------------- About Row -------------------
          //-------------------------------------------------
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, screenHeight * 0.03, 0, 0),
            child: BuildDrawerItem(
              icon: Icons.info_rounded,
              label: 'About',
              onTap: () => navigateTo(context, const MobileAboutScreen()), // Replace with actual about screen
            ),
          ),

          ],
        ),
      
      ),
      
    );
  }
}