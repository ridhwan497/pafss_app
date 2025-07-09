
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_project_1/widgets/tablet_drawer.dart';


// Tablet home screen
class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Permanent drawer on the left
          const TabletDrawer(),
          
          // Main content area
          Expanded(
            child: Column(
              children: [
                // App bar at the top of the content area
                const TabletAppBar(),
                
                // Main content
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF155263),
                          Color(0xFF155263),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(30),
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      children: [
                        _buildDashboardCard(
                          title: "Balance",
                          value: "\$12,450",
                          icon: Icons.account_balance_wallet,
                          color: const Color(0xFFFFC93C),
                          size:  Size(500, 300)),
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

// This one will be outside and will be called in there will be 2 send and receive cards
  Widget _buildDashboardCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required Size size,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.josefinSans(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF134859),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: color,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              style: GoogleFonts.josefinSans(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF134859),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}