import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/functions/format_file_size.dart';

class MobileImageCard extends StatelessWidget {

  final File image;
  final VoidCallback onRemove;

  const MobileImageCard(
    {
      super.key,
      required this.image,
      required this.onRemove,
    }
  );

  @override
  Widget build(BuildContext context) {

    final imageName = image.path.split('/').last;
    final imageSize = formatFileSize(image.lengthSync());
    
    return Card(
      color: Color(0xFF145769),
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: $imageName',
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Size: $imageSize',
                    style: GoogleFonts.josefinSans(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.close_rounded, color: Colors.black),
              onPressed: onRemove,
            ),
          ],
        ),
      ),

    );
  }
  
}