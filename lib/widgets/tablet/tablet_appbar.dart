
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabletAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TabletAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF134859), // Dark teal
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Optional: Add a logo or title
          const SizedBox(width: 20),
          Text(
            "Your Data Is Safe... We dont store it",
            style: GoogleFonts.josefinSans(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFC93C), // Yellow
            ),
          ),
        ],
      ),
      
      centerTitle: false, //Align the title to the left
      elevation: 0, // Removes these pesky shadows
    );
  }
}