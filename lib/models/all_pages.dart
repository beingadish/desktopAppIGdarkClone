import 'package:fluent_ui/fluent_ui.dart';
import 'pages.dart';

class AllPages {
  final String title;
  final IconData iconData;
  final Pages pageName;
  final InfoBadge info;

  const AllPages({
    required this.title, required this.iconData, required this.pageName, required this.info,
});
}