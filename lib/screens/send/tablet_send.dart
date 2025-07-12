import 'package:flutter/foundation.dart' show debugPrintThrottled;
import 'package:flutter/material.dart';
import 'package:software_project_1/widgets/tablet/tablet_appbar.dart';
import 'package:software_project_1/widgets/tablet/tablet_drawer.dart';
import 'package:software_project_1/widgets/upload_card.dart';


//Gonna make this a stateful widget coz we need to handle file picking
class SendFilesScreen extends StatelessWidget {

  const SendFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    debugPrint(String? message, {int? wrapWidth}) {
      debugPrintThrottled(message, wrapWidth: wrapWidth?? 800); // Default wrap width for debug messages
    }
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
                        //----------------------------------------------------------------
                        //--------------------------- Upload Card ------------------------
                        //----------------------------------------------------------------
                        child: UploadCard( 
                          onFilesPicked: (files) {
                            if (files != null) {
                              // Handle the picked files here
                              // For example, you can print the file paths
                              for (var file in files) {
                                var message = 'Picked file: ${file.path}';
                                debugPrint(message);
                              }
                            } else {
                              // Handle the case when no files were picked
                              debugPrint('No files were picked');
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
  
