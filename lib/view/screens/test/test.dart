import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:matricula/view/screens/test/test_view_model.dart';

class Test extends ConsumerStatefulWidget {
  const Test({super.key});

  @override
  ConsumerState<Test> createState() => _TestState();
}

class _TestState extends ConsumerState<Test> with BaseScreenView {
  int selectedIndex = -1;
  List<String> options = [
    "Thermal mechanics",
    "Mechanics",
    "Thermodynamics",
    "Dynamics",
  ];
  late final TestViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(testViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.p8),
        color: kWhite,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Physics Test",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Text(
                  "1 of 10 Questions",
                  style: AppThemes.lightTheme.textTheme.bodySmall
                      ?.copyWith(color: darkGrey),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  padding: const EdgeInsets.all(AppSizes.p16),
                  decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Previous",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 100,
                  height: 50,
                  padding: const EdgeInsets.all(AppSizes.p16),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 2,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          children: [
            const Icon(
              Icons.timer,
              color: darkGrey,
            ),
            const SizedBox(width: AppSizes.p8),
            Text(
              "02:00 mins Left",
              style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1 of 10 Questions",
              style: AppThemes.lightTheme.textTheme.bodyMedium
                  ?.copyWith(color: darkGrey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppSizes.p16),
            Text(
              "The branch of Physics that deals with heat, work and temperature, and their relation to energy, radiation and physical properties of matter is known as",
              style: AppThemes.lightTheme.textTheme.bodyMedium
                  ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                const SizedBox(height: AppSizes.p16),
                ...List.generate(
                  4,
                  (index) => InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: AppSizes.p8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.p16,
                        vertical: AppSizes.p16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.p8),
                        color: selectedIndex == index ? Colors.green : kWhite,
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.green
                                    : kBlack.withOpacity(0.2),
                              ),
                              color: kWhite,
                              shape: BoxShape.circle,
                            ),
                            height: 20,
                            width: 20,
                            child: selectedIndex == index
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 12,
                                    ),
                                  )
                                : Container(),
                          ),
                          const SizedBox(width: AppSizes.p16),
                          Text(
                            options[index],
                            style: AppThemes.lightTheme.textTheme.bodyMedium
                                ?.copyWith(
                              color: selectedIndex == index
                                  ? kWhite
                                  : primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(height: AppSizes.p28),
          ],
        ),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
    // context.pushNamed(
    //   appRoute.name, params: params ?? {},
    //   // {"fid": NavBarScreens.data[1].id},
    // );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}
