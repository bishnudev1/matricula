import 'package:flutter/material.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  bool isOtpReceived = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: kWhite,
        title: Text(
          "Forget Password",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/forget.jpg",
              height: MediaQuery.of(context).size.height / 3,
            ),
            mobileForm(),
          ],
        ),
      ),
    );
  }

  Widget mobileForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16),
      child: Column(
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
          const SizedBox(height: AppSizes.p8),
          Visibility(
            visible: isOtpReceived,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("+91"),
                ),
                filled: true,
                hintText: "Enter New Password",
              ),
            ),
          ),
          const SizedBox(height: AppSizes.p16),
          Visibility(
            visible: isOtpReceived,
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("+91"),
                ),
                filled: true,
                hintText: "Confirm new password",
              ),
            ),
          ),
          const SizedBox(height: AppSizes.p16),
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
                      // _viewModel.navigateTodashboard();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Change Password"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
