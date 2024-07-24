import 'package:flutter/material.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';

import '../../../utils/themes.dart';

class Refer extends StatefulWidget {
  const Refer({super.key});

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  bool isWithDrawToBank = false;
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
          "Refer & Earn",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "₹150.00",
                    style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(width: AppSizes.p8),
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.p8),
              Center(
                child: Text(
                  "25 Redeems",
                  style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.p8),
              const Divider(),
              const SizedBox(height: AppSizes.p8),
              Text(
                "Your Referrel Code",
                style: AppThemes.lightTheme.textTheme.bodyMedium?.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSizes.p16),
              Container(
                padding: const EdgeInsets.all(AppSizes.p16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.p16),
                  border: Border.all(color: primaryLightColor, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "xy647Qy",
                      style: AppThemes.lightTheme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.copy),
                        const SizedBox(width: AppSizes.p8),
                        Text(
                          "Copy Code",
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
              const SizedBox(height: AppSizes.p8),
              const Divider(),
              const SizedBox(height: AppSizes.p8),
              Visibility(
                visible: !isWithDrawToBank,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          AppSizes.p16 * 2,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(primaryColor),
                          // backgroundColor:Elevate,
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        // style: ButtonStyle(),
                        onPressed: () {
                          setState(() {
                            isWithDrawToBank = true;
                            setState(() {});
                          });
                          // _viewModel.navigateTodashboard();
                        },
                        child: const Text("Withdraw to Bank"),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 -
                          AppSizes.p16 * 2,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(primaryColor),
                          // backgroundColor:Elevate,
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        // style: ButtonStyle(),
                        onPressed: () {
                          // _viewModel.navigateTodashboard();
                        },
                        child: const Text("Subscribe"),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(visible: isWithDrawToBank, child: withdrawForm()),
            ],
          ),
        ),
      ),
    );
  }

  Widget withdrawForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter The amount",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter bank account number",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            hintText: "confirm bank account number",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter branch name",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            filled: true,
            hintText: "Enter bank IFSC code",
          ),
        ),
        const SizedBox(height: AppSizes.p16),
        Text(
          "Terms And Condition",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
        const SizedBox(height: AppSizes.p8),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining es",
          style: AppThemes.lightTheme.textTheme.bodySmall,
        ),
        const SizedBox(height: AppSizes.p8),
        Text(
          "On withdrawing you are agreeing to our Terms and Condtions",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(color: secondaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSizes.p20),
        Center(
          child: SizedBox(
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
                Navigator.of(context).pop();
                // _viewModel.navigateTodashboard();
              },
              child: const Text("Witdraw"),
            ),
          ),
        ),
      ],
    );
  }
}
