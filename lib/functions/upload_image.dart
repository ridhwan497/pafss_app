
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

Future<List<File>?> pick_images() async {

  final ImagePicker imagePicker = ImagePicker();

  debugPrint(String? message, {int? wrapWidth}) {
      debugPrintThrottled(message, wrapWidth: wrapWidth?? 800); // Default wrap width for debug messages
    } 

  try {

    final List<XFile> pickedImages = await imagePicker.pickMultiImage();

    return pickedImages.map((xfile) => File(xfile.path)).toList();
    
  } catch (e) {
    debugPrint("Error Picking Images: $e");
    rethrow;
    
  }
}