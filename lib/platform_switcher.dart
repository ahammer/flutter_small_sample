import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/platforms/fluent_demo.dart';
import 'package:flutter_sample/platforms/material_demo.dart';

/// Api for the Platform Switcher
enum ThemePlatform { fluentUI, material }

extension ThemeEnumExtensions on ThemePlatform {
  IconData get icon {
    switch (this) {
      case ThemePlatform.fluentUI:
        return FluentIcons.cortana_logo_inner;
      case ThemePlatform.material:
        return Icons.android;
    }
  }

  PlatformSwitchBuilder get builder {
    switch (this) {
      case ThemePlatform.fluentUI:
        return (switcher) => FluentDemo(platformSwitcher: switcher);

      case ThemePlatform.material:
        return (switcher) => MaterialDemo(platformSwitcher: switcher);
    }
  }
}

/// Builds a widget with a PlatformSwitcher (Each Demo will "Switch Platforms")
typedef PlatformSwitchBuilder = Widget Function(PlatformSwitcher switcher);

/// This interface will allow switching platforms
/// The implementor just needs a getter/setter for selectedTheme
abstract class PlatformSwitcher {
  abstract ThemePlatform selectedTheme;

  int get currentIdx => ThemePlatform.values.indexOf(selectedTheme);
  set currentIdx(int newIdx) => selectedTheme = ThemePlatform.values[newIdx];
}

/// This Widget will switch Platforms for you. It's state fulfills
/// the `PlatformSwitcher` API
class PlatformSwitcherWidget extends StatefulWidget {
  const PlatformSwitcherWidget({Key? key}) : super(key: key);

  @override
  State<PlatformSwitcherWidget> createState() => _PlatformSwitcherWidgetState();
}

/// State Class For the PlatformSwitcher (also Implements PlatformSwitcher for
/// other Widgets to use)
class _PlatformSwitcherWidgetState extends State<PlatformSwitcherWidget>
    with PlatformSwitcher {
  // The currently selected theme
  var _selectedTheme = ThemePlatform.fluentUI;

  @override
  Widget build(BuildContext context) => _selectedTheme.builder(this);

  @override
  ThemePlatform get selectedTheme => _selectedTheme;

  @override
  set selectedTheme(ThemePlatform selectedTheme) {
    setState(() {
      _selectedTheme = selectedTheme;
    });
  }
}
