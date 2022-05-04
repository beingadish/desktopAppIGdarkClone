import 'package:fluent_ui/fluent_ui.dart';

class MessagesShell extends StatefulWidget {
  const MessagesShell({Key? key}) : super(key: key);

  @override
  State<MessagesShell> createState() => _MessagesShellState();
}

class _MessagesShellState extends State<MessagesShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(children: const [
      Text("Message")
    ],);
  }
}
