import 'package:flutter/material.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';

class OrgList extends StatefulWidget {
  const OrgList({super.key});

  @override
  State<OrgList> createState() => _OrgListState();
}

class _OrgListState extends State<OrgList> {
  var control = TextEditingController();
  List filteredOrganizations = [];
  @override
  void initState() {
    super.initState();
    filteredOrganizations = organizations;
  }

  void filterItems(String query) {
    setState(() {
      filteredOrganizations =
          organizations
              .where(
                (item) =>
                    item['title']!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral100,
      body: Container(
        margin: EdgeInsets.only(top: 60),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Choose An Organization',
                style: TextStyle(
                  color: AppColors.neutral0,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                controller: control,
                onChanged: filterItems,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      control.clear();
                      filterItems('');
                    },
                    icon: Icon(Icons.close, color: AppColors.neutral40),
                  ),
                  prefixIcon: Icon(Icons.search, color: AppColors.neutral10),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.neutral80,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary, width: 1),
                  ),
                ),
                cursorColor: AppColors.primary,
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(color: AppColors.neutral90, height: 10);
                },
                itemCount: filteredOrganizations.length,

                itemBuilder: (context, i) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        print('organization');
                        Navigator.of(context).pushNamed('emailLogin');
                      },
                      leading: Image.asset(
                        '${filteredOrganizations[i]['icon']}',
                        width: 30,
                        height: 30,
                      ),
                      title: Text(
                        '${filteredOrganizations[i]['title']}',
                        style: TextStyle(
                          color: AppColors.neutral10,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: AppColors.neutral40,
                        ),
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
