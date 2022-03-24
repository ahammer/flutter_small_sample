import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/platform_switcher.dart';

class MaterialDemo extends StatelessWidget {
  final PlatformSwitcher platformSwitcher;

  const MaterialDemo({Key? key, required this.platformSwitcher})
      : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Material Theme"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: platformSwitcher.currentIdx,
              onTap: (newIdx) => platformSwitcher.currentIdx = newIdx,
              items: ThemePlatform.values
                  .map((e) => BottomNavigationBarItem(
                      icon: Icon(Icons.ac_unit), label: e.name))
                  .toList(),
            )),
      );
}
