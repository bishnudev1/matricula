import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/view/screens/chapters/chapter_view_model.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Chapter extends ConsumerStatefulWidget {
  const Chapter({super.key});

  @override
  ConsumerState<Chapter> createState() => _ChapterState();
}

class _ChapterState extends ConsumerState<Chapter> with BaseScreenView {
  late final ChapterViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(chapterViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kWhite,
        title: Text(
          "Physics",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(AppSizes.p8),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage("assets/images/student.png"),
              ),
              color: kWhite,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: kBlack.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.p14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "20 Chapters, 100 Tutorials",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Class 9",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.p16),
              const SizedBox(height: AppSizes.p16),
              GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: AppSizes.p16,
                  mainAxisSpacing: AppSizes.p16,
                ),
                itemBuilder: (context, index) => chaptersCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chaptersCard() {
    return InkWell(
      onTap: () => _viewModel.navigateToChapterDetail(context),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.p16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(AppSizes.p16),
          boxShadow: [
            BoxShadow(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(5, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              "assets/images/dummy_chapter.jpeg",
              height: 90,
            ),
            Text(
              "Thermodynamics",
              style: AppThemes.lightTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // context.pushNamed(
    //     // appRoute.name, params: params ?? {},
    //     // {"fid": NavBarScreens.data[1].id},
    //     );
    // TODO: implement navigateToScreen
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
