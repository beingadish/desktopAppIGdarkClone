import 'package:fluent_ui/fluent_ui.dart';

class FriendsShell extends StatefulWidget {
  const FriendsShell({Key? key}) : super(key: key);

  @override
  State<FriendsShell> createState() => _FriendsShellState();
}

class _FriendsShellState extends State<FriendsShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(children: const [
      Text("Friends")
    ],);
  }
}
