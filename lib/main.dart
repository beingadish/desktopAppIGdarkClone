import 'package:flutter/material.dart';

void main() {
  runApp(const DesktopApp());
}

class DesktopApp extends StatefulWidget {
  const DesktopApp({Key? key}) : super(key: key);

  @override
  State<DesktopApp> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Desktop Application",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(

      ),
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Instagram"),
            //centerTitle: true,
            //leading: const Icon(Icons.star),
            elevation: 20.0,
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            toolbarHeight: 60.0,

          ),
          body: SafeArea(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Divider(
                    thickness: 1.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
