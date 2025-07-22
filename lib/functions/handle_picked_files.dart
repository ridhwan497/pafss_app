
import 'dart:io';
import 'package:flutter/material.dart';

//Function handles the 'what to do with the picked files' logic

void handleFilesPicked(
  {
    required List<File>? files,
    required List<File> selectedFiles,
    required VoidCallback onUpdate,
  }
) {

  if(files != null && files.isNotEmpty) {
    selectedFiles.addAll(files);
    onUpdate();
  }

}