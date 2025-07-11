
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/widgets/tablet_drawer.dart';
import 'package:software_project_1/widgets/upload_card.dart';


// Tablet home screen
class TabletHomeScreen extends StatelessWidget {
  
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        width: double.infinity, 
                        height: 500,
                        child: UploadCard(
                          //onTap: () {
                            // Navigate to the send screen when the card is tapped
                           // Navigator.pushNamed(context, '/send'); //Change this to 
                          //},
                          onFilesPicked: (files) {
                            if (files != null) {
                              // Handle the picked files here
                              // For example, you can print the file paths
                              for (var file in files) {
                                print('Picked file: ${file.path}');
                              }
                            } else {
                              // Handle the case when no files were picked
                              print('No files were picked');
                            }

                          },
                        ),
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