import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


enum DeviceType {mobile, tablet, desktop}

class DeviceInfo {

// Returns the type of device based on the platform and screen size.
  /// This method checks the platform and screen width to determine if the device is a mobile,
  /// tablet, or desktop. It uses the `kIsWeb` constant to check if the app is running on the web,
  /// and the `Platform` class to check for specific platforms like Android, iOS, Windows, Linux, and macOS.
  /// It also uses `MediaQuery` to get the screen width for mobile and tablet differentiation.
  /// Returns:
  /// - `DeviceType.mobile` for mobile devices (width < 600px).
  /// - `DeviceType.tablet` for tablets (width >= 600px).
  /// - `DeviceType.desktop` for desktop devices (Windows, Linux, macOS, or web).
  /// - `DeviceType.mobile` as a fallback for unknown platforms.
//
  static DeviceType getDeviceType(BuildContext context) {
    
    final double deviceWidth = MediaQuery.of(context).size.width;

    if (kIsWeb) return DeviceType.desktop;

    if (Platform.isAndroid || Platform.isIOS) {
      // Mobile devices are usually < 600px and since both use the same OS, thats why there is a width check
      // to differentiate between mobile and tablet.
      return deviceWidth < 800 ? DeviceType.mobile : DeviceType.tablet;
    } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      // Desktop devices
      return DeviceType.desktop;
    } else {
      // Fallback for unknown platforms: Its better to assume mobile
      return DeviceType.mobile;    
    }
  
  }
}