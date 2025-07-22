
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FileCard extends StatelessWidget{

  final File file;
  final VoidCallback onRemove;
  final double fontSize;

  const FileCard(
    {
      super.key,
      required this.file,
      required this.onRemove,
      required this.fontSize
    }
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFD9D9D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),

      child: ListTile (
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        leading: const Icon(
          Icons.insert_drive_file_rounded, 
          color: Color(0xFF134859), 
          size: 32
        ),
        title: Text(
          file.path.split('/').last,
          style: GoogleFonts.josefinSans(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: Color(0xFF134859)
          ),
        ),
        trailing: IconButton(
            onPressed: onRemove, 
            icon: Icon(
              Icons.close_rounded, 
              color: Color(0xFF134859),
            )
        )
        

      ),
    );
  }

}