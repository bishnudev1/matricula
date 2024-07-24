import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:matricula/views/dashboard/dashboard.dart';
import 'package:matricula/views/dashboard/dashboard_view_model.dart';

class MainScreenView extends ConsumerStatefulWidget {
  const MainScreenView({super.key});

  @override
  ConsumerState<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends ConsumerState<MainScreenView>
    with BaseScreenView {
  late final DashboardViewModel _viewModel;
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(dashboardViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        isCupertino: true,
        appBar: SliderAppBar(
          appBarHeight: 80,
          trailing: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 90,
                width: 50,
                margin: const EdgeInsets.all(AppSizes.p8),
                decoration: BoxDecoration(
                  // image: const DecorationImage(
                  //   fit: BoxFit.contain,
                  //   image: AssetImage(
                  //     "assets/images/notification.png",
                  //   ),
                  // ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/notification.png"),
                ),
              ),
              InkWell(
                onTap: () => _viewModel.navigateToprofile(context),
                child: Container(
                  height: 90,
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
              ),
            ],
          ),
          drawerIcon: InkWell(
            onTap: () {
              _sliderDrawerKey.currentState?.isDrawerOpen ?? false
                  ? _sliderDrawerKey.currentState?.closeSlider()
                  : _sliderDrawerKey.currentState?.openSlider();
              setState(() {});
            },
            child: const Padding(
              padding: EdgeInsets.all(AppSizes.p16),
              child: Center(
                child: Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppSizes.p16),
                child: Text(
                  "",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        key: _sliderDrawerKey,
        sliderOpenSize: 179,
        slider: _SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();
            setState(() {});
          },
        ),
        child: const Dashboard(),
      ),
    );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    // TODO: implement navigateToScreen
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    // TODO: implement showSnackbar
  }
}

class _SliderView extends ConsumerStatefulWidget {
  final Function(String)? onItemClick;

  const _SliderView({this.onItemClick});

  @override
  ConsumerState<_SliderView> createState() => _SliderViewState();
}

List<String> items = [
  "Library",
  "Download",
  "Live Classes",
  "Progress",
  "Subscribe Now",
  "Refer & Earn",
  "Terms & Conditions",
  "Logout",
];

List<IconData> icons = [
  Icons.library_add,
  Icons.download,
  Icons.video_call,
  Icons.analytics,
  Icons.shopping_bag,
  Icons.share,
  Icons.settings,
  Icons.logout,
];

class _SliderViewState extends ConsumerState<_SliderView> {
  late final DashboardViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(dashboardViewModel);
    // _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: ListView(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => _viewModel.navigateToprofile(context),
            child: CircleAvatar(
              radius: 65,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: Image.network(
                  'https://nikhilvadoliya.github.io/assets/images/nikhil_1.webp',
                ).image,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Swapnil',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: Text(
              "Your Class",
              style: AppThemes.lightTheme.textTheme.bodySmall
                  ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.p8),
            margin: const EdgeInsets.all(AppSizes.p8),
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSizes.p8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Class 9",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(color: primaryColor),
                  child: Icon(
                    Icons.expand_more,
                    color: kWhite,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
            child: Text(
              " Goal",
              style: AppThemes.lightTheme.textTheme.bodySmall
                  ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.p8),
            margin: const EdgeInsets.all(AppSizes.p8),
            decoration: BoxDecoration(
              color: primaryLightColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppSizes.p8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Boards",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(color: primaryColor),
                  child: Icon(
                    Icons.expand_more,
                    color: kWhite,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              ...List.generate(
                items.length,
                (index) => _SliderMenuItem(
                  iconData: icons[index],
                  title: items[index],
                  onTap: () => _viewModel.navigate(index, context),
                ),
              ),
            ],
          ),
          // ...[

          //   Menu(
          //     Icons.library_add,
          //     'Library',
          //   ),
          //   _SliderMenuItem(iconData: Icons.video_call,title:  'Live Classes'),
          //   Menu(Icons.analytics, 'Progress'),
          //   Menu(Icons.shopping_bag, 'Subscribe Now'),
          //   Menu(Icons.share, 'Refer & Earn'),
          //   Menu(Icons.settings, 'Terms & Conditions'),
          //   Menu(Icons.logout, 'Logout')
          // ]
          //     .map((menu) => _SliderMenuItem(
          //           title: menu.title,
          //           iconData: menu.iconData,
          //         ))
          //     .toList(),
        ],
      ),
    );
  }
}

class _SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function() onTap;

  const _SliderMenuItem({
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //     title: Text(title,
    //         style: const TextStyle(
    //             color: Colors.black, fontFamily: 'BalsamiqSans_Regular')),
    //     leading: Icon(iconData, color: Colors.black),
    //     onTap: () => onTap?.call(title));
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: primaryColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: AppThemes.lightTheme.textTheme.bodySmall
                    ?.copyWith(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu {
  final IconData iconData;
  final String title;

  Menu(this.iconData, this.title);
}
