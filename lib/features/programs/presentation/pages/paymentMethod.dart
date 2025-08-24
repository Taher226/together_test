import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  var selectedPaymentMethodId = 1;

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final programName = args['programName'];
    final amount = args['amount'];
    final frequentType = args['frequentType'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset('images/backIcon.png', width: 32, height: 32),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Payment Method',
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
        color: Color(0xFFF4FCFF),
        width: double.infinity,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Payment Method',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: AppColors.neutral10,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                      itemCount: paymentMethods.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            setState(() {
                              selectedPaymentMethodId =
                                  paymentMethods[index]['id'] as int;
                            });
                          },
                          leading:
                              selectedPaymentMethodId ==
                                      paymentMethods[index]['id']
                                  ? Icon(
                                    Icons.radio_button_checked,
                                    color: AppColors.primary,
                                    size: 24,
                                  )
                                  : Icon(
                                    Icons.radio_button_unchecked,
                                    color: AppColors.neutral40,
                                    size: 24,
                                  ),
                          title: Text(
                            '${paymentMethods[index]['name']}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutral10,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                (paymentMethods[index]['icon'] as List)
                                    .map(
                                      (icon) => Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Image.asset(
                                          icon,
                                          width: 21,
                                          height: 21,
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.neutral100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.neutral10,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${programName}',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: AppColors.neutral10,
                        ),
                      ),
                      Text(
                        '\$${amount} / ${frequentType}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutral10,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Divider(color: AppColors.neutral90, thickness: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral10,
                        ),
                      ),
                      Text(
                        '\$${amount}.00',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.neutral10,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    color: AppColors.neutral100,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: double.infinity,
                      height: 48,

                      child: ElevatedButton(
                        onPressed: () {
                          print('pay now');
                        },

                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isLoggedIn == true
                                ? Text(
                                  'Pay Now',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.neutral100,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                                : Text(
                                  'Login and Donate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.neutral100,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: AppColors.neutral100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
