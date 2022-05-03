import 'package:desktop_app/models/all_pages.dart';
import 'package:desktop_app/models/pages.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:window_manager/window_manager.dart';

// unused [import 'package:window_manager/window_manager.dart';]
// --> due to not supporting the app for stopping the problem of RenderFlex
// not compatible for setting the windows app size properly

// import 'package:window_manager/window_manager.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  // Commented code refers to the window_manager package which is not working
  // having issues with RenderFlex of the app
  // for using this we must first async the main function

  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();
  // await windowManager.waitUntilReadyToShow().then((_) async {
  //   await windowManager.setBackgroundColor(Colors.transparent);
  //   await windowManager.setSize(const Size(1600, 800));
  //   await windowManager.setMinimumSize(const Size(1000, 800));
  //   await windowManager.center();
  //   await windowManager.show();
  //   await windowManager.setSkipTaskbar(false);
  // });

  runApp(const DesktopApp());

  // doWhenWindowsReady is included inside the bits_mojo package to ensure
  // the settings of the windows app size so as to change it according to the needs
  // of the user to avoid the problem of RenderFlex of the app

  doWhenWindowReady(() {
    var initialSize = const Size(700, 500);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.title = "ChatterBot";
    appWindow.show();
  });
}

var buttonColors = WindowButtonColors(
  normal: Colors.transparent,
  mouseOver: Colors.blue,
  iconNormal: Colors.white,
  iconMouseDown: Colors.white,
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
    return FluentApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
      ),
      title: "ChatterBot",
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WindowListener {
  final viewKey = GlobalKey();
  int index = 0;
  final List<AllPages> menu = const [
    AllPages(
      title: "Home",
      iconData: FluentIcons.home_group,
      pageName: Pages.home,
      info: InfoBadge(
        source: Text(""),
      ),
    ),
    AllPages(
      title: "Messages",
      iconData: FluentIcons.skype_message,
      pageName: Pages.message,
      info: InfoBadge(
        source: Text("5"),
      ),
    ),
    AllPages(
      title: "Friends",
      iconData: FluentIcons.people,
      pageName: Pages.friends,
      info: InfoBadge(
        source: Text("5"),
      ),
    ),
    AllPages(
      title: "Calls",
      iconData: FluentIcons.phone,
      pageName: Pages.calls,
      info: InfoBadge(
        source: Text("2"),
      ),
    ),
    AllPages(
      title: "Bookmarked",
      iconData: FluentIcons.double_bookmark,
      pageName: Pages.bookmarked,
      info: InfoBadge(
        source: Text(""),
      ),
    ),
    AllPages(
      title: "Settings",
      iconData: FluentIcons.settings,
      pageName: Pages.settings,
      info: InfoBadge(
        source: Text("!"),
      ),
    ),
  ];

  // @override
  // void onWindowClose() {
  //   // TODO: implement onWindowClose
  //   super.onWindowClose();
  // }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: MoveWindow(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(menu[index].title + " Page"),
            ],
          ),
        ),
        leading: MoveWindow(
          child: Icon(menu[index].iconData),
        ),
        // automaticallyImplyLeading: true,
        actions: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: MoveWindow(),
            ),
            MoveWindow(
              child: const WindowButtons(),
            ),
          ],
        ),
      ),
      key: viewKey,
      pane: NavigationPane(
        indicator: const StickyNavigationIndicator(
          color: Colors.white,
        ),
        selected: index,
        onChanged: (i) => setState(() {
          index = i;
        }),
        displayMode: PaneDisplayMode.compact,
        items: menu
            .map<NavigationPaneItem>(
              ((e) => PaneItem(
                    icon: Icon(e.iconData),
                    title: Text(e.title),
                    infoBadge: (e.info),
                  )),
            )
            .toList(),
      ),
      content: NavigationBody.builder(
          index: index,
          itemBuilder: (context, index) {
            return Shell(shellIndex: index,);
          }),
    );
  }
}

class Shell extends StatefulWidget {
  var shellIndex=0;
   Shell({Key? key, required this.shellIndex}) : super(key: key);

  @override
  State<Shell> createState() => _ShellState();
}

Padding buildTopic(String topicName) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 20.0),
    child: Text(
      "$topicName :",
      style: const TextStyle(
        fontSize: 30.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

material.InkWell buildTile(String heading, String content, String imageLoc) {
  return material.InkWell(
    borderRadius: BorderRadius.circular(10.0),
    child: material.Ink(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5.0),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    content,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageLoc),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              material.Colors.black12.withOpacity(0.4), BlendMode.dstATop),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    )
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


class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    if(widget.shellIndex == 0){
      return Builder(
        builder: (context) {
          return buildTopic("Home Page");
        },
      );
    }
    else if(widget.shellIndex == 1){
      return ScaffoldPage.scrollable(children: const [
        Text("Message")
      ],);
    }
    else if(widget.shellIndex == 2){
      return ScaffoldPage.scrollable(children: const [
        Text("Friends")
      ],);
    }
    else if(widget.shellIndex == 3){
      return ScaffoldPage.scrollable(children: const [
        Text("Call")
      ],);
    }
    else if(widget.shellIndex == 4){
      return ScaffoldPage.scrollable(children: const [
        Text("Bookmarked")
      ],);
    }
    else if(widget.shellIndex == 5){
      return ScaffoldPage.scrollable(children: const [
        Text("Settings")
      ],);
    }
    else{
      return Container();
    }
  }
}
