// Tablet-specific drawer widget


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/screens/send/tablet.dart';

class TabletDrawer extends StatelessWidget {
  const TabletDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate drawer width based on screen size (adaptive)
    final drawerWidth = screenWidth * 0.25; // 25% of screen width
    final minWidth = 250.0; // Minimum width for smaller tablets
    final maxWidth = 350.0; // Maximum width for larger tablets
    
    return Container(
      width: drawerWidth.clamp(minWidth, maxWidth),
      color: Color(0xFFFFC93C), // Yellow background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drawer header with logo
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 40),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo_yellow.png', //I will change this logo in canva so that it looks better
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                  const SizedBox(width: 16),
                  //Text(
                   // "PAFSS",
                   // style: GoogleFonts.josefinSans(
                    //  fontSize: 32,
                     // fontWeight: FontWeight.w600,
                     // height: 1.2,
                     // color: Color(0xFF134859),
                    //),
                  //),
              ], // Row for logo and title
            ),
          ),
          
          // Drawer items
          _buildDrawerItem(
            icon: Icons.send_rounded,
            label: 'Send',
            onTap: () => _navigateTo(context, '/send'),
          ),
          _buildDrawerItem(
            icon: Icons.download_rounded,
            label: 'Receive',
            onTap: () => _navigateTo(context, '/receive'),
          ),
          _buildDrawerItem(
            icon: Icons.info_rounded,
            label: 'About',
            onTap: () {
              Navigator.push( context, MaterialPageRoute(builder: (context) => const TabletScreen())); //Going to change this to about page
            }
          ),
          
          // Spacer to push content to top
          const Spacer(),
          
          // Footer with version info
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "v1.0.0",
              style: GoogleFonts.josefinSans(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Color(0xFF134859), // Dark teal
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Color(0xFF134859), // Dark teal splash color
      highlightColor: Color(0xFF134859), // Dark teal highlight color
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 50,
              color:  Color(0xFF134859), // Dark teal
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: GoogleFonts.josefinSans(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                height: 1.2,
                color:  Color(0xFF134859), // Dark teal
              ),
            ),
          ],
        ),
      ),
    );
  }

// This is my navigation function i will change it later to use a proper navigation system
  // For now, it just shows a snackbar with the route name.
  // In a real app, you would use Navigator.pushNamed or similar methods.
  void _navigateTo(BuildContext context, String route) {
    // Navigation logic would go here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $route'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

// Tablet-specific app bar
class TabletAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TabletAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF155263), // Dark teal
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Optional: Add a logo or title
          const SizedBox(width: 20),
          Text(
            "Dashboard",
            style: GoogleFonts.josefinSans(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFC93C), // Yellow
            ),
          ),
        ],
      ),
      
      centerTitle: false,
      elevation: 4,
    );
  }
}