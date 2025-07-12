
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/responsive/device_info.dart';

class BuildDrawerItem extends StatelessWidget {

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BuildDrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  @override
Widget build(BuildContext context) {
  final double screenWidth = MediaQuery.of(context).size.width;

  final deviceType = DeviceInfo.getDeviceType(context);

  final bool isTablet = deviceType == DeviceType.tablet;

  final double iconSize = isTablet ? 45.0 : 35.0;
  final double fontSize = isTablet ? 40.0 : 32.0;
  final double paddingVertical = isTablet ? 35.0 : 15.0;

  return InkWell(
    onTap: onTap,
    splashColor: const Color(0xFF134859),
    highlightColor: const Color(0xFF134859),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: screenWidth * 0.016,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: iconSize,
            color: const Color(0xFF134859),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.josefinSans(
                fontSize: fontSize, // 4% of screen width
                fontWeight: FontWeight.w600,
                height: 1.2,
                color: const Color(0xFF134859),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}