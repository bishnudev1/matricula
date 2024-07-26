import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/app/app_routes.dart';
import 'package:matricula/providers/auth_providers.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:matricula/views/dashboard/dashboard.dart';
import 'package:matricula/views/dashboard/dashboard_view_model.dart';
import 'package:matricula/views/mainScreen/main_screen_view_model.dart';

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
    _viewModel = ref.read(dashboardViewProviders);
    _viewModel.attachView(this);
    log("MainScreenView is created");
  }

  @override
  void dispose() {
    _viewModel.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("MainScreenView is build");
    final user = ref.watch(mainScreenProvider).user;
    _viewModel.getUser();
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
                child: Consumer(builder: (context, ref, child) {
                  log("Image URL Changed: ${user?.photoURL}");
                  return Container(
                    height: 90,
                    width: 50,
                    margin: const EdgeInsets.all(AppSizes.p8),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(ref
                                .watch(mainScreenProvider.notifier)
                                .user
                                ?.photoURL ??
                            "https://cdn-icons-png.flaticon.com/512/9131/9131529.png"),
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
                  );
                }),
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
}

class _SliderView extends ConsumerStatefulWidget {
  final Function(String)? onItemClick;

  const _SliderView({this.onItemClick});

  @override
  ConsumerState<_SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends ConsumerState<_SliderView> {
  late final DashboardViewModel _viewModel;
  late final MainScreenViewModel _mainScreenViewModel;

  final List<String> items = [
    "Library",
    "Download",
    "Live Classes",
    "Progress",
    "Subscribe Now",
    "Refer & Earn",
    "Terms & Conditions",
    "Logout",
  ];

  final List<IconData> icons = [
    Icons.library_add,
    Icons.download,
    Icons.video_call,
    Icons.analytics,
    Icons.shopping_bag,
    Icons.share,
    Icons.settings,
    Icons.logout,
  ];

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(dashboardViewProviders);
    _mainScreenViewModel = ref.read(mainScreenProvider);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(mainScreenProvider).user;
    _mainScreenViewModel.getUser();

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
                        user?.photoURL ??
                            "https://cdn-icons-png.flaticon.com/512/9131/9131529.png",
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const CircularProgressIndicator();
                        },
                        fit: BoxFit.cover)
                    .image,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            user?.displayName?.split(' ').first ?? "Anonymous",
            textAlign: TextAlign.center,
            style: const TextStyle(
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
              "Goal",
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
                  onTap: () => {
                    log("Item Clicked: $index"),
                    if (index == 7) {_viewModel.handleSignOut(context, ref)}
                  },
                ),
              ),
            ],
          ),
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
