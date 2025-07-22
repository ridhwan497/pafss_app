 import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/functions/upload_file.dart';

class UploadCard extends StatelessWidget {

  //final VoidCallback onTap;
  final Function(List<File>? files) onFilesPicked; 

  const UploadCard({
    super.key, 
    //required this.onTap,
    required this.onFilesPicked, // Callback to handle picked files
  }); // Constructor to accept the onTap callback

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
      onTap: () async{
        final files = await uploadFiles(); 
        onFilesPicked(files);
      }, // Call the onTap callback when the card is tapped
      child: Card(
        color: const Color(0xFFD9D9D9), // Yellow background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.file_upload_rounded, size: 70, color: Colors.black), // Upload icon
              const SizedBox(height: 10),
              Text(
                'Drop your files here...',
                style: GoogleFonts.josefinSans(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.80,
                    ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  } 
}