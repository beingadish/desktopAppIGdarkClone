import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      darkTheme: ThemeData(),
      home: Material(
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(
                top: 9.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  Image.network(
                    "https://www.instagram.com/static/images/web/logged_out_wordmark-dark.png/de0f46ab251e.png",
                    width: 100.0,
                    height: 80.0,
                    //fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 100.0,),
                  Container(
                    width: 400.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius:  BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 17, color: Colors.white60,),
                        hintText: 'Search anything . . . ',
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 50.0,),
                  const Icon(Icons.home_rounded,
                  size: 20.0,
                  color: Colors.white60,),
                  const SizedBox(width: 25.0,),
                  const Icon(Icons.home_rounded,
                    size: 20.0,
                    color: Colors.white60,),
                  const SizedBox(width: 25.0,),
                  const Icon(Icons.home_rounded,
                    size: 20.0,
                    color: Colors.white60,),
                  const SizedBox(width: 25.0,),
                  const Icon(Icons.home_rounded,
                    size: 20.0,
                    color: Colors.white60,)
                ],
              ),
            ),
            // title: Text(
            //   "Instagram",
            //   style: GoogleFonts.,
            // ),
            //centerTitle: true,
            //leading: const Icon(Icons.star),
            //elevation: 20.0,
            //foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            toolbarHeight: 60.0,
          ),
          body: Material(
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(
                    thickness: 0.2,
                    color: Colors.white,
                  ),
                  SingleChildScrollView(
                    reverse: true,
                    child: Row(
                      children: [
                        // StoryWidget();
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
