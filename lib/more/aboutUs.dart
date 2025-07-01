import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';
import 'package:together_test/staticData/data.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('images/backIcon.png', width: 32, height: 32),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.neutral10,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.neutral100,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,

        color: Color(0xFFF4FCFF),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: aboutUsSections.length,
                itemBuilder: (context, i) {
                  bool isExpanded = aboutUsSections[i]['isExpand'];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        aboutUsSections[i]['isExpand'] = !isExpanded;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.neutral100,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child:
                          isExpanded == true
                              ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${aboutUsSections[i]['title']}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.expand_less,
                                        size: 24,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10),
                                  aboutUsSections[i]['icon'] != null
                                      ? Image.asset(
                                        '${aboutUsSections[i]['icon']}',
                                        width: 32,
                                        height: 32,
                                      )
                                      : SizedBox.shrink(),
                                  SizedBox(height: 10),
                                  Text(
                                    '${aboutUsSections[i]['content']}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.neutral10,
                                    ),
                                  ),
                                ],
                              )
                              : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${aboutUsSections[i]['title']}',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    size: 24,
                                    color: AppColors.primary,
                                  ),
                                ],
                              ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
