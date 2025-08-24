import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class DhikrCounter extends StatefulWidget {
  const DhikrCounter({super.key});

  @override
  State<DhikrCounter> createState() => _DhikrCounterState();
}

class _DhikrCounterState extends State<DhikrCounter> {
  int dhikrCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/dhikrcounterFrame.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 67,
            child: Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.neutral90,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                '$dhikrCounter',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral10,
                ),
              ),
            ),
          ),

          Positioned(
            top: 45,
            right: 40,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close, size: 24, color: AppColors.neutral100),
            ),
          ),

          Positioned(
            top: 160,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dhikrCounter = 0;
                });
              },
              child: Row(
                children: [
                  Image.asset('images/resetButton.png', width: 24, height: 24),
                  SizedBox(width: 10),
                  Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutral100,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 37,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  dhikrCounter++;
                });
              },
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neutral90,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Tap',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.neutral10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Image.asset(
              'images/dhikrCounterFrame2.png',
              fit: BoxFit.contain,
              color: AppColors.neutral90,
            ),
          ),
        ],
      ),
    );
  }
}
