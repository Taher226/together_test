import 'package:flutter/material.dart';
import 'package:together_test/components/more/faqSection.dart';
import 'package:together_test/constants/colors.dart';
import 'package:together_test/staticData/data.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
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
          'FAQ',
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
                itemCount: faqSections.length,
                itemBuilder: (context, i) {
                  bool isExpanded = faqSections[i]['isExpand'];
                  return FaqSection(
                    title: faqSections[i]['title'],
                    content: faqSections[i]['content'],
                    isExpanded: isExpanded,
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
