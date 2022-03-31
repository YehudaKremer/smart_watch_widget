import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog extends StatefulWidget {
  final Color color;
  final void Function(Color) onColorChanged;

  const ColorPickerDialog({
    Key? key,
    required this.onColorChanged,
    required this.color,
  }) : super(key: key);

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color color;
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 240),
      child: ContentDialog(
        style: const ContentDialogThemeData(
          padding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actionsSpacing: 0,
        ),
        content: SizedBox(
          height: 240,
          width: 210,
          child: material.Material(
            color: Colors.transparent,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ColorPicker(
                        pickerColor: color,
                        onColorChanged: (c) {
                          setState(() => color = c);
                          widget.onColorChanged(c);
                        },
                        colorPickerWidth: 210,
                        pickerAreaHeightPercent: 0.5,
                        displayThumbColor: true,
                        paletteType: PaletteType.hsvWithHue,
                        labelTypes: const [],
                        hexInputController: textController,
                        portraitOnly: true,
                        pickerAreaBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: SizedBox(
                          width: 150,
                          child: TextBox(
                            controller: textController,
                            prefix: const Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Icon(FluentIcons.number_symbol)),
                            suffix: material.Tooltip(
                              message: 'Copy color code',
                              child: IconButton(
                                icon: const Icon(FluentIcons.copy),
                                onPressed: () => Clipboard.setData(
                                    ClipboardData(text: textController.text)),
                              ),
                            ),
                            autofocus: true,
                            maxLength: 9,
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                              FilteringTextInputFormatter.allow(
                                  RegExp(kValidHexPattern)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
