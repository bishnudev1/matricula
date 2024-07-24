import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matricula/helpers/base_screen_view.dart';
import 'package:matricula/helpers/base_view_model.dart';
import 'package:matricula/routes/app_routes.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/view/screens/auth/auth_view_model.dart';
import 'package:pinput/pinput.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
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
          "Downloads",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => videoCard(context),
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
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
                      style:
                          AppThemes.lightTheme.textTheme.bodyMedium?.copyWith(
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
                      style:
                          AppThemes.lightTheme.textTheme.bodyMedium?.copyWith(
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
}
