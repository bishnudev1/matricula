import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';

class Registration extends ConsumerStatefulWidget {
  const Registration({super.key});

  @override
  ConsumerState<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends ConsumerState<Registration>
    with BaseScreenView {
  bool isOtpReceived = false;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  late final AuthViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.p16),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create New Account",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please fill up the form to create an account with matricula",
                  style: AppThemes.lightTheme.textTheme.bodyMedium!.copyWith(
                    color: lightGrey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: AppSizes.p16),
                Stack(
                  children: [
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ],
                ),
                signupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Form signupForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSizes.p16),
          Text(
            "Name *",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            decoration: const InputDecoration(
              filled: true,
              hintText: "Enter your name",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Mobile Number *",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: const Padding(
                padding: EdgeInsets.all(16),
                child: Text("+91"),
              ),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isOtpReceived = true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "verify".toUpperCase(),
                    style: AppThemes.lightTheme.textTheme.bodySmall!
                        .copyWith(color: primaryColor),
                  ),
                ),
              ),
              filled: true,
              hintText: "Enter your mobile number",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Visibility(
            visible: isOtpReceived,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.p16),
              child: Directionality(
                // Specify direction if desired
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: pinController,
                  focusNode: focusNode,
                  length: 6,
                  // androidSmsAutofillMethod:
                  //     AndroidSmsAutofillMethod.smsUserConsentApi,
                  // listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: AppThemes.pinputTheme,
                  validator: (value) {
                    return value == '2222' ? null : 'Pin is incorrect';
                  },
                  // onClipboardFound: (value) {
                  //   debugPrint('onClipboardFound: $value');
                  //   pinController.setText(value);
                  // },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                        color: focusedBorderColor,
                      ),
                    ],
                  ),
                  focusedPinTheme: AppThemes.pinputTheme.copyWith(
                    decoration: AppThemes.pinputTheme.decoration!.copyWith(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: AppThemes.pinputTheme.copyWith(
                    decoration: AppThemes.pinputTheme.decoration!.copyWith(
                      color: fillColor,
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: AppThemes.pinputTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isOtpReceived,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
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
                          isOtpReceived = false;
                        });
                      },
                      child: const Text("Verify"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Whatsapp Number ",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(16),
                child: Text("+91"),
              ),
              filled: true,
              hintText: "Enter your whatsapp number",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "City *",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              hintText: "Please select your city",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Pincode *",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.expand_more),
              filled: true,
              hintText: "Please enter your pincode",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Class*",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.expand_more),
              filled: true,
              hintText: "Please select your class",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Goal*",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.expand_more),
              filled: true,
              hintText: "Please select your goal",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "School *",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.expand_more),
              filled: true,
              hintText: "Please select your school",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Address",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              hintText: "Please enter your address",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Password",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              hintText: "Please enter a new password",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Text(
            "Confirm Password",
            style: AppThemes.lightTheme.textTheme.bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppSizes.p16),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              filled: true,
              hintText: "Please enter the same password",
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Align(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - (AppSizes.p32 * 2),
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
                  _viewModel.navigateTodashboard();
                },
                child: const Text("Sign Up"),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.p20),
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
