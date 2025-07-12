
import 'package:flutter/material.dart';
import 'package:software_project_1/widgets/tablet/tablet_appbar.dart';
import 'package:software_project_1/widgets/tablet/tablet_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Row(
        children: [
          // Permanent drawer on the left
          const TabletDrawer(),
          
          // Main content area
          Expanded(
            child: Column(
              children: [
                // App bar at the top of the content area
                const TabletAppBar(),
                
                // Main content
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Color(0xFF134859), // Dark teal background
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.75, // 75% of screen width
                        height: screenHeight * 0.6,
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}