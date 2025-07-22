import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/functions/handle_picked_files.dart';
import 'package:software_project_1/functions/upload_file.dart';
import 'package:software_project_1/functions/upload_image.dart';
import 'package:software_project_1/widgets/mobile/mobile_appbar.dart';
import 'package:software_project_1/widgets/mobile/mobile_drawer.dart';
import 'package:software_project_1/widgets/mobile/mobile_file_card.dart';
import 'package:software_project_1/widgets/mobile/mobile_image_card.dart';

class MobileSendScreen extends StatefulWidget {

  const MobileSendScreen({super.key});

  @override
  State<MobileSendScreen> createState() => _MobileSendScreenState();
  
}

class _MobileSendScreenState extends State <MobileSendScreen> {

  List<File> selectedFiles = [];
  List<File> selectedImages = [];

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF134859),
      appBar: MobileAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.25,
            bottom: screenHeight * 0.04,
            right: screenWidth * 0.08,
            left: screenWidth * 0.08,
          ),
          child: Column(
            children: [
              //------------------------------------------------
              //------------------ Media Button ----------------
              //------------------------------------------------
              ElevatedButton(
                onPressed: () async {
                  final images = await pick_images(); //Picking Images

                  handleFilesPicked(
                    files: images, 
                    selectedFiles: selectedImages, 
                    onUpdate: () => setState(() { })
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC93C),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.10),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      color: Colors.black,
                      size: screenWidth * 0.10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.01, //Tis the spacing between icon and text
                    ),
                    Text(
                      'Media      ', //Gave some spacing coz it looked weird af xx
                      style: GoogleFonts.josefinSans(
                        color: Color(0xFF134859),
                        fontSize: screenWidth * 0.10,
                        letterSpacing: screenWidth * 0.01,
                      )
                    )
                  ],
                ),
              ),
              ...selectedImages.map((image) {
                return MobileImageCard(
                  image: image, 
                  onRemove: () => setState(() {
                    selectedImages.remove(image);
                  })
                );
              }
              ).toList(),
              if (selectedImages.isNotEmpty) 
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Put the WebRTC send stuff here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC93C),
                    foregroundColor: const Color(0xFF134859),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: GoogleFonts.josefinSans(
                      fontSize: screenWidth * 0.05,
                      letterSpacing: 1.5,
                    ),
                  ),
                  child: const Text('Send Images'),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              //------------------------------------------------
              //--------------- Local Files Button -------------
              //------------------------------------------------

              ElevatedButton(
                onPressed: () async {
                  final files = await uploadFiles(); //Picking files

                  handleFilesPicked(
                    files: files, 
                    selectedFiles: selectedFiles, 
                    onUpdate: () => setState(() { }) //Refresh the UI 
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFC93C),
                  minimumSize: Size(screenWidth * 0.8, screenHeight * 0.10),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.folder_outlined,
                      color: Colors.black,
                      size: screenWidth * 0.10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.01, //Tis the spacing between icon and text
                    ),
                    Text(
                      'Local Files',
                      style: GoogleFonts.josefinSans(
                        color: Color(0xFF134859),
                        fontSize: screenWidth * 0.10,
                        letterSpacing: screenWidth * 0.01,
                      )
                    )
                  ],
                )
              ),
              ...selectedFiles.map((file) {
                return MobileFileCard(
                  file: file, 
                  onRemove: () => setState(() {
                    selectedFiles.remove(file);
                  })
                );
              }
              ).toList(),
              SizedBox(height: screenHeight * 0.02),
              if (selectedFiles.isNotEmpty) 
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Put the WebRTC send stuff here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFC93C),
                    foregroundColor: const Color(0xFF134859),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.015,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: GoogleFonts.josefinSans(
                      fontSize: screenWidth * 0.05,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Send Files'),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
      drawer: MobileDrawer(),
    );
  }
}
