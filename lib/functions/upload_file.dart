import 'dart:io';
import 'package:file_picker/file_picker.dart';

Future<List<File>?> uploadFiles() async {
  try {
    // Use the instance method instead of static method
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: [
        'pdf', 'docx', 'txt', 'jpg', 'png', 'fb2', 'epub', 
        'cbz', 'cbr', 'lit', 'mobi', 'azw', 'azw3', 'rtf', 
        'pptx', 'doc', 'ppt'
      ],
    );

    if (result != null) {
      return result.paths
        .where((path) => path != null)
        .map((path) => File(path!))
        .toList();
    }
    return null;
  } catch (e) {
    print("Error picking files: $e");
    rethrow; // Rethrow to see full error in logs
  }
}