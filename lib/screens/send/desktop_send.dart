import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopSendScreen extends StatelessWidget {
  const DesktopSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF155263), // Main background
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Stack(
              children: [
                //----------------------------------------------------------------
                //----------------------------- Logo -----------------------------
                //----------------------------------------------------------------
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/logo_yellow.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),

                //----------------------------------------------------------------
                //-------------------------- Column Content ---------------------
                //----------------------------------------------------------------
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //----------------------------------------------------------------
                      //---------------------- SEND / RECEIVE Labels -------------------
                      //----------------------------------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'SEND',
                            style: GoogleFonts.josefinSans(
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.2,
                              color: const Color(0xFFFFC93C),
                            ),
                          ),
                          Text(
                            'RECEIVE',
                            style: GoogleFonts.josefinSans(
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 3.2,
                              color: const Color(0xFFFFC93C),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 60),

                      //----------------------------------------------------------------
                      //------------------------ Upload Card -------------------------
                      //----------------------------------------------------------------
                      Container(
                        width: screenWidth * 0.75,
                        height: 280,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //----------------------------------------------------------------
                            //------------------------- Upload Icon -------------------------
                            //----------------------------------------------------------------
                            Container(
                              width: 105,
                              height: 105,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/upload_icon.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            const SizedBox(height: 20),

                            //----------------------------------------------------------------
                            //-------------------- "Drop your files..." ---------------------
                            //----------------------------------------------------------------
                            Text(
                              'Drop your files here...',
                              style: GoogleFonts.josefinSans(
                                fontSize: 36,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.8,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //----------------------------------------------------------------
                //------------------------- Submit Button ------------------------
                //----------------------------------------------------------------
                Positioned(
                  bottom: 40,
                  right: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement sending logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC93C),
                      foregroundColor: const Color(0xFF155263),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: GoogleFonts.josefinSans(
                        fontSize: 32,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    child: const Text('SUBMIT'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
