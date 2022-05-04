
import 'package:fluent_ui/fluent_ui.dart';

class BookmarkedShell extends StatefulWidget {
  const BookmarkedShell({Key? key}) : super(key: key);

  @override
  State<BookmarkedShell> createState() => _BookmarkedShellState();
}

class _BookmarkedShellState extends State<BookmarkedShell> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(children: const [
      Text("Bookmarked")
    ],);
  }
}
