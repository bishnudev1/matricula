import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> with BaseScreenView {
  int? groupValue = 0;
  late AuthViewModel _viewModel;
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool isOtpReceived = false;

  @override
  void initState() {
    _viewModel = ref.read(authViewModel);
    _viewModel.attachView(this);
    // _viewModel.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.p16),
                Text(
                  "Welcome Back",
                  style: AppThemes.lightTheme.textTheme.bodySmall!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "To Start please login or sign up with martricula",
                  style: AppThemes.lightTheme.textTheme.bodyMedium!.copyWith(
                    color: lightGrey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Center(
                  child: Lottie.asset(
                    height: MediaQuery.of(context).size.height / 3,
                    'assets/images/lottie.json',
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: CupertinoSlidingSegmentedControl<int>(
                    backgroundColor: lightGrey.withOpacity(0.2),
                    thumbColor: CupertinoColors.white,
                    padding: const EdgeInsets.all(2),
                    groupValue: groupValue,
                    children: {
                      0: buildSegment("Email"),
                      1: buildSegment("Mobile"),
                    },
                    onValueChanged: (value) {
                      setState(() {
                        isOtpReceived = false;
                        groupValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: AppSizes.p16),
                Form(child: groupValue == 0 ? emailForm() : mobileForm()),
                const SizedBox(height: AppSizes.p16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: lightGrey,
                      height: 2,
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                    const Text("Sign In with Google or Facebook"),
                    Container(
                      color: lightGrey,
                      height: 2,
                      width: MediaQuery.of(context).size.width / 6,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.p16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/facebook.png",
                      height: 40,
                    ),
                    const SizedBox(width: AppSizes.p28),
                    Image.asset(
                      "assets/images/google.png",
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.p16),
                InkWell(
                  onTap: () => _viewModel.navigateToRegistration(context),
                  child: Align(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account ?",
                            style: AppThemes.lightTheme.textTheme.bodySmall!
                                .copyWith(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: AppThemes.lightTheme.textTheme.bodySmall!
                                .copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column emailForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter your Email-ID",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter your password",
          ),
        ),
        const SizedBox(height: AppSizes.p8),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            _viewModel.navigateToForgetPassword(context);
          },
          child: Container(
            alignment: Alignment.topRight,
            child: Text(
              "Forget Password ?",
              style: AppThemes.lightTheme.textTheme.bodySmall!
                  .copyWith(color: secondaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.p20),
        SizedBox(
          width: MediaQuery.of(context).size.width - (AppSizes.p32 * 2),
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(primaryColor),
              // backgroundColor:Elevate,
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // style: ButtonStyle(),
            onPressed: () {
              _viewModel.navigateTodashboard(context);
            },
            child: const Text("Login"),
          ),
        ),
      ],
    );
  }

  Column mobileForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.all(16),
              child: Text("+91"),
            ),
            filled: true,
            hintText: "Enter your mobile number",
          ),
        ),
        Visibility(
          visible: !isOtpReceived,
          child: Container(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                const SizedBox(height: AppSizes.p8),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(primaryColor),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),

                  // color: primaryColor,
                  onPressed: () {
                    setState(() {
                      isOtpReceived = true;
                    });
                  },
                  child: const Text(
                    "Request OTP",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.p8),
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
                  return value == '123456' ? null : 'Pin is incorrect';
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
        const SizedBox(height: AppSizes.p8),
        // Container(
        //   alignment: Alignment.topRight,
        //   child: const Text("Forget Password ?"),
        // ),
        Visibility(
          visible: isOtpReceived,
          child: Column(
            children: [
              const SizedBox(height: AppSizes.p8),
              SizedBox(
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
                    setState(() {
                      _viewModel.navigateTodashboard(context);
                    });
                  },
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSegment(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.p28,
        vertical: AppSizes.p10,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  // @override
  // void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
  //   // context.pushNamed(
  //   //     // appRoute.name, params: params ?? {},
  //   //     // {"fid": NavBarScreens.data[1].id},
  //   //     );
  //   // TODO: implement navigateToScreen
  // }

  // @override
  // void showSnackbar(String message, {Color? color}) {
  //   // TODO: implement showSnackbar
  // }
}
