import 'package:flutter/material.dart';
import 'package:portfolio_in_flutter/consts/consts.dart';
import 'package:portfolio_in_flutter/utils/projects_utils.dart';
import 'package:portfolio_in_flutter/widgets/common_widgets.dart';
import 'package:portfolio_in_flutter/widgets/drawer_mobile.dart';
import 'package:portfolio_in_flutter/widgets/header_desktop.dart';
import 'package:portfolio_in_flutter/widgets/header_mobile.dart';
import 'package:portfolio_in_flutter/widgets/main_desktop.dart';
import 'package:portfolio_in_flutter/widgets/main_mobile.dart';
import 'package:portfolio_in_flutter/widgets/skills_desktop.dart';
import 'package:portfolio_in_flutter/widgets/skills_mobile.dart';

import '../widgets/project_card_widget.dart';
import '../widgets/project_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          endDrawer: (constraints.maxWidth >= kMinDesktopWidth)
              ? null
              : const DrawerMobile(),
          backgroundColor: CustomColors.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // main
              if (constraints.maxWidth >= kMinDesktopWidth)
                const HeaderDesktop()
              else
                HeaderMobile(
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth >= kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // skills
              Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
                color: CustomColors.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //titles

                    const HeadingTitle(text: "What can I do?"),
                    const SizedBox(
                      height: 50,
                    ),
                    // skills and platforms
                    (constraints.maxWidth >= kMidDesktopWidth)
                        ? const SkillsDesktop()
                        : const SkillsMobile(),
                  ],
                ),
              ), // project
              const ProjectSection(), // contacts
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColors.bgLight1,
                child: const Column(
                  children: [
                    HeadingTitle(text: "Get in touch"),
                  ],
                ),
              ), //footer
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
      );
    });
  }
}
