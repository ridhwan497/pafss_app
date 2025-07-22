import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/functions/handle_picked_files.dart';
import 'package:software_project_1/functions/remove_file.dart';
import 'package:software_project_1/widgets/file_card.dart';
//import 'package:software_project_1/functions/upload_file.dart';
import 'package:software_project_1/widgets/tablet/tablet_appbar.dart';
import 'package:software_project_1/widgets/tablet/tablet_drawer.dart';
import 'package:software_project_1/widgets/upload_card.dart';


class SendFilesScreen extends StatefulWidget {
  const SendFilesScreen({super.key});

  @override
  State<SendFilesScreen> createState() => _SendFilesScreenState();
}

class _SendFilesScreenState extends State<SendFilesScreen> {
  List<File> selectedFiles = [];


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          const TabletDrawer(),
          Expanded(
            child: Column(
              children: [
                const TabletAppBar(),
                Expanded(
                  child: Container(
                    color: const Color(0xFF134859),
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        // -------------------------------------------------------
                        // ------------ Upload Card OR List of Files ------------
                        // -------------------------------------------------------
                        if (selectedFiles.isEmpty)
                          Expanded(
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return Center(
                                  child: SizedBox(
                                    width: screenWidth * 0.75, // 75% of screen width
                                    height: screenHeight * 0.6,
                                    child: UploadCard(
                                      onFilesPicked: (files) => handleFilesPicked(
                                        files: files, 
                                        selectedFiles: selectedFiles, 
                                        onUpdate: () => setState(() {}),)
                                    )
                                  ),
                                );
                              },
                            ),
                          )
                        else
                          Expanded(
                            child: Scrollbar(
                              thumbVisibility: true,
                              thickness: 6,
                              radius: const Radius.circular(10),
                              child: ListView.separated(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                itemCount: selectedFiles.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 20),
                                itemBuilder: (context, index) {
                                  final file = selectedFiles[index];
                                  return FileCard(
                                    file: file, 
                                    onRemove: () => removeFile(
                                      index: index,
                                      selectedFiles: selectedFiles,
                                      onUpdate: () => setState(() {}),
                                    ), 
                                    fontSize: screenWidth * 0.017
                                  );
                                },
                              ),
                            ),
                          ),

                        const SizedBox(height: 30),

                        // -------------------------------------------------------
                        // -------------------- Submit All Button ----------------
                        // -------------------------------------------------------
                        if (selectedFiles.isNotEmpty)
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Put the WebRTC send stuff here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFC93C),
                                foregroundColor: const Color(0xFF134859),
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.04,
                                  vertical: screenHeight * 0.015,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                textStyle: GoogleFonts.josefinSans(
                                  fontSize: screenWidth * 0.018,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              child: const Text('SUBMIT ALL'),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
