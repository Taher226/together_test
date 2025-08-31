import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/network/dio_helper.dart';
import 'package:together_test/features/auth/data/repositories/organization_repository.dart';
import 'package:together_test/features/auth/presentation/bloc/orgList/organizations_bloc.dart';

class OrgList extends StatefulWidget {
  //final String orgId;
  const OrgList({super.key});

  @override
  State<OrgList> createState() => _OrgListState();
}

class _OrgListState extends State<OrgList> {
  var control = TextEditingController();

  final OrganizationRepository organizationRepo = OrganizationRepository();

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              OrganizationsBloc(organizationRepo)
                ..add(LoadOrganizationsEvent()),
      child: Scaffold(
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
                child: BlocBuilder<OrganizationsBloc, OrganizationsState>(
                  builder: (context, state) {
                    return TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      controller: control,
                      onChanged: (query) {
                        context.read<OrganizationsBloc>().add(
                          FilterOrganizationsEvent(query),
                        );
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        suffixIcon: IconButton(
                          onPressed: () {
                            control.clear();
                            FocusScope.of(context).unfocus();
                            context.read<OrganizationsBloc>().add(
                              FilterOrganizationsEvent(''),
                            );
                          },
                          icon: Icon(Icons.close, color: AppColors.neutral40),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.neutral10,
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
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<OrganizationsBloc, OrganizationsState>(
                  builder: (context, state) {
                    if (state is OrganizationsLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is OrganizationsError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(
                            color: AppColors.error0,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    } else if (state is OrganizationsLoaded) {
                      final organizations = state.organizations;
                      if (organizations.isEmpty) {
                        return Center(
                          child: Text(
                            'No organizations found',
                            style: TextStyle(
                              color: AppColors.neutral0,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.neutral90,
                            height: 10,
                          );
                        },
                        itemCount: organizations.length,

                        itemBuilder: (context, i) {
                          final organization = organizations[i];
                          return ListTile(
                            onTap: () async {
                              print('ORGANIZATION ID: ${organization.id}');
                              print('===================================');
                              try {
                                final organizationDetails =
                                    await organizationRepo
                                        .getOrganizationDetails(
                                          organization.id,
                                        );
                                DioHelper.init(organizationDetails.domain);
                                Navigator.of(context).pushNamed(
                                  'emailLogin',
                                  arguments: {
                                    'id': organizationDetails.id,
                                    'domain': organizationDetails.domain,
                                  },
                                );
                                print('Details ID: ${organizationDetails.id}');
                                print('===================================');
                                print(
                                  'Details Domain: ${organizationDetails.domain}',
                                );
                                print('===================================');
                                debugPrint(
                                  "✅ BaseUrl used: ${DioHelper.dio.options.baseUrl}",
                                );
                              } catch (e) {
                                print("Error fetching details: $e");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: AppColors.error0,
                                    content: Center(
                                      child: Text(
                                        "Failed to load organization details",
                                        style: TextStyle(
                                          color: AppColors.neutral100,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            leading:
                                organization.logo != null
                                    ? Image.network(
                                      organization.logo!,
                                      width: 30,
                                      height: 30,
                                      errorBuilder:
                                          (_, __, ___) => Icon(
                                            Icons.image_not_supported,
                                            color: AppColors.error0,
                                          ),
                                    )
                                    : Icon(
                                      Icons.image_not_supported,
                                      color: AppColors.error0,
                                    ),
                            title: Text(
                              organization.name,
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
                          );
                        },
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
