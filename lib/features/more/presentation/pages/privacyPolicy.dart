import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          'Privacy Policy',
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last updated: January 16, 2025\nThis Privacy Policy includes important information about your personal data and we encourage you to read it carefully.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutral10,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We provide financial infrastructure for the internet. Individuals and businesses of all sizes use our technology and services to facilitate purchases, accept payments, send payouts, and manage online businesses.\nThis Privacy Policy (“Policy”) describes the Personal Data that we collect, how we use and share it, and details on how you can reach us with privacy-related inquiries. The Policy also outlines your rights and choices as a data subject, including the right to object to certain uses of your Personal Data.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Defined Terms',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutral10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            'In this Policy,  “we”, “our,” or “us” refers to the entity responsible for the collection, use, and handling of Personal Data as described in this document. Depending on your jurisdiction, the specific Stripe entity accountable for your Personal Data might vary.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral20,
                            ),
                          ),
                          Text(
                            '“Personal Data” refers to any information associated with an identified or identifiable individual, which can include data that you provide to us, and that we collect about you during your interaction with our Services (such as device information, IP address, etc.).',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral20,
                            ),
                          ),
                          Text(
                            '“Services” refers to the products, services, devices, and applications, that we provide under the Stripe Services Agreement (“Business Services”) or the Stripe Consumer Terms of Service (“End User Services”); websites (“Sites”) like Stripe.com and Link.com; and other Stripe applications and online services. We provide Business Services to entities (“Business Users”). We provide End User Services directly to individuals for their personal use. “Financial Partners” are financial institutions, banks, and other partners such as payment method acquirers, payout providers, and card networks that we partner with to provide the Services.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.neutral20,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '1. Personal Data we collect and how we use and share it',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Our collection and use of Personal Data differs based on whether you are an End User, End Customer, Representative, or Visitor, and the specific Service that you are using. For example, if you’re a sole proprietor who wants to use our Business Services, we may collect your Personal Data to onboard your business; at the same time, you might also be an End Customer if you’ve bought goods from another Business User that is using our Services for payment processing. You could also be an End User if you used our End User Service, such as Link, for those transactions.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutral20,
                      ),
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
