import 'package:fluent_ui/fluent_ui.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

HotKey _goBackHotKey = HotKey(
  KeyCode.arrowLeft,
  modifiers: [KeyModifier.alt],
  scope: HotKeyScope.inapp,
);

var isGeneralHotKeysRegistered = false;

Future<void> registerGeneralHotKeys(BuildContext context) async {
  if (isGeneralHotKeysRegistered) return;
  print('registerHotKeys');
  await hotKeyManager.register(
    _goBackHotKey,
    keyDownHandler: (_) {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    },
  );

  isGeneralHotKeysRegistered = true;
}
