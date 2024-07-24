import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matricula/utils/app_sizes.dart';
import 'package:matricula/utils/colors.dart';
import 'package:matricula/utils/themes.dart';

class Notes extends ConsumerStatefulWidget {
  const Notes({super.key});

  @override
  ConsumerState<Notes> createState() => _NotesState();
}

class _NotesState extends ConsumerState<Notes> {
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
          "Notes",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.bold, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.p16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => notesCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container notesCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSizes.p8),
      padding: const EdgeInsets.all(AppSizes.p8),
      decoration: const BoxDecoration(color: primaryLightColor),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(AppSizes.p8),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: kWhite,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            "assets/images/notes.png",
            height: 20,
            width: 20,
          ),
        ),
        title: Text(
          "Thermodynamics",
          style: AppThemes.lightTheme.textTheme.bodySmall
              ?.copyWith(color: primaryColor),
        ),
        trailing: const Icon(Icons.download),
      ),
    );
  }
}
