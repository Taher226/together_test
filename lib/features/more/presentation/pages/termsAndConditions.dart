import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/more/presentation/widgets/termsSection.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
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
          'Terms & Conditions',
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
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'General Terms (Apply to All Users)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    TermsSection(
                      title: 'Acceptance of Terms:',
                      description:
                          '. By subscribing to or using Together’s platform, the client agrees to these terms and conditions.',
                    ),

                    SizedBox(height: 30),
                    TermsSection(
                      title: 'Prohibited Use:',
                      description:
                          '. Clients and their users are strictly prohibited from using the platform for illegal, fraudulent, defamatory, or abusive purposes.',
                    ),

                    SizedBox(height: 30),
                    TermsSection(
                      title: 'Intellectual Property:',
                      description:
                          '. All content, tools, and technology provided remain the intellectual property of Together. Clients are granted a limited, non-transferable license to use the platform as outlined in their selected plan.',
                    ),

                    SizedBox(height: 30),
                    TermsSection(
                      title: 'Liability Limitation:',
                      description:
                          '. Together is not responsible for any damages resulting from platform misuse, data loss, or downtime. Use is at your own risk.',
                    ),

                    SizedBox(height: 20),
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
