import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:matricula/view/screens/profile/profile_view_model.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> with BaseScreenView {
  late final ProfileViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(profileViewModel);
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
          "Profile",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(top: AppSizes.p16, right: AppSizes.p16),
            child: InkWell(
              child: Text(
                "Edit",
                style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.p16),
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/student.png"),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.p8),
            Center(
              child: Text(
                "Swapnil Chatterjee",
                style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSizes.p16),
              margin: const EdgeInsets.all(AppSizes.p16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: primaryLightColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  items(key: "Mobile No", value: "+918910213903"),
                  items(key: "WhatsApp No", value: "+918910213903"),
                  items(key: "City/District", value: "Kolkata"),
                  items(key: "Pincode", value: "+700054"),
                  items(key: "Class", value: "12"),
                  items(key: "School", value: "UEM"),
                  items(key: "Address", value: "lorem ipsum jjfnk  kj "),
                  SizedBox(
                    width:
                        MediaQuery.of(context).size.width - (AppSizes.p32 * 2),
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(primaryColor),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      // style: ButtonStyle(),
                      onPressed: () {
                        setState(() {
                          _viewModel.navigateToSubscription();
                        });
                      },
                      child: const Text("Subscribe"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget items({String? key, String? value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$key:-",
          style: AppThemes.lightTheme.textTheme.bodyMedium
              ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.p8),
        Text(
          "$value",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.p8),
        const Divider(
          color: kBlack,
        ),
        const SizedBox(height: AppSizes.p8),
      ],
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
