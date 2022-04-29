import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DesktopApp());
  doWhenWindowReady((){
    var initialSize = const Size(600,450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.title = "ChatterBot";
    appWindow.show();
  });
}

var buttonColors = WindowButtonColors(
  iconNormal: Colors.black,
  iconMouseDown: Colors.white10,
  iconMouseOver: Colors.white,
);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(
          colors: buttonColors,
        ),
        MaximizeWindowButton(
          colors: buttonColors,
        ),
        CloseWindowButton(),
      ],
    );
  }
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
      title: "ChatterBot",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      home: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.white10,
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width,
                child: WindowTitleBarBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: MoveWindow(
                          child: const SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.01, --> Not performing any action
                            child: Text(
                              "ChatterBot",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const WindowButtons(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.95,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.05,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.black],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white60, Colors.black],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomLeft)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white60, Colors.black],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomLeft)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white60, Colors.black],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomLeft)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
