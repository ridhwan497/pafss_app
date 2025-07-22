import 'dart:io';
import 'package:flutter/material.dart';

// Function that removes a file at a specified index
void removeFile({
  required int index,
  required List<File> selectedFiles,
  required VoidCallback onUpdate
}) {
  selectedFiles.removeAt(index);
  onUpdate();

}