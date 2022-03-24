import 'package:fluent_ui/fluent_ui.dart';
import '../platform_switcher.dart';

class FluentDemo extends StatelessWidget {
  const FluentDemo({Key? key, required this.platformSwitcher})
      : super(key: key);
  final PlatformSwitcher platformSwitcher;
  @override
  Widget build(BuildContext context) => FluentApp(
          home: SafeArea(
        child: NavigationView(
            appBar: const NavigationAppBar(
              title: Text('Fluent UI Sample'),
              automaticallyImplyLeading: false,
            ),
            pane: NavigationPane(
                selected: platformSwitcher.currentIdx,
                onChanged: (value) => platformSwitcher.currentIdx = value,
                displayMode: PaneDisplayMode.auto,
                items: ThemePlatform.values
                    .map((e) => PaneItem(
                          icon: const Icon(FluentIcons.fluid_logo),
                          title: Text(e.name),
                        ))
                    .toList()
                    .cast<NavigationPaneItem>())),
      ));
}
