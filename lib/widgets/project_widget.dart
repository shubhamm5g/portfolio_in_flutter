import 'package:flutter/material.dart';
import 'package:portfolio_in_flutter/widgets/common_widgets.dart';
import 'package:portfolio_in_flutter/widgets/project_card_widget.dart';

import '../utils/projects_utils.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(children: [
        //work
        const HeadingTitle(text: "Work projects"),
        const SizedBox(height: 40),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Wrap(runSpacing: 25, spacing: 25, children: [
            for (int i = 0; i < workProjectUtils.length; i++)
              ProjectCardWidget(
                project: workProjectUtils[i],
              )
          ]),
        ), //hobby
        const SizedBox(height: 40),
        const HeadingTitle(text: "Hobby projects"),
        const SizedBox(height: 40),

        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Wrap(runSpacing: 25, spacing: 25, children: [
            for (int i = 0; i < hobbyProjectUtils.length; i++)
              ProjectCardWidget(
                project: hobbyProjectUtils[i],
              )
          ]),
        )
      ]),
    );
  }
}
