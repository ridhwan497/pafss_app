// Tablet-specific drawer widget


import 'package:flutter/material.dart';
import 'package:software_project_1/screens/about/tablet_about.dart';
import 'package:software_project_1/screens/home/tablet_home.dart';
import 'package:software_project_1/screens/receive/tablet_receive.dart';
import 'package:software_project_1/screens/send/tablet_send.dart';
import 'package:software_project_1/widgets/build_drawer_item.dart';
import 'package:software_project_1/functions/navigation.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate drawer width based on screen size (adaptive)
    final drawerWidth = screenWidth * 0.30; // 30 is the max i can push before i get a overflow error
    final minWidth = 250.0; // Minimum width for smaller tablets
    final maxWidth = 350.0; // Maximum width for larger tablets
    
    return Container(
      width: drawerWidth.clamp(minWidth, maxWidth),
      color: Color(0xFFFFC93C), // Yellow background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
        children: [
          // Drawer header with logo
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 40),
            child: Row(
              children: [
                Expanded(
                  child: Center(
              //----------------------------------------------------------------
              //---------------------------logo image---------------------------
              //----------------------------------------------------------------
                    child: GestureDetector(
                      onTap: () => navigateTo(context, const TabletHomeScreen()),
                      child: Image.asset(
                        'assets/images/logo_yellow.png',
                        width: screenWidth * 0.15, // 15% of screen width
                        height: screenWidth * 0.15, // Maintain aspect ratio
                    ),
                    ),
                  ),
                ),
                  SizedBox(width: screenWidth * 0.02), // Space between logo and title
              ], // Row for logo and title
            ),
            
          ),
          
          //----------------------------------------------------------------
          //--------------------------- Send Row ---------------------------
          //----------------------------------------------------------------
          BuildDrawerItem(
            icon: Icons.send_rounded, 
            label: 'Send', 
            onTap: () => navigateTo(context, const SendFilesScreen())
          ),
          
          //----------------------------------------------------------------
          //--------------------------- Receive Row ------------------------
          //----------------------------------------------------------------
          BuildDrawerItem(
            icon: Icons.download_rounded, 
            label: 'Receive', 
            onTap: () => navigateTo(context, const TabletReceiveScreen())
          ),
          //----------------------------------------------------------------
          //--------------------------- About Row --------------------------
          //----------------------------------------------------------------
          BuildDrawerItem(
            icon: Icons.info_rounded, 
            label: 'About', 
            onTap: () => navigateTo(context, const AboutScreen())
          ),
          
          // Spacer to push content to top
          const Spacer(),
          
        ],
      ),
    );
  }
}