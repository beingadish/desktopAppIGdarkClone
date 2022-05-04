import 'package:fluent_ui/fluent_ui.dart';

class SettingShell extends StatefulWidget {
  const SettingShell({Key? key}) : super(key: key);

  @override
  State<SettingShell> createState() => _SettingShellState();
}

class _SettingShellState extends State<SettingShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(children: const [
      Text("Settings")
    ],);
  }
}
