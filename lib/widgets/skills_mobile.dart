import 'package:flutter/material.dart';

import '../consts/consts.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: CustomColors.bgLight2,
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                leading: Image.asset(
                  platformItems[i]['img']!,
                  width: 26,
                ),
                title: Text(platformItems[i]['title']!),
              ),
            ),
          const SizedBox(
            height: 50,
          ),
          Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < skillsItems.length; i++)
                  Chip(
                    backgroundColor: CustomColors.bgLight2,
                    label: Text(
                      skillsItems[i]['title']!,
                    ),
                    avatar: Image.asset(skillsItems[i]['img']!),
                  )
              ])
        ],
      ),
    );
  }
}
