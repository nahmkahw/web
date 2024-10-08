import 'package:flutter/material.dart';
import 'package:web/home_screen.dart';

class HomeProvider extends ChangeNotifier {
  String _title = "สวัสดีตอนเช้า";
  String get title => _title;

  IconData _icon = Icons.brightness_5;
  IconData get icon => _icon;

  ColorFilter _colorFilter =
      ColorFilter.mode(Color.fromARGB(255, 221, 211, 116), BlendMode.modulate);
  ColorFilter get colorFilter => _colorFilter;

  void getTimeHomePage() async {
    _title = await getTitile();
    _icon = await getIcon();
    _colorFilter = await getColorFilter();
    notifyListeners();
  }

  Future<String> getTitile() async {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return 'สวัสดีตอนเช้า';
    } else if (hour >= 12 && hour < 18) {
      return 'สวัสดีตอนบ่าย';
    } else {
      return 'สวัสดีตอนเย็น';
    }
  }

  Future<IconData> getIcon() async {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 12) {
      return Icons.brightness_5;
    } else if (hour >= 12 && hour < 18) {
      return Icons.brightness_6;
    } else {
      return Icons.brightness_2;
    }
  }

  Future<ColorFilter> getColorFilter() async {
    final hour = DateTime.now().hour;

    if (hour >= 6 && hour < 12) {
      return ColorFilter.mode(
          Colors.yellow.withOpacity(0.5), BlendMode.modulate);
    } else if (hour >= 12 && hour < 18) {
      return ColorFilter.mode(
          Colors.orange.withOpacity(0.5), BlendMode.modulate);
    } else {
      return ColorFilter.mode(
          Colors.blueGrey.withOpacity(0.5), BlendMode.modulate);
    }
  }
}
