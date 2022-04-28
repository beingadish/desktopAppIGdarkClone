import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DesktopApp());
}

CircleAvatar StoryTemplate(String imageLoc, bool view){
  return CircleAvatar(
    child: Image.asset("imageLoc"),
    radius: 30.0,
  );
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
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
      home: Builder(
        builder: (context) {
          return Scaffold(
            // appBar: AppBar(
            //   flexibleSpace: Padding(
            //     padding: const EdgeInsets.only(
            //       top: 9.0,
            //     ),
            //     child: Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       children: [
            //         const SizedBox(
            //           width: MediaQuery.of(context).size.width,
            //         ),
            //         Image.network(
            //           "https://www.instagram.com/static/images/web/logged_out_wordmark-dark.png/de0f46ab251e.png",
            //           width: 5,
            //           height: 80.0,
            //           //fit: BoxFit.cover,
            //         ),
            //         const SizedBox(width: 100.0,),
            //         Container(
            //           width: 400.0,
            //           height: 50.0,
            //           decoration: BoxDecoration(
            //             color: Colors.white24,
            //             borderRadius:  BorderRadius.circular(10),
            //           ),
            //           child: const TextField(
            //             decoration: InputDecoration(
            //               hintStyle: TextStyle(fontSize: 17, color: Colors.white60,),
            //               hintText: 'Search anything . . . ',
            //               prefixIcon: Icon(Icons.search),
            //               border: InputBorder.none,
            //               contentPadding: EdgeInsets.all(20),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(width: 50.0,),
            //         const Icon(Icons.home_rounded,
            //         size: 20.0,
            //         color: Colors.white60,),
            //         const SizedBox(width: 25.0,),
            //         const Icon(Icons.home_rounded,
            //           size: 20.0,
            //           color: Colors.white60,),
            //         const SizedBox(width: 25.0,),
            //         const Icon(Icons.home_rounded,
            //           size: 20.0,
            //           color: Colors.white60,),
            //         const SizedBox(width: 25.0,),
            //         const Icon(Icons.home_rounded,
            //           size: 20.0,
            //           color: Colors.white60,)
            //       ],
            //     ),
            //   ),
            //   // title: Text(
            //   //   "Instagram",
            //   //   style: GoogleFonts.,
            //   // ),
            //   //centerTitle: true,
            //   //leading: const Icon(Icons.star),
            //   //elevation: 20.0,
            //   //foregroundColor: Colors.white,
            //   backgroundColor: Colors.black,
            //   toolbarHeight: 60.0,
            // ),
            body: Material(
              color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width*0.4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.white, Colors.white70],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)
                      ),
                    ),
                    Container(
                      child: WindowTitleBarBox(
                        child: Row(
                          children: [
                            Expanded(child: Container()),
                            WindowButtons(),
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width*0.6,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.white60,Colors.white],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomLeft)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
