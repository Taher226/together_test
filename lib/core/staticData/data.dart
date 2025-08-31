import 'package:flutter/material.dart';

// List organizations = [
//   {'title': 'Hands for charity', 'icon': 'images/handsLogo.png'},
//   {'title': 'Global Giving', 'icon': 'images/globalLogo.png'},
//   {'title': 'Crow Rise', 'icon': 'images/crowLogo.png'},
//   {'title': 'Hands for charity', 'icon': 'images/handsLogo.png'},
//   {'title': 'Global Giving', 'icon': 'images/globalLogo.png'},
//   {'title': 'Crow Rise', 'icon': 'images/crowLogo.png'},
// ];
List campaigns = [
  {'name': 'Winter Campaign', 'logo': 'images/campaignHome.png'},
  {'name': 'Spring Campaign', 'logo': 'images/campaignHome.png'},
  {'name': 'Summer Campaign', 'logo': 'images/campaignHome.png'},
  {'name': 'Autumn Campaign', 'logo': 'images/campaignHome.png'},
];
List programs = [
  {'name': 'Orphan Sponsorship', 'logo': 'images/programHome1.png'},
  {'name': 'Water Wells', 'logo': 'images/programHome2.png'},
  {'name': 'Refuge Reliefs', 'logo': 'images/refugeeReliefs.png'},
  {'name': 'Zakat', 'logo': 'images/zakat.png'},
];
List<Map> modalOrganizations = [
  {'id': 1, 'name': 'Hands For Charity', 'logo': 'images/homeCharityLogo.png'},
  {'id': 2, 'name': 'Charity Foundation', 'logo': 'images/homeCharityLogo.png'},
  {
    'id': 3,
    'name': 'Environmental Conservation Group',
    'logo': 'images/homeCharityLogo.png',
  },
];
List quickTools = [
  {'name': 'Zakat\nCalculator', 'logo': 'images/calculatorIcon.png'},
  {'name': 'Prayer\nTimes', 'logo': 'images/prayerIcon.png'},
  {'name': 'Dhikr\nCounter', 'logo': 'images/dhikrIcon.png'},
  {
    'name': 'Transaction\nHistory',
    'logo': 'images/transactionsHistoryMore.png',
  },
];
List sliders = ['images/slider.png', 'images/slider.png', 'images/slider.png'];
List aboutUsSections = [
  {
    'isExpand': true,
    'title': 'Who We Are',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
  {
    'isExpand': false,
    'title': 'Our Vision',
    'icon': 'images/visionIcon.png',
    'content':
        'We hope for a world where every human being has access to all basic life necessities to live with dignity and security.',
  },
  {
    'isExpand': false,
    'icon': 'images/missionIcon.png',
    'title': 'Our Mission',
    'content':
        'We are committed to working hard to assist people in need and ensure they have the minimum living requirements, including: clean water, education, food, shelter, and healthcare.',
  },
];
List faqSections = [
  {
    'isExpand': true,
    'title': 'Question 1',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
  {
    'isExpand': false,
    'title': 'Question 2',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
  {
    'isExpand': false,
    'title': 'Question 3',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
  {
    'isExpand': false,
    'title': 'Question 4',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
  {
    'isExpand': false,
    'title': 'Question 5',
    'content':
        'Hands for Charity is a relief and development organization with a huge world vision. We want to build better societies, and with your help, we can permanently end the cycles of need and poverty. Therefore, we strive to make a big difference from minor changes.',
  },
];
List subscriptions = [
  {
    'title': 'Orphan Sponsorship, Sponsor orphan in palestine',
    'type': 'Programs',
    'donationPlan': 'One Orphan',
    'nextPayment': '25 Jan, 2025',
    'paymentGateway': 'Stripe',
    'paymentAmount': '\$50.00',
    'subscriptionID': '23323223',
  },
  {
    'title': 'Graphic Design',
    'type': 'Courses',
    'nextPayment': '25 Jan, 2025',
    'paymentGateway': 'Stripe',
    'paymentAmount': '\$50.00',
    'subscriptionID': '23323223',
  },
];
List transactions = [
  {
    'isSelected': true,
    'title': 'Orphan Sponsorship, Sponsor Orphan In Palestine',
    'type': 'Programs',
    'amount': '\$ 100.00',
    'plan': 'One Orphan',
    'paymentType': 'Monthly',
    'gateway': 'Stripe',
    'id': '23342342312',
    'date': '17 Aug, 2024',
  },
  {
    'isSelected': false,
    'title': 'Graphic Design',
    'type': 'Courses',
    'amount': '\$ 100.00',
    'paymentType': 'Monthly',
    'gateway': 'Stripe',
    'id': '23342342312',
    'date': '17 Aug, 2024',
  },
  {
    'isSelected': false,
    'title': 'Graphic Design',
    'type': 'Courses',
    'amount': '\$ 100.00',
    'paymentType': 'Monthly',
    'gateway': 'Stripe',
    'id': '23342342312',
    'date': '17 Aug, 2024',
  },
];

List transactionCategories = [
  {'isSelected': true, 'title': 'Programs'},
  {'isSelected': true, 'title': 'Courses'},
  {'isSelected': false, 'title': 'Campaigns'},
];
List programType = [
  {'id': 1, 'name': 'Sponsor Orphan in Palestine'},
  {'id': 2, 'name': 'Sponsor Orphan in Lebanon'},
  {'id': 3, 'name': 'Sponsor Orphan in Egypt'},
];
List frequentType = [
  {'id': 1, 'name': 'Daily'},
  {'id': 2, 'name': 'Weekly'},
  {'id': 3, 'name': 'Monthly'},
  {'id': 4, 'name': 'Yearly'},
];
List plans = [
  {'id': 1, 'name': '1 Orphan'},
  {'id': 2, 'name': '2 Orphans'},
  {'id': 3, 'name': '3 Orphans'},
];
List paymentMethods = [
  {
    'id': 1,
    'name': 'Credit card/Stripe',
    'icon': [
      'images/stripeIcon.png',
      'images/visaIcon.png',
      'images/masterCardIcon.png',
    ],
  },
  {
    'id': 2,
    'name': 'Pay Pal',
    'icon': ['images/paypalIcon.png'],
  },
];

List<DropdownMenuEntry<String>> countries = [
  DropdownMenuEntry(value: 'Egypt', label: 'Egypt'),
  DropdownMenuEntry(value: 'France', label: 'France'),
  DropdownMenuEntry(value: 'Spain', label: 'Spain'),
  DropdownMenuEntry(value: 'Argentina', label: 'Argentina'),
  DropdownMenuEntry(value: 'Morocco', label: 'Morocco'),
];
List<DropdownMenuEntry<String>> provinces = [
  DropdownMenuEntry(value: 'Alexandria', label: 'Alexandria'),
  DropdownMenuEntry(value: 'Cairo', label: 'Cairo'),
  DropdownMenuEntry(value: 'Giza', label: 'Giza'),
  DropdownMenuEntry(value: 'Port Said', label: 'Port Said'),
  DropdownMenuEntry(value: 'Ismailia', label: 'Ismailia'),
];
