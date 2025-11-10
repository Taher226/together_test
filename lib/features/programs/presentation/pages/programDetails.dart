import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:together_test/core/config/theme/colors.dart';
import 'package:together_test/core/staticData/data.dart';
import 'package:together_test/features/programs/data/repositories/program_details_repository_impl.dart';
import 'package:together_test/features/programs/domain/useCases/program_details_useCase.dart';
import 'package:together_test/features/programs/presentation/bloc/programDetails/program_details_bloc.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({super.key});

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  var selectedProject = 1;
  var selectedFrequentType = 1;
  var selectedPlan = 1;
  var isGiveOnceOnly = false;
  var isFrequent = false;
  var isExpanded = false;

  final TextEditingController inputController = TextEditingController();
  void increment() {
    int currentValue = int.tryParse(inputController.text) ?? 0;
    currentValue++;
    inputController.text = currentValue.toString();
  }

  void decrement() {
    int currentValue = int.tryParse(inputController.text) ?? 0;
    if (currentValue > 0) currentValue--;
    inputController.text = currentValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    var selectedFrequentTypeName =
        frequentType.firstWhere(
          (element) => element['id'] == selectedFrequentType,
        )['name'];
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return BlocProvider(
      create:
          (context) => ProgramDetailsBloc(
            ProgramDetailsUseCase(ProgramDetailsRepositoryImpl()),
          )..add(ProgramDetailsRequestEvent(args['id'])),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${args['name']}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral100,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.0),
                bottomRight: Radius.circular(24.0),
              ),
              image: DecorationImage(
                image: NetworkImage(args['photo']),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.primary.withOpacity(
                    0.8,
                  ), // Blue overlay with opacity
                  BlendMode
                      .srcATop, // Or use BlendMode.darken for a darker effect
                ),
              ),
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
          backgroundColor:
              Colors.transparent, // AppColors.primary.withOpacity(0.7),
        ),
        body: BlocBuilder<ProgramDetailsBloc, ProgramDetailsState>(
          builder: (context, state) {
            if (state is ProgramDetailsLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            } else if (state is ProgramDetailsFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(color: AppColors.error0),
                ),
              );
            } else if (state is ProgramDetailsSuccess) {
              final program = state.entity..data!;
              final project = program.data?.projects;
              final selectedProjectObj =
                  project != null && project.isNotEmpty
                      ? project.firstWhere(
                        (proj) => proj.id == selectedProject,
                        orElse: () => project.first,
                      )
                      : null;

              final plans = selectedProjectObj?.plans ?? [];

              return Container(
                width: double.infinity,
                color: Color(0xFFF4FCFF),
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 63,
                              child: ListView.builder(
                                itemCount: state.entity.data!.projects!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedProject =
                                            state.entity.data!.projects![i].id!;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color:
                                              selectedProject ==
                                                      state
                                                          .entity
                                                          .data!
                                                          .projects![i]
                                                          .id!
                                                  ? AppColors.primary
                                                  : AppColors.neutral80,
                                          width: 1,
                                        ),
                                      ),
                                      margin: EdgeInsets.all(10),
                                      padding: EdgeInsets.all(10),
                                      child:
                                          selectedProject ==
                                                  state
                                                      .entity
                                                      .data!
                                                      .projects![i]
                                                      .id!
                                              ? Row(
                                                children: [
                                                  Icon(
                                                    Icons.done,
                                                    color: AppColors.primary,
                                                    size: 20,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    state
                                                        .entity
                                                        .data!
                                                        .projects![i]
                                                        .name!,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                ],
                                              )
                                              : Text(
                                                state
                                                    .entity
                                                    .data!
                                                    .projects![i]
                                                    .name!,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.neutral30,
                                                ),
                                              ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            program.data?.type == 'detailed'
                                ? Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Text(
                                        state.entity.data!.description!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.neutral20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                bottom:
                                                    MediaQuery.of(
                                                      context,
                                                    ).viewInsets.bottom,
                                              ),
                                              child: SingleChildScrollView(
                                                child: Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      SizedBox(
                                                        width: 50,
                                                        child: Divider(
                                                          thickness: 3,
                                                          color: Color(
                                                            0xFFABB7C2,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),

                                                      Container(
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                            ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Choose Plan',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    AppColors
                                                                        .neutral10,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                              child: Icon(
                                                                Icons.close,
                                                                size: 24,
                                                                color:
                                                                    AppColors
                                                                        .neutral10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        color:
                                                            AppColors.neutral90,
                                                        height: 10,
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets.all(
                                                          10,
                                                        ),
                                                        child: SizedBox(
                                                          height: 180,
                                                          child: ListView.separated(
                                                            separatorBuilder: (
                                                              context,
                                                              i,
                                                            ) {
                                                              return Divider(
                                                                color:
                                                                    AppColors
                                                                        .neutral90,
                                                                height: 10,
                                                              );
                                                            },
                                                            itemCount:
                                                                plans.length,
                                                            itemBuilder: (
                                                              context,
                                                              i,
                                                            ) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    selectedPlan =
                                                                        plans[i]
                                                                            .id!;
                                                                  });
                                                                },
                                                                child: Container(
                                                                  margin:
                                                                      EdgeInsets.all(
                                                                        10,
                                                                      ),
                                                                  child: Row(
                                                                    children: [
                                                                      selectedPlan ==
                                                                              plans[i].id!
                                                                          ? Icon(
                                                                            Icons.radio_button_checked,
                                                                            color:
                                                                                AppColors.primary,
                                                                            size:
                                                                                24,
                                                                          )
                                                                          : Icon(
                                                                            Icons.radio_button_unchecked,
                                                                            color:
                                                                                AppColors.neutral70,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                      SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        plans[i]
                                                                            .name!,
                                                                        style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              AppColors.neutral20,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 20),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.neutral100,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(2),
                                            bottomRight: Radius.circular(2),
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                          ),
                                          border: Border(
                                            bottom: BorderSide(
                                              color: AppColors.neutral70,
                                              width: 1,
                                            ),
                                          ),
                                        ),

                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.radio_button_checked,
                                                  color: AppColors.primary,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  plans
                                                          .firstWhere(
                                                            (plan) =>
                                                                plan.id ==
                                                                selectedPlan,
                                                            orElse:
                                                                () =>
                                                                    plans.first,
                                                          )
                                                          .name ??
                                                      '',

                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.neutral20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.expand_more,
                                              size: 24,
                                              color: AppColors.neutral10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                : SizedBox.shrink(),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.neutral100,
                                border: Border.all(
                                  color: AppColors.neutral90,
                                  width: 1,
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    'Donation Details',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.neutral20,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  isGiveOnceOnly == true
                                      ? Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 140,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          color: AppColors.neutral90,
                                          border: Border.all(
                                            color: AppColors.neutral90,
                                            width: 1,
                                          ),
                                        ),
                                        child: Text(
                                          'Give Once',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.neutral10,
                                          ),
                                        ),
                                      )
                                      : Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),

                                          border: Border.all(
                                            color: AppColors.neutral90,
                                            width: 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isFrequent = true;
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        isFrequent == true
                                                            ? AppColors.primary
                                                            : AppColors
                                                                .neutral100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 3,
                                                  ),

                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                          left: 5,
                                                        ),
                                                        child: Image.asset(
                                                          'images/frequentIcon.png',
                                                          width: 20,
                                                          height: 20,
                                                          color:
                                                              isFrequent == true
                                                                  ? AppColors
                                                                      .neutral100
                                                                  : AppColors
                                                                      .neutral30,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Give Frequent',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              isFrequent == true
                                                                  ? AppColors
                                                                      .neutral100
                                                                  : AppColors
                                                                      .neutral30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isFrequent = false;

                                                    final hasSelectedPlan =
                                                        plans.any(
                                                          (plan) =>
                                                              plan.id ==
                                                              selectedPlan,
                                                        );
                                                    if (hasSelectedPlan) {
                                                      final selectedPlanData =
                                                          plans.firstWhere(
                                                            (plan) =>
                                                                plan.id ==
                                                                selectedPlan,
                                                          );
                                                      inputController.text =
                                                          selectedPlanData
                                                              .singleAmount
                                                              ?.toString() ??
                                                          '';
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        isFrequent == false
                                                            ? AppColors.primary
                                                            : AppColors
                                                                .neutral100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                  ),

                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 10,
                                                  ),

                                                  child: Center(
                                                    child: Text(
                                                      'Give Once',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color:
                                                            isFrequent == false
                                                                ? AppColors
                                                                    .neutral100
                                                                : AppColors
                                                                    .neutral30,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,

                                      onTapOutside: (event) {
                                        FocusScope.of(context).unfocus();
                                      },
                                      controller: inputController,
                                      onChanged: (value) {
                                        print('value is $value');
                                      },
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.neutral10,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: '20 CAD',
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Icon(
                                            Icons.attach_money,
                                            color: AppColors.neutral60,
                                          ),
                                        ),
                                        prefixIconConstraints: BoxConstraints(
                                          minWidth: 0,
                                          minHeight: 0,
                                        ),

                                        suffixIconConstraints: BoxConstraints(
                                          minWidth: 0,
                                          minHeight: 0,
                                        ),

                                        suffixIcon: Container(
                                          margin: EdgeInsets.only(right: 15),
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  increment();
                                                  print('plus');
                                                },
                                                child: Icon(
                                                  Icons.keyboard_arrow_up,
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              InkWell(
                                                onTap: () {
                                                  decrement();
                                                  print('minus');
                                                },
                                                child: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.neutral90,
                                            width: 1,
                                            style: BorderStyle.solid,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.primary,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  isFrequent == true
                                      ? SizedBox(
                                        height: 50,
                                        child: ListView.builder(
                                          itemCount: frequentType.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedFrequentType =
                                                      frequentType[i]['id'];

                                                  final hasSelectedPlan = plans
                                                      .any(
                                                        (plan) =>
                                                            plan.id ==
                                                            selectedPlan,
                                                      );

                                                  if (hasSelectedPlan) {
                                                    final selectedPlanData =
                                                        plans.firstWhere(
                                                          (plan) =>
                                                              plan.id ==
                                                              selectedPlan,
                                                        );

                                                    if (frequentType[i]['name'] ==
                                                        "Daily") {
                                                      inputController.text =
                                                          selectedPlanData
                                                              .dailyAmount
                                                              ?.toString() ??
                                                          '';
                                                    } else if (frequentType[i]['name'] ==
                                                        "Weekly") {
                                                      inputController.text =
                                                          selectedPlanData
                                                              .weeklyAmount
                                                              ?.toString() ??
                                                          '';
                                                    } else if (frequentType[i]['name'] ==
                                                        "Monthly") {
                                                      inputController.text =
                                                          selectedPlanData
                                                              .monthlyAmount
                                                              ?.toString() ??
                                                          '';
                                                    } else if (frequentType[i]['name'] ==
                                                        "Yearly") {
                                                      inputController.text =
                                                          selectedPlanData
                                                              .yearlyAmount
                                                              ?.toString() ??
                                                          '';
                                                    } else {
                                                      inputController.text =
                                                          selectedPlanData
                                                              .singleAmount
                                                              ?.toString() ??
                                                          '';
                                                    }
                                                  }
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                ),
                                                decoration: BoxDecoration(
                                                  color:
                                                      selectedFrequentType ==
                                                              frequentType[i]['id']
                                                          ? AppColors.primary
                                                          : AppColors
                                                              .neutral100,
                                                  border: Border.all(
                                                    color: AppColors.primary,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child:
                                                    selectedFrequentType ==
                                                            frequentType[i]['id']
                                                        ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.check,
                                                              color:
                                                                  AppColors
                                                                      .neutral100,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Text(
                                                              frequentType[i]['name'],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    AppColors
                                                                        .neutral100,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                        : Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              frequentType[i]['name'],
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color:
                                                                    AppColors
                                                                        .primary,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.neutral100,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.neutral90,
                                    width: 1,
                                  ),
                                ),

                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom: 20,
                                ),
                                child:
                                    isExpanded == true
                                        ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'About Program',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.neutral10,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.expand_less,
                                                  size: 24,
                                                  color: AppColors.neutral10,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Divider(
                                              color: AppColors.neutral90,
                                              height: 1,
                                            ),
                                            SizedBox(height: 10),
                                            Html(
                                              data: program.data?.about ?? '',
                                              style: {
                                                "body": Style(
                                                  fontSize: FontSize(14.0),
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.neutral20,
                                                ),
                                              },
                                            ),
                                          ],
                                        )
                                        : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'About Program',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.neutral10,
                                              ),
                                            ),
                                            Icon(
                                              Icons.expand_more,
                                              size: 24,
                                              color: AppColors.neutral10,
                                            ),
                                          ],
                                        ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.neutral100,
                      child: Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height: 48,

                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              'paymentMethod',
                              arguments: {
                                'programName': args['name'],
                                'amount': inputController.text,
                                'frequentType': selectedFrequentTypeName,
                              },
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 20,
                            color: AppColors.neutral100,
                          ),
                          iconAlignment: IconAlignment.end,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text(
                            'Proceed to Donate',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.neutral100,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
