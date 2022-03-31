import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:smart_watch_widget/utils/navigator.dart';

HotKey _goBackHotKey = HotKey(
  KeyCode.arrowLeft,
  modifiers: [KeyModifier.alt],
  scope: HotKeyScope.inapp,
);

var isGeneralHotKeysRegistered = false;

Future<void> registerGeneralHotKeys(BuildContext context) async {
  if (isGeneralHotKeysRegistered) return;
  await hotKeyManager.register(
    _goBackHotKey,
    keyDownHandler: (_) {
      if (Navigator.canPop(context)) {
        navigatorPop(context);
      }
    },
  );

  isGeneralHotKeysRegistered = true;
}
