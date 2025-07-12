import 'package:flutter/material.dart';

class MobileAppbar extends StatelessWidget implements PreferredSizeWidget {

  const MobileAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56); // I chose 56 because it's the default height for AppBar in Flutter.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF134859),
      automaticallyImplyLeading: true, // Allows the leading widget to be displayed
      elevation: 0,
      leading: Builder(
        builder: (context) => 
          //--------------------------------------
          //------------- Menu Icon --------------
          //--------------------------------------
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            Icons.menu_rounded,
            color: Color(0xFFFFC93C), // Yellow color for the menu icon
            size: 50, // Size of the menu icon
          ),
        )

      ),
    );
  }


}