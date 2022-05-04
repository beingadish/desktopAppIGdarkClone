import 'package:fluent_ui/fluent_ui.dart';

class CallShell extends StatefulWidget {
  const CallShell({Key? key}) : super(key: key);

  @override
  State<CallShell> createState() => _CallShellState();
}

class _CallShellState extends State<CallShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(children: const [
      Text("Call")
    ],);
  }
}
