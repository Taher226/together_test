import 'package:flutter/material.dart';
import 'package:together_test/features/home/presentation/widgets/DhikrCounter.dart';
import 'package:together_test/features/home/presentation/widgets/campaignsSection.dart';
import 'package:together_test/features/home/presentation/widgets/eventCard.dart';
import 'package:together_test/features/home/presentation/widgets/newsletterCard.dart';
import 'package:together_test/features/home/presentation/widgets/organizationsModal.dart';
import 'package:together_test/features/home/presentation/widgets/programsSection.dart';
import 'package:together_test/features/home/presentation/widgets/quickToolsSection.dart';
import 'package:together_test/features/home/presentation/widgets/sliderSection.dart';
import 'package:together_test/features/home/presentation/widgets/volunteerCard.dart';
import 'package:together_test/core/config/theme/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController newsletterNameController = TextEditingController();
  TextEditingController newsletterEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    openOrganizationsModal() {
      return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return OrganizationsModal();
        },
      );
    }

    showDhikrCounter() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DhikrCounter();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral100,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 50,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Image.asset(
            'images/homeCharityLogo.png',
            width: 32,
            height: 32,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/homeAlarmIcon.png',
              width: 32,
              height: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('images/homeCartIcon.png', width: 32, height: 32),
          ),
        ],
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5),
              child: Text(
                'Hands For Charity',
                style: TextStyle(
                  color: AppColors.neutral10,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
                softWrap: true,
              ),
            ),
            InkWell(
              onTap: () {
                openOrganizationsModal();
              },
              child: Image.asset(
                'images/homeVector.png',
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 63,
        height: 63,
        child: FloatingActionButton(
          onPressed: () {
            showDhikrCounter();
          },
          child: Image.asset(
            'images/dhikrFloatingButton.png',
            width: 28,
            height: 28,
          ),
          backgroundColor: AppColors.neutral10.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color(0xFFF4FCFF),
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SliderSection(),
                    SizedBox(height: 20),
                    ProgramsSection(),
                    SizedBox(height: 30),
                    CampaignsSection(),
                    SizedBox(height: 20),
                    QuickToolsSection(),
                    SizedBox(height: 30),
                    EventCard(),
                    SizedBox(height: 30),
                    VolunteerCard(),
                    SizedBox(height: 30),
                    Newslettercard(
                      nameController: newsletterNameController,
                      emailController: newsletterEmailController,
                      onPressed: () {
                        print(
                          'Newsletter Subscription: ${newsletterNameController.text}, ${newsletterEmailController.text}',
                        );
                      },
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
