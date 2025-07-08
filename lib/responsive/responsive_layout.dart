import 'device_info.dart';
import 'package:software_project_1/screens/desktop.dart';
import 'package:software_project_1/screens/mobile.dart';
import 'package:software_project_1/screens/tablet.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  // This class is used to determine the layout based on the screen size.
  // It uses the DeviceInfo class to get the device type and then returns a widget based
  // on the device type.

  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {

    // getting the device type using the DeviceInfo class
    final deviceType = DeviceInfo.getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return const MobileScreen();
      case DeviceType.tablet:
        return const TabletScreen();
      case DeviceType.desktop:    
        return const DesktopScreen();
    }

  }
}
