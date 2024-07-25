import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:matricula/views/dashboard/dashboard_view_model.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> with BaseScreenView {
  // late final DashboardViewModel _viewModel;
  List<String> subjectsImage = [
    "assets/images/physics.png",
    "assets/images/biology.png",
    "assets/images/chemistry.png",
    "assets/images/eng.png",
  ];
  List<String> subjects = ["Physics", "Biology", "Chemistry", "English"];
  List<Color> colors = [
    const Color(0xFFFF787A),
    const Color(0xFF13D669),
    const Color(0xFFB677FF),
    const Color(0xFF6C99FE),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   _viewModel = ref.read(dashboardViewModel);
  //   _viewModel.attachView(this);
  // }

  @override
  Widget build(BuildContext context) {
    final _viewModel = ref.watch(dashboardViewProviders);
    return Scaffold(
      backgroundColor: kWhite,
      body: _viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.all(AppSizes.p16),
                    padding: const EdgeInsets.all(
                      AppSizes.p16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning ",
                          style: AppThemes.lightTheme.textTheme.bodySmall
                              ?.copyWith(color: primaryColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _viewModel.user.displayName?.split(' ').first ??
                                  "",
                              style: AppThemes.lightTheme.textTheme.bodyLarge
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "Class 9",
                              style: AppThemes.lightTheme.textTheme.bodySmall
                                  ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSizes.p16),
                  SizedBox(
                    height: 200,
                    child: Swiper(
                      itemCount: 10,
                      // shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width - 16,
                        margin: const EdgeInsets.symmetric(
                            horizontal: AppSizes.p16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              "https://estudentbook.com/admin/images/times_images/1641875089-WBJEE%202022-%20Last%20Date%20To%20Register-02.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.p16),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (contex, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.p16,
                          vertical: AppSizes.p8,
                        ),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: AppSizes.p16,
                            mainAxisSpacing: AppSizes.p8,
                          ),
                          itemBuilder: (context, index) => subjectCard(
                            context,
                            subjectsImage[index],
                            subjects[index],
                            colors[index],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  Widget subjectCard(
    BuildContext context,
    String image,
    String title,
    Color color,
  ) {
    return InkWell(
      // onTap: () => _viewModel.navigateToChapters(context),
      child: DecoratedBox(
        // width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 0.1,
            image: Image.asset(
              image,
              color: kWhite,
            ).image,
            alignment: Alignment.centerLeft,
          ),
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.p8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    image,
                    color: kWhite,
                    height: 60,
                  ),
                ),
                const SizedBox(width: AppSizes.p16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9 Chapters",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSizes.p16, top: AppSizes.p8),
              child: Row(
                children: [
                  Text(
                    "Progress",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    " 60%",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.p16,
                right: AppSizes.p16,
                top: AppSizes.p8,
              ),
              child: StepProgressIndicator(
                totalSteps: 10,
                currentStep: 7,
                size: 8,
                padding: 0,
                selectedColor: secondaryColor.withOpacity(0.8),
                unselectedColor: primaryColor.withOpacity(0.2),
                roundedEdges: const Radius.circular(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
