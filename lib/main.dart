// Model Imports
import 'package:desktop_app/models/all_pages.dart';
import 'package:desktop_app/models/pages.dart';
import 'package:desktop_app/models/colorThemes.dart';

// Shell Imports
import 'package:desktop_app/shells/bookmarkedShell.dart';
import 'package:desktop_app/shells/callShell.dart';
import 'package:desktop_app/shells/friendsShell.dart';
import 'package:desktop_app/shells/homeShell.dart';
import 'package:desktop_app/shells/messageShell.dart';
import 'package:desktop_app/shells/settingsShell.dart';

// UI Imports
import 'package:fluent_ui/fluent_ui.dart'; // for Fluent UI.
import 'package:bitsdojo_window/bitsdojo_window.dart'; // for custom Window Buttons and Sliding Feature
import 'package:window_manager/window_manager.dart'; // for managing the windows screen size.
import 'package:flutter/material.dart' as m; // for using material inside my fluent ui.
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

// importing color themes from colorThemes.dart model
var darkColor = DarkThemeScheme();


// for setting the custom colors of the custom window buttons provided by Bits-Dojo
var buttonColors = WindowButtonColors(
  normal: Colors.transparent,
  mouseOver: Colors.blue,
  iconNormal: Colors.white,
  iconMouseDown: Colors.white,
  iconMouseOver: Colors.white,
);

// made separate Widget Class for Window Buttons later used inside the main app

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
    return FluentApp(     // Same as MaterialApp for material UI
      theme: ThemeData(     // Light Theme
        brightness: Brightness.light,
        scaffoldBackgroundColor: m.Colors.grey,
        accentColor: Colors.blue,
      ),
      darkTheme: ThemeData(     // Dark Theme
        brightness: m.Brightness.dark,      // Used material colors inside the theme.
        accentColor: Colors.blue,
        menuColor: m.Colors.blueGrey,
      ),
      title: "ChatterBot",    // for name of the application outside the app below the icon
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
  int index = 0;    // initialising index from 0 so as to open Home Page directly whenever one opens the app.
  final List<AllPages> menu = const [     // creating list of all page menus using the AllPages Widget class
    AllPages(
      title: "Home",
      iconData: FluentIcons.home_group,
      pageName: Pages.home,     // for later purposes just for defining the
      info: InfoBadge(
        source: Text(""),   // Notification Text
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


  // below created function will be activated whenever the user will click of the window close buttons he/she will
  // encounter a prompt for the same. for ex : Are you sure want to exit ? YES/NO

  // @override
  // void onWindowClose() {
  //   // TODO: implement onWindowClose
  //   super.onWindowClose();
  // }

  @override
  Widget build(BuildContext context) {
    return NavigationView(    // Topmost bar of the app which will contain many other widgets including icons / titles
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
        actions: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
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
            return Shell(
              shellIndex: index,
            );
          }),
    );
  }
}

class Shell extends StatefulWidget {
  var shellIndex = 0;

  Shell({Key? key, required this.shellIndex}) : super(key: key);

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {

    // Maintaining the Shells from below
    // Accessing them from the Shell Directory
    // Shell is the part of Window screen that is displayed along with the Navigation Pane
    // and is maintained along with the Navigation Pane Index

    if (widget.shellIndex == 0) {
      return const HomeShell();
    } else if (widget.shellIndex == 1) {
      return const MessagesShell();
    } else if (widget.shellIndex == 2) {
      return const FriendsShell();
    } else if (widget.shellIndex == 3) {
      return const CallShell();
    } else if (widget.shellIndex == 4) {
      return const BookmarkedShell();
    } else if (widget.shellIndex == 5) {
      return const SettingShell();
    } else {
      return Container(
        child: const Center(
          child: Text("Something Error Occurred"),
        ),
      );
    }
  }
}
