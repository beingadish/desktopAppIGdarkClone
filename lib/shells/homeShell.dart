import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:google_fonts/google_fonts.dart';
import '../models/colorThemes.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({Key? key}) : super(key: key);

  @override
  State<HomeShell> createState() => _HomeShellState();
}

var darkColors = DarkThemeScheme();

Padding heading(String topicName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 20.0, left: 20.0),
    child: Builder(
        builder: (context) {
          return Text(
            topicName,
            style: GoogleFonts.oleoScript(
              fontSize: MediaQuery.of(context).size.width*0.05,
              color: darkColors.heading,
            ),
          );
        }
    ),
  );
}

material.CircleAvatar story(String heading, String content, String imageLoc) {
  return material.CircleAvatar(
    backgroundImage: ,
  );
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

SingleChildScrollView buildTileRow(
    String h1,
    String h2,
    String h3,
    String h4,
    String c1,
    String c2,
    String c3,
    String c4,
    String l1,
    String l2,
    String l3,
    String l4) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        buildTile(h1, c1, l1),
        hSpace(),
        buildTile(h2, c2, l2),
        hSpace(),
        buildTile(h3, c3, l3),
        hSpace(),
        buildTile(h4, c4, l4),
        hSpace(),
        hSpace(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            material.ElevatedButton(
              onPressed: () {},
              child: const Center(child: Icon(material.Icons.arrow_forward_outlined)),
              style: material.ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(bottom: 20.0),
                primary: Colors.black,
              ),
            ),
            const Text(
              "See More !",
              style: TextStyle(
                color: material.Colors.white60,
                fontSize: 18,
              ),
            ),
          ],
        ),
        hSpace(),
      ],
    ),
  );
}

class _HomeShellState extends State<HomeShell> {
  @override
  Widget build(BuildContext context) {
    return material.Material(
      child: material.Scaffold(
        backgroundColor: material.Colors.blueGrey,
        body: Builder(
          builder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("Welcome !"),
                vSpace(),
              ],
            );
          },
        ),
      ),
    );
  }
}
