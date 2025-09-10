import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/features/home/data/repositories/home_programs_repository.dart';
import 'package:together_test/features/home/presentation/bloc/homePrograms/home_programs_bloc.dart';

class ProgramsSection extends StatelessWidget {
  const ProgramsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeProgramsBloc(HomeProgramsRepository())
                ..add(FetchHomeProgramsEvent(limit: 5)),
      child: BlocBuilder<HomeProgramsBloc, HomeProgramsState>(
        builder: (context, state) {
          if (state is HomeProgramsLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is HomeProgramsSuccess) {
            if (state.programs.length > 0) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Programs',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.neutral10,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('programs');
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.programs.length,
                      itemBuilder: (context, i) {
                        final program = state.programs[i];

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
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    '${program.photoUrl}',
                                    height: 130,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  program.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.neutral10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          } else if (state is HomeProgramsFailure) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(color: AppColors.error0),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
