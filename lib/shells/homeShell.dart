import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:google_fonts/google_fonts.dart';
import '../models/colorThemes.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({Key? key}) : super(key: key);

  @override
  State<HomeShell> createState() => _HomeShellState();
}

var darkColors = DarkThemeScheme();

Padding heading(String topicName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 20.0, left: 20.0),
    child: Builder(builder: (context) {
      return Text(
        topicName,
        style: GoogleFonts.oleoScript(
          fontSize: MediaQuery.of(context).size.width *
              0.005 *
              (MediaQuery.of(context).size.height) *
              0.009,
          color: darkColors.heading,
        ),
      );
    }),
  );
}

Builder story() {
  return Builder(builder: (context) {
    return AdvancedAvatar(
      size: (MediaQuery.of(context).size.width) *
          (MediaQuery.of(context).size.height) *
          (0.00015),
      name: "img1",
      image: const material.AssetImage("asset/images/DP.jpeg"),
    );
  });
}

SizedBox hSpace() {
  return const SizedBox(
    width: 10.0,
  );
}

SizedBox vSpace() {
  return const SizedBox(
    height: 10.0,
  );
}

ScaffoldPage storyRow() {
  return ScaffoldPage.scrollable(
    children: [
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
      hSpace(),
      hSpace(),
      story(),
    ],

  );
}

class _HomeShellState extends State<HomeShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
        // backgroundColor: material.Colors.blueGrey.shade700,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading("Welcome !"),
              vSpace(),
              storyRow(),
            ],
          )
        ]);
  }
}
