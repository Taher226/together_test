import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Programs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.neutral10,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('programs');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: programs.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed('programDetails', arguments: programs[i]['name']);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          '${programs[i]['logo']}',
                          height: 130,
                        ),
                      ),
                      Text(
                        programs[i]['name'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutral10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
