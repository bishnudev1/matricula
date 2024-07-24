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

class LiveClass extends StatefulWidget {
  const LiveClass({super.key});

  @override
  State<LiveClass> createState() => _LiveClassState();
}

class _LiveClassState extends State<LiveClass> {
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
          "Live Class",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: const Column(
        children: [
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          TabBarView(
            children: [Column()],
          ),
        ],
      ),
    );
  }
}
