import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/views/chapterDetail/chapter_detail_view_model.dart';

class ChapterDetail extends ConsumerStatefulWidget {
  const ChapterDetail({super.key});

  @override
  ConsumerState<ChapterDetail> createState() => _ChapterDetailState();
}

class _ChapterDetailState extends ConsumerState<ChapterDetail>
    with BaseScreenView {
  late final ChapterDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(chapterDetailViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE6EAF1),
      bottomNavigationBar: Container(
        // width: MediaQuery.of(context).size.width / 2,
        height: 60,
        // margin: EdgeInsets.only(bottom: AppSizes.p16),
        decoration: BoxDecoration(
          // border: Border.all(color: primaryColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              color: primaryColor.withOpacity(0.1),
              offset: const Offset(20, 6),
            ),
          ],
          color: kWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _viewModel.navigateToTest(context),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/practice.png",
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: AppSizes.p8,
                  ),
                  Text(
                    "Practice",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: primaryColor.withOpacity(0.2),
              width: 1,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _viewModel.navigateToTest(context),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/test.png",
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: AppSizes.p8,
                  ),
                  Text(
                    "Test",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: primaryColor.withOpacity(0.2),
              width: 1,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _viewModel.navigateToNotes(context),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/notes_tab.png",
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(
                    width: AppSizes.p8,
                  ),
                  Text(
                    "Notes",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Thermodynamics",
                style: AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.p4),
            Center(
              child: Text(
                "15 Tutorials , Class 9",
                style: AppThemes.lightTheme.textTheme.bodyLarge?.copyWith(
                  color: darkGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.p16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.p16),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://d2csxpduxe849s.cloudfront.net/media/E32629C6-9347-4F84-81FEAEF7BFA342B3/2E2F8F4B-9B7C-4E19-A76FD942B60BC1F2/E044F890-C4B8-4DE6-99950EAF1F8F416C/WebsiteJpg_XL-FPHY_Main%20Visual_Purple_Website.jpg",
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.p16),
            ListView.builder(
              itemBuilder: (context, index) => videoCard(context),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Container videoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.p8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.p16),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: const NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/93/65/51/360_F_293655104_ieGu8xEVX3Gf57szdTYYabey70c3H84q.jpg",
                    ),
                    colorFilter: ColorFilter.mode(
                      kBlack.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: kWhite,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thermodynamics",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSizes.p8),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 190,
                    ),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: kBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.p8),
                  Container(
                    padding: const EdgeInsets.all(AppSizes.p8),
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "02:30 min",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // context.pushNamed(
    //   appRoute.name, params: params ?? {},
    //   // {"fid": NavBarScreens.data[1].id},
    // );
    // TODO: implement navigateToScreen
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
