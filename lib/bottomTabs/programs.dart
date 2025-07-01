import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';
import 'package:together_test/staticData/data.dart';

class Programs extends StatelessWidget {
  const Programs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Programs',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.neutral100,
          ),
        ),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        leading: Column(
          children: [
            IconButton(
              icon: Image.asset(
                'images/backIcon.png',
                width: 32,
                height: 32,
                color: AppColors.neutral100,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFF4FCFF),
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: programs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                'programDetails',
                                arguments: programs[index]['name'],
                              );
                              print(programs[index]['name']);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.neutral100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,

                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 15,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 52,
                                        height: 39,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              '${programs[index]['logo']}',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        programs[index]['name'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.neutral10,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
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
            ),
          ],
        ),
      ),
    );
  }
}
