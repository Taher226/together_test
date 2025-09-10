import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/programs/data/repositories/programs_list_repository.dart';
import 'package:together_test/features/programs/presentation/bloc/programsList/programs_list_bloc.dart';

class Programs extends StatelessWidget {
  const Programs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              ProgramsListBloc(ProgramsListRepository())
                ..add(FetchProgramsListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'All Programs',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral100,
            ),
          ),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.18,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          leading: Column(
            children: [
              IconButton(
                icon: Image.asset(
                  'images/backIcon.png',
                  width: 32,
                  height: 32,
                  color: AppColors.neutral100,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          backgroundColor: AppColors.primary,
        ),
        body: BlocBuilder<ProgramsListBloc, ProgramsListState>(
          builder: (context, state) {
            if (state is ProgramsListLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is ProgramsListFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: AppColors.error0),
                ),
              );
            } else if (state is ProgramsListSuccess) {
              return Container(
                width: double.infinity,
                color: Color(0xFFF4FCFF),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                itemCount: state.programs.data.length,
                                itemBuilder: (context, index) {
                                  final program = state.programs.data[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        'programDetails',
                                        arguments: {
                                          'name': program.name,
                                          'id': program.id,
                                          'photo': program.photoUrl,
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.neutral100,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.8,

                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 52,
                                                height: 39,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      '${program.photoUrl}',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text(
                                                program.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.neutral10,
                                                ),
                                              ),
                                            ],
                                          ),

                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
