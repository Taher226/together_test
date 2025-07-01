import 'package:flutter/material.dart';
import 'package:together_test/constants/colors.dart';
import 'package:together_test/staticData/data.dart';

class OrganizationsModal extends StatefulWidget {
  const OrganizationsModal({super.key});

  @override
  State<OrganizationsModal> createState() => _OrganizationsModalState();
}

class _OrganizationsModalState extends State<OrganizationsModal> {
  var selectedOrganization = 1;

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Your NPOs Orgs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutral0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Choose An Organization',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutral30,
                ),
              ),

              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutral80),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(color: AppColors.neutral90, height: 10);
                    },
                    itemCount: modalOrganizations.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            modalOrganizations[i]['logo'],
                          ),
                        ),
                        title: Text(modalOrganizations[i]['name']),
                        trailing:
                            selectedOrganization == modalOrganizations[i]['id']
                                ? Icon(Icons.check_circle, color: Colors.blue)
                                : null,
                        onTap: () {
                          setState(() {
                            selectedOrganization = modalOrganizations[i]['id'];
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add, color: AppColors.neutral20),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neutral90,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  label: Text(
                    'Add Another Organizations',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.neutral10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
