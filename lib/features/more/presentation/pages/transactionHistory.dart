import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  TextEditingController searchController = TextEditingController();
  List filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
  }

  void filterItems(String query) {
    setState(() {
      filteredTransactions =
          transactions
              .where(
                (item) =>
                    item['title']!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

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
          'Transactions History',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        controller: searchController,
                        onChanged: filterItems,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: AppColors.neutral10,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: AppColors.neutral10,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.neutral80,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        cursorColor: AppColors.primary,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        'Filters',
                        style: TextStyle(
                          color: AppColors.neutral10,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print('From Date selected');
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.neutral90,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                        color: AppColors.neutral10,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: AppColors.neutral10,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print('To Date selected');
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.neutral90,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'To',
                                      style: TextStyle(
                                        color: AppColors.neutral10,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      color: AppColors.neutral10,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showCategories();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.neutral90,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Category',
                                      style: TextStyle(
                                        color: AppColors.neutral10,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.neutral10,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredTransactions.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.neutral100,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.neutral90,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        filteredTransactions[i]['isSelected'] =
                                            !filteredTransactions[i]['isSelected'];
                                      });
                                    },
                                    child:
                                        filteredTransactions[i]['isSelected'] ==
                                                true
                                            ? Icon(
                                              Icons.check_box,
                                              color: AppColors.primary,
                                            )
                                            : Icon(
                                              Icons.check_box_outline_blank,
                                              color: AppColors.primary,
                                            ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            '${filteredTransactions[i]['title']}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.neutral10,
                                            ),
                                          ),
                                          Text(
                                            '${filteredTransactions[i]['type']}',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.neutral30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                margin: EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.neutral90,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${filteredTransactions[i]['amount']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.neutral10,
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                ),
                                child: Column(
                                  children: [
                                    filteredTransactions[i]['plan'] != null
                                        ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Donation Plan',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.neutral20,
                                              ),
                                            ),
                                            Text(
                                              filteredTransactions[i]['plan'],
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.neutral20,
                                              ),
                                            ),
                                          ],
                                        )
                                        : SizedBox.shrink(),
                                    transactions[i]['plan'] != null
                                        ? Divider(
                                          color: AppColors.neutral90,
                                          thickness: 1,
                                          height: 20,
                                        )
                                        : SizedBox.shrink(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Payment Type',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                        Text(
                                          filteredTransactions[i]['paymentType'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.neutral90,
                                      thickness: 1,
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Payment Gateway',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                        Text(
                                          filteredTransactions[i]['gateway'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                      ],
                                    ),

                                    Divider(
                                      color: AppColors.neutral90,
                                      thickness: 1,
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Transaction ID',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                        Text(
                                          filteredTransactions[i]['id'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.neutral90,
                                      thickness: 1,
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Transaction Date',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                        Text(
                                          filteredTransactions[i]['date'],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.neutral20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                        //  bool isSelected = filteredTransactions[i]['isSelected'];
                        // return TransactionSection(
                        //   isSelected: isSelected,
                        //   title: filteredTransactions[i]['title'],
                        //   type: filteredTransactions[i]['type'],
                        //   amount: filteredTransactions[i]['amount'],
                        //   plan: filteredTransactions[i]['plan'],
                        //   paymentType: filteredTransactions[i]['paymentType'],
                        //   gateway: filteredTransactions[i]['gateway'],
                        //   id: filteredTransactions[i]['id'],
                        //   date: filteredTransactions[i]['date'],
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.neutral100,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 48,
                      child: ElevatedButton.icon(
                        icon: Image.asset(
                          'images/pdfIcon.png',
                          width: 20,
                          height: 20,
                        ),

                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.neutral100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        label: FittedBox(
                          child: Text(
                            'Export as PDF (${transactions.where((item) => item['isSelected'] == true).length})',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      height: 48,

                      child: ElevatedButton.icon(
                        icon: Image.asset(
                          'images/csvIcon.png',
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.neutral100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                        label: FittedBox(
                          child: Text(
                            'Export as csv (${transactions.where((item) => item['isSelected'] == true).length})',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  showCategories() {
    return showModalBottomSheet(
      backgroundColor: AppColors.neutral100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 50,
                    child: Divider(thickness: 3, color: Color(0xFFABB7C2)),
                  ),
                  SizedBox(height: 10),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter by Category',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.neutral10,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,
                            color: AppColors.neutral10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.neutral90, height: 10),

                  Container(
                    margin: EdgeInsets.all(8),
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return Divider(color: AppColors.neutral90, height: 10);
                      },
                      itemCount: transactionCategories.length,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              transactionCategories[i]['isSelected'] =
                                  !transactionCategories[i]['isSelected'];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                transactionCategories[i]['isSelected'] == true
                                    ? Icon(
                                      Icons.check_box,
                                      color: AppColors.primary,
                                    )
                                    : Icon(
                                      Icons.check_box_outline_blank,
                                      color: Color(0xFFDADADA),
                                    ),
                                SizedBox(width: 5),
                                Text(
                                  transactionCategories[i]['title'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.neutral20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 43,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: AppColors.primary,
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.neutral100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
