import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:together_test/constants/colors.dart';
import 'package:together_test/staticData/data.dart';

class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items:
              sliders
                  .map<Widget>(
                    (item) => Image.asset(
                      item,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(sliders.length, (index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 800),
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    currentIndex == index
                        ? AppColors.primary
                        : AppColors.primary.withOpacity(0.2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
