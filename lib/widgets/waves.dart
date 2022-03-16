import 'package:fluent_ui/fluent_ui.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class Waves extends StatelessWidget {
  const Waves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            FluentTheme.of(context).accentColor,
            FluentTheme.of(context).accentColor.light
          ],
          [
            FluentTheme.of(context).accentColor,
            FluentTheme.of(context).accentColor.dark
          ],
          [
            FluentTheme.of(context).accentColor.dark,
            FluentTheme.of(context).accentColor.darkest
          ],
          [
            FluentTheme.of(context).accentColor.darkest,
            FluentTheme.of(context).accentColor.darkest.withOpacity(0.9)
          ]
        ],
        durations: [35000, 19440, 10800, 6000],
        heightPercentages: [0.35, 0.37, 0.40, 0.45],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),
      waveAmplitude: 0,
      size: Size(
        double.infinity,
        double.infinity,
      ),
    );
  }
}
