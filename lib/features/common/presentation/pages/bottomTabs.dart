import 'package:flutter/material.dart';
import 'package:together_test/campaigns.dart';
import 'package:together_test/donate.dart';
import 'package:together_test/features/home/presentation/pages/home.dart';
import 'package:together_test/features/more/presentation/pages/more.dart';
import 'package:together_test/features/programs/presentation/pages/programs.dart';
import 'package:together_test/core/config/theme/colors.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  var selectedScreen = 0;
  List screens = [Home(), Programs(), Donate(), Campaigns(), More()];

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: screens[selectedScreen],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          isKeyboardOpen
              ? null
              : FloatingActionButton(
                onPressed: () {
                  setState(() {
                    selectedScreen = 2;
                  });
                },
                backgroundColor: AppColors.primary,
                child: Image.asset(
                  'images/donateIcon.png',
                  width: 24,
                  height: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: AppColors.neutral100,
            currentIndex: selectedScreen,
            selectedLabelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.neutral10,
            showUnselectedLabels: true,
            onTap: (value) {
              setState(() {
                selectedScreen = value;
              });
            },

            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Image.asset(
                  'images/unselectedHomeIcon.png',
                  height: 24,
                  width: 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'images/activeProgramIcon.png',
                  height: 24,
                  width: 24,
                ),
                icon: Image.asset(
                  'images/programsBottomIcon.png',
                  height: 24,
                  width: 24,
                ),
                label: 'Programs',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.minimize, color: AppColors.neutral100),
                label: 'Donate',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'images/campaignsBottomIcon.png',
                  height: 24,
                  width: 24,
                  color: AppColors.primary,
                ),
                icon: Image.asset(
                  'images/campaignsBottomIcon.png',
                  height: 24,
                  width: 24,
                  color: AppColors.neutral10,
                ),
                label: 'Campaigns',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'images/moreBottomIcon.png',
                  height: 24,
                  width: 24,
                  color: AppColors.primary,
                ),
                icon: Image.asset(
                  'images/moreBottomIcon.png',
                  height: 24,
                  width: 24,
                  color: AppColors.neutral10,
                ),
                label: 'More',
              ),
            ],
          ),
          // Positioned(
          //   bottom: 10,

          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         selectedScreen = 2;
          //       });
          //     },
          //     child: Container(
          //       width: 64,
          //       height: 64,
          //       decoration: BoxDecoration(
          //         color: AppColors.primary,
          //         shape: BoxShape.circle,
          //         boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
          //       ),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Image.asset(
          //             'images/donateIcon.png', // غير المسار حسب اسم صورتك
          //             width: 28,
          //             height: 28,
          //             color: AppColors.neutral100,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
