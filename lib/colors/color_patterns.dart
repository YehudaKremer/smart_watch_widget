import 'package:flutter/material.dart';

import 'linear_gradient_style.dart';

/// Clear previous Color list.
///
/// Return colors list based on Gradient type selection

class ColorPatterns {
  List<Color> getColorCombination(int gradientType) {
    List<Color> colorList = [];

    if (colorList != null) {
      colorList.clear();
    }
    switch (gradientType) {
      case LinearGradientStyle.GRADIENT_TYPE_GRADE_GREY:
        colorList.add(Color(0xFFbdc3c7));
        colorList.add(Color(0xFF2c3e50));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PIGGY_PINK:
        colorList.add(Color(0xFFee9ca7));
        colorList.add(Color(0xFFffdde1));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COOL_BLUES:
        colorList.add(Color(0xFF2193b0));
        colorList.add(Color(0xFF6dd5ed));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MEGATRON:
        colorList.add(Color(0xFFc6ffdd));
        colorList.add(Color(0xFFfbd786));
        colorList.add(Color(0xFFf7797d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOONLIT_ASTEROID:
        colorList.add(Color(0xFF0f2027));
        colorList.add(Color(0xFF203a43));
        colorList.add(Color(0xFF2c5364));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JSHINE:
        colorList.add(Color(0xFF12c2e9));
        colorList.add(Color(0xFFc471ed));
        colorList.add(Color(0xFFf64f59));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EVENING_SUNSHINE:
        colorList.add(Color(0xFFb92b27));
        colorList.add(Color(0xFF1565c0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DARK_OCEAN:
        colorList.add(Color(0xFF373b44));
        colorList.add(Color(0xFF4286f4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COOL_SKY:
        colorList.add(Color(0xFF2980b9));
        colorList.add(Color(0xFF6dd5fa));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_YODA:
        colorList.add(Color(0xFFff0099));
        colorList.add(Color(0xFF493240));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MEMARIANI:
        colorList.add(Color(0xFFaa4b6b));
        colorList.add(Color(0xFF6b6b83));
        colorList.add(Color(0xFF3b8d99));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AMIN:
        colorList.add(Color(0xFF8e2de2));
        colorList.add(Color(0xFF4a00e0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HARVEY:
        colorList.add(Color(0xFF1f4037));
        colorList.add(Color(0xFF99f2c8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NEUROMANCER:
        colorList.add(Color(0xFFf953c6));
        colorList.add(Color(0xFFb91d73));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AZUR_LANE:
        colorList.add(Color(0xFF7f7fd5));
        colorList.add(Color(0xFF86a8e7));
        colorList.add(Color(0xFF91eae4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WITCHING_HOUR:
        colorList.add(Color(0xFFc31432));
        colorList.add(Color(0xFF240b36));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FLARE:
        colorList.add(Color(0xFFf12711));
        colorList.add(Color(0xFFf5af19));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_METAPOLIS:
        colorList.add(Color(0xFF659999));
        colorList.add(Color(0xFFf4791f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KYOO_PAL:
        colorList.add(Color(0xFFdd3e54));
        colorList.add(Color(0xFF6be585));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KYE_MEH:
        colorList.add(Color(0xFF8360c3));
        colorList.add(Color(0xFF2ebf91));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KYOO_TAH:
        colorList.add(Color(0xFF544a7d));
        colorList.add(Color(0xFFffd452));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BY_DESIGN:
        colorList.add(Color(0xFF009fff));
        colorList.add(Color(0xFFec2f4b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ULTRA_VOILET:
        colorList.add(Color(0xFF654ea3));
        colorList.add(Color(0xFFeaafc8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BURNING_ORANGE:
        colorList.add(Color(0xFFff416c));
        colorList.add(Color(0xFFff4b2b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WIRETAP:
        colorList.add(Color(0xFF8a2387));
        colorList.add(Color(0xFFe94057));
        colorList.add(Color(0xFFf27121));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUMMER_DOG:
        colorList.add(Color(0xFFa8ff78));
        colorList.add(Color(0xFF78ffd6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RASTAFARI:
        colorList.add(Color(0xFF1e9600));
        colorList.add(Color(0xFFfff200));
        colorList.add(Color(0xFFff0000));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SIN_CITY_RED:
        colorList.add(Color(0xFFed213a));
        colorList.add(Color(0xFF93291e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CITRUS_PEEL:
        colorList.add(Color(0xFFfdc830));
        colorList.add(Color(0xFFf37335));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLUE_RASPBERRY:
        colorList.add(Color(0xFF00b4db));
        colorList.add(Color(0xFF0083b0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MARGO:
        colorList.add(Color(0xFFffefba));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MAGIC:
        colorList.add(Color(0xFF59c173));
        colorList.add(Color(0xFFa17fe0));
        colorList.add(Color(0xFF5d26c1));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EVENING_NIGHT:
        colorList.add(Color(0xFF005aa7));
        colorList.add(Color(0xFFfffde4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VANUSA:
        colorList.add(Color(0xFFda4453));
        colorList.add(Color(0xFF89216b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHIFTY:
        colorList.add(Color(0xFF636363));
        colorList.add(Color(0xFFa2ab58));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EXPRESSO:
        colorList.add(Color(0xFFad5389));
        colorList.add(Color(0xFF3c1053));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SLIGHT_OCEAN_VIEW:
        colorList.add(Color(0xFFa8c0ff));
        colorList.add(Color(0xFF3f2b96));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURE_LUST:
        colorList.add(Color(0xFF333333));
        colorList.add(Color(0xFFdd1818));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOON_PURPLE:
        colorList.add(Color(0xFF4e54c8));
        colorList.add(Color(0xFF8f94fb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RED_SUNSET:
        colorList.add(Color(0xFF355c7d));
        colorList.add(Color(0xFF6c5b7b));
        colorList.add(Color(0xFFc06c84));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHIFTER:
        colorList.add(Color(0xFFbc4e9c));
        colorList.add(Color(0xFFf80759));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WEDDING_DAY_BLUES:
        colorList.add(Color(0xFF40e0d0));
        colorList.add(Color(0xFFff8c00));
        colorList.add(Color(0xFFff0080));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SAND_TO_BLUE:
        colorList.add(Color(0xFF3e5151));
        colorList.add(Color(0xFFdecba4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_QUEPAL:
        colorList.add(Color(0xFF11998e));
        colorList.add(Color(0xFF38ef7d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PUN_YETA:
        colorList.add(Color(0xFF108dc7));
        colorList.add(Color(0xFFef8e38));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUBLIME_LIGHT:
        colorList.add(Color(0xFFfc5c7d));
        colorList.add(Color(0xFF6a82fb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUBLIME_VIVID:
        colorList.add(Color(0xFFfc466b));
        colorList.add(Color(0xFF3f5efb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BIGHEAD:
        colorList.add(Color(0xFFc94b4b));
        colorList.add(Color(0xFF4b134f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TARAN_TADO:
        colorList.add(Color(0xFF23074d));
        colorList.add(Color(0xFFcc5333));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RELAXING_RED:
        colorList.add(Color(0xFFfffbd5));
        colorList.add(Color(0xFFb20a2c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LAWRENCIUM:
        colorList.add(Color(0xFF0f0c29));
        colorList.add(Color(0xFF302b63));
        colorList.add(Color(0xFF24243e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_OHHAPPINESS:
        colorList.add(Color(0xFF00b09b));
        colorList.add(Color(0xFF96c93d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DELICATE:
        colorList.add(Color(0xFFd3cce3));
        colorList.add(Color(0xFFe9e4f0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SELENIUM:
        colorList.add(Color(0xFF3c3b3f));
        colorList.add(Color(0xFF605c3c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SULPHUR:
        colorList.add(Color(0xFFcac531));
        colorList.add(Color(0xFFf3f9a7));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PINK_FLAVOUR:
        colorList.add(Color(0xFF800080));
        colorList.add(Color(0xFFffc0cb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RAINBOW_BLUE:
        colorList.add(Color(0xFF00f260));
        colorList.add(Color(0xFF0575e6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ORANGE_FUN:
        colorList.add(Color(0xFFfc4a1a));
        colorList.add(Color(0xFFf7b733));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DIGITAL_WATER:
        colorList.add(Color(0xFF74ebd5));
        colorList.add(Color(0xFFacb6e5));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LITHIUM:
        colorList.add(Color(0xFF6d6027));
        colorList.add(Color(0xFFd3cbb8));
        break;
/*      case LinearGradientStyle.GRADIENT_TYPE_ARGON:
        colorList.add(Color(0xFF03001e));
        colorList.add(Color(0xFF7303c0));
        colorList.add(Color(0xFFec38bc));
        colorList.add(Color(0xFFfdeff9));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HYDROGEN:
        colorList.add(Color(0xFF667db6));
        colorList.add(Color(0xFF0082c8));
        colorList.add(Color(0xFF0082c8));
        colorList.add(Color(0xFF667db6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ZINC:
        colorList.add(Color(0xFFada996));
        colorList.add(Color(0xFFf2f2f2));
        colorList.add(Color(0xFFdbdbdb));
        colorList.add(Color(0xFFeaeaea));
        break;*/
      case LinearGradientStyle.GRADIENT_TYPE_VELVET_SUN:
        colorList.add(Color(0xFFe1eec3));
        colorList.add(Color(0xFFf05053));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KING_YNA:
        colorList.add(Color(0xFF1a2a6c));
        colorList.add(Color(0xFFb21f1f));
        colorList.add(Color(0xFFfdbb2d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUMMER:
        colorList.add(Color(0xFF22c1c3));
        colorList.add(Color(0xFFfdbb2d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ORANGE_CORAL:
        colorList.add(Color(0xFFff9966));
        colorList.add(Color(0xFFff5e62));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPINK:
        colorList.add(Color(0xFF7f00ff));
        colorList.add(Color(0xFFe100ff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DULL:
        colorList.add(Color(0xFFc9d6ff));
        colorList.add(Color(0xFFe2e2e2));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KIMOBY_IS_THE_NEW_BLUE:
        colorList.add(Color(0xFF396afc));
        colorList.add(Color(0xFF2948ff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BROKEN_HEARTS:
        colorList.add(Color(0xFFd9a7c7));
        colorList.add(Color(0xFFfffcdc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUBU:
        colorList.add(Color(0xFF0cebeb));
        colorList.add(Color(0xFF20e3b2));
        colorList.add(Color(0xFF29ffc6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SOCIALIVE:
        colorList.add(Color(0xFF06beb6));
        colorList.add(Color(0xFF48b1bf));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CRIMSON_TIDE:
        colorList.add(Color(0xFF642b73));
        colorList.add(Color(0xFFc6426e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TELEGRAM:
        colorList.add(Color(0xFF1c92d2));
        colorList.add(Color(0xFFf2fcfe));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TERMINAL:
        colorList.add(Color(0xFF000000));
        colorList.add(Color(0xFF0f9b0f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SCOOTER:
        colorList.add(Color(0xFF36d1dc));
        colorList.add(Color(0xFF5b86e5));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ALIVE:
        colorList.add(Color(0xFFcb356b));
        colorList.add(Color(0xFFbd3f32));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RELAY:
        colorList.add(Color(0xFF3a1c71));
        colorList.add(Color(0xFFd76d77));
        colorList.add(Color(0xFFffaf7b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MERIDIAN:
        colorList.add(Color(0xFF283c86));
        colorList.add(Color(0xFF45a247));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COMPARE_NOW:
        colorList.add(Color(0xFFef3b36));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MELLO:
        colorList.add(Color(0xFFc0392b));
        colorList.add(Color(0xFF8e44ad));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CRYSTAL_CLEAR:
        colorList.add(Color(0xFF159957));
        colorList.add(Color(0xFF155799));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VISIONS_OF_GRANDEUR:
        colorList.add(Color(0xFF000046));
        colorList.add(Color(0xFF1cb5e0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CHITTY_CHITTY_BANG_BANG:
        colorList.add(Color(0xFF007991));
        colorList.add(Color(0xFF78ffd6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLUE_SKIES:
        colorList.add(Color(0xFF56ccf2));
        colorList.add(Color(0xFF2f80ed));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUNKIST:
        colorList.add(Color(0xFFf2994a));
        colorList.add(Color(0xFFf2c94c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COAL:
        colorList.add(Color(0xFFeb5757));
        colorList.add(Color(0xFF000000));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HTML:
        colorList.add(Color(0xFFe44d26));
        colorList.add(Color(0xFFf16529));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CINNAMINT:
        colorList.add(Color(0xFF4ac29a));
        colorList.add(Color(0xFFbdfff3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MALDIVES:
        colorList.add(Color(0xFFb2fefa));
        colorList.add(Color(0xFF0ed2f7));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MINI:
        colorList.add(Color(0xFF30e8bf));
        colorList.add(Color(0xFFff8235));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHA_LA_LA:
        colorList.add(Color(0xFFd66d75));
        colorList.add(Color(0xFFe29587));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLEPINE:
        colorList.add(Color(0xFF20002c));
        colorList.add(Color(0xFFcbb4d4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CELESTIAL:
        colorList.add(Color(0xFFc33764));
        colorList.add(Color(0xFF1d2671));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LEARNING_AND_LEADING:
        colorList.add(Color(0xFFf7971e));
        colorList.add(Color(0xFFffd200));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PACIFIC_DREAM:
        colorList.add(Color(0xFF34e89e));
        colorList.add(Color(0xFF0f3443));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VENICE:
        colorList.add(Color(0xFF6190e8));
        colorList.add(Color(0xFFa7bfe8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ORCA:
        colorList.add(Color(0xFF44a08d));
        colorList.add(Color(0xFF093637));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LOVE_AND_LIBERTY:
        colorList.add(Color(0xFF200122));
        colorList.add(Color(0xFF6f0000));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VERY_BLUE:
        colorList.add(Color(0xFF0575e6));
        colorList.add(Color(0xFF021b79));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CAN_YOU_FEEL_THE_LOVE_TONIGHT:
        colorList.add(Color(0xFF4568dc));
        colorList.add(Color(0xFFb06ab3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_THE_BLUE_LAGOON:
        colorList.add(Color(0xFF43c6ac));
        colorList.add(Color(0xFF191654));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_UNDER_THE_LAKE:
        colorList.add(Color(0xFF093028));
        colorList.add(Color(0xFF237a57));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HONEY_DEW:
        colorList.add(Color(0xFF43c6ac));
        colorList.add(Color(0xFFf8ffae));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROSEANNA:
        colorList.add(Color(0xFFffafbd));
        colorList.add(Color(0xFFffc3a0));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WHAT_LIES_BEYOND:
        colorList.add(Color(0xFFf0f2f0));
        colorList.add(Color(0xFF000c40));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROSE_COLORED_LENSES:
        colorList.add(Color(0xFFe8cbc0));
        colorList.add(Color(0xFF636fa4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EASYMED:
        colorList.add(Color(0xFFdce35b));
        colorList.add(Color(0xFF45b649));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COCOAA_ICE:
        colorList.add(Color(0xFFc0c0aa));
        colorList.add(Color(0xFF1cefff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JODHPUR:
        colorList.add(Color(0xFF9cecfb));
        colorList.add(Color(0xFF65c7f7));
        colorList.add(Color(0xFF0052d4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JAIPUR:
        colorList.add(Color(0xFFdbe6f6));
        colorList.add(Color(0xFFc5796d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VICE_CITY:
        colorList.add(Color(0xFF3494e6));
        colorList.add(Color(0xFFec6ead));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MILD:
        colorList.add(Color(0xFF67b26f));
        colorList.add(Color(0xFF4ca2cd));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DAWN:
        colorList.add(Color(0xFFf3904f));
        colorList.add(Color(0xFF3b4371));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_IBIZA_SUNSET:
        colorList.add(Color(0xFFee0979));
        colorList.add(Color(0xFFff6a00));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RADAR:
        colorList.add(Color(0xFFa770ef));
        colorList.add(Color(0xFFcf8bf3));
        colorList.add(Color(0xFFfdb99b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLE_80:
        colorList.add(Color(0xFF41295a));
        colorList.add(Color(0xFF2f0743));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLACK_ROSE:
        colorList.add(Color(0xFFf4c4f3));
        colorList.add(Color(0xFFfc67fa));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BRADY_BRADY_FUN_FUN:
        colorList.add(Color(0xFF00c3ff));
        colorList.add(Color(0xFFffff1c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EDS_SUNSET_GRADIENT:
        colorList.add(Color(0xFFff7e5f));
        colorList.add(Color(0xFFfeb47b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SNAPCHAT:
        colorList.add(Color(0xFFfffc00));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COSMIC_FUSION:
        colorList.add(Color(0xFFff00cc));
        colorList.add(Color(0xFF333399));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NEPAL:
        colorList.add(Color(0xFFde6161));
        colorList.add(Color(0xFF2657eb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AZURE_POP:
        colorList.add(Color(0xFFef32d9));
        colorList.add(Color(0xFF89fffd));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LOVE_COUPLE:
        colorList.add(Color(0xFF3a6186));
        colorList.add(Color(0xFF89253e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DISCO:
        colorList.add(Color(0xFF4ecdc4));
        colorList.add(Color(0xFF556270));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LIMEADE:
        colorList.add(Color(0xFFa1ffce));
        colorList.add(Color(0xFFfaffd1));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DANIA:
        colorList.add(Color(0xFFbe93c5));
        colorList.add(Color(0xFF7bc6cc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHADES_OF_GREY_50:
        colorList.add(Color(0xFFbdc3c7));
        colorList.add(Color(0xFF2c3e50));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JUPITER:
        colorList.add(Color(0xFFffd89b));
        colorList.add(Color(0xFF19547b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_IIIT_DELHI:
        colorList.add(Color(0xFF808080));
        colorList.add(Color(0xFF3fada8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUN_ON_THE_HORIZON:
        colorList.add(Color(0xFFfceabb));
        colorList.add(Color(0xFFf8b500));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLOOD_RED:
        colorList.add(Color(0xFFf85032));
        colorList.add(Color(0xFFe73827));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHERBERT:
        colorList.add(Color(0xFFf79d00));
        colorList.add(Color(0xFF64f38c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FIREWATCH:
        colorList.add(Color(0xFFcb2d3e));
        colorList.add(Color(0xFFef473a));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LUSH:
        colorList.add(Color(0xFF56ab2f));
        colorList.add(Color(0xFFa8e063));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FROST:
        colorList.add(Color(0xFF000428));
        colorList.add(Color(0xFF004e92));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MAUVE:
        colorList.add(Color(0xFF42275a));
        colorList.add(Color(0xFF734b6d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROYAL:
        colorList.add(Color(0xFF141e30));
        colorList.add(Color(0xFF243b55));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MINIMAL_RED:
        colorList.add(Color(0xFFf00000));
        colorList.add(Color(0xFFdc281e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DUSK:
        colorList.add(Color(0xFF2c3e50));
        colorList.add(Color(0xFFfd746c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DEEP_SEA_SPACE:
        colorList.add(Color(0xFF2c3e50));
        colorList.add(Color(0xFF4ca1af));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_GRAPEFRUIT_SUNSET:
        colorList.add(Color(0xFFe96443));
        colorList.add(Color(0xFF904e95));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUNSET:
        colorList.add(Color(0xFF0b486b));
        colorList.add(Color(0xFFf56217));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SOLID_VAULT:
        colorList.add(Color(0xFF3a7bd5));
        colorList.add(Color(0xFF3a6073));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BRIGHT_VAULT:
        colorList.add(Color(0xFF00d2ff));
        colorList.add(Color(0xFF928dab));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_POLITICS:
        colorList.add(Color(0xFF2196f3));
        colorList.add(Color(0xFFf44336));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SWEET_MORNING:
        colorList.add(Color(0xFFff5f6d));
        colorList.add(Color(0xFFffc371));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SYLVIA:
        colorList.add(Color(0xFFff4b1f));
        colorList.add(Color(0xFFff9068));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TRANSFILE:
        colorList.add(Color(0xFF16bffd));
        colorList.add(Color(0xFFcb3066));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TRANQUIL:
        colorList.add(Color(0xFFeecda3));
        colorList.add(Color(0xFFef629f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RED_OCEAN:
        colorList.add(Color(0xFF1d4350));
        colorList.add(Color(0xFFa43931));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHAHABI:
        colorList.add(Color(0xFFa80077));
        colorList.add(Color(0xFF66ff00));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ALIHOSSEIN:
        colorList.add(Color(0xFFf7ff00));
        colorList.add(Color(0xFFdb36a4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ALI:
        colorList.add(Color(0xFFff4b1f));
        colorList.add(Color(0xFF1fddff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLE_WHITE:
        colorList.add(Color(0xFFba5370));
        colorList.add(Color(0xFFf4e2d8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COLORS_OF_SKY:
        colorList.add(Color(0xFFe0eafc));
        colorList.add(Color(0xFFcfdef3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DECENT:
        colorList.add(Color(0xFF4ca1af));
        colorList.add(Color(0xFFc4e0e5));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DEEP_SPACE:
        colorList.add(Color(0xFF000000));
        colorList.add(Color(0xFF434343));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DARK_SKIES:
        colorList.add(Color(0xFF4b79a1));
        colorList.add(Color(0xFF283e51));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUZY:
        colorList.add(Color(0xFF834d9b));
        colorList.add(Color(0xFFd04ed6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUPERMAN:
        colorList.add(Color(0xFF0099f7));
        colorList.add(Color(0xFFf11712));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NIGHTHAWK:
        colorList.add(Color(0xFF2980b9));
        colorList.add(Color(0xFF2c3e50));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FOREST:
        colorList.add(Color(0xFF5a3f37));
        colorList.add(Color(0xFF2c7744));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MIAMI_DOLPHINS:
        colorList.add(Color(0xFF4da0b0));
        colorList.add(Color(0xFFd39d38));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MINNESOTA_VIKINGS:
        colorList.add(Color(0xFF5614b0));
        colorList.add(Color(0xFFdbd65c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CHRISTMAS:
        colorList.add(Color(0xFF2f7336));
        colorList.add(Color(0xFFaa3a38));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JOOMLA:
        colorList.add(Color(0xFF1e3c72));
        colorList.add(Color(0xFF2a5298));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PIZELEX:
        colorList.add(Color(0xFF114357));
        colorList.add(Color(0xFFf29492));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HAIKUS:
        colorList.add(Color(0xFFfd746c));
        colorList.add(Color(0xFFff9068));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PALE_WOOD:
        colorList.add(Color(0xFFeacda3));
        colorList.add(Color(0xFFd6ae7b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLIN:
        colorList.add(Color(0xFF6a3093));
        colorList.add(Color(0xFFa044ff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_INBOX:
        colorList.add(Color(0xFF457fca));
        colorList.add(Color(0xFF5691c8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLUSH:
        colorList.add(Color(0xFFb24592));
        colorList.add(Color(0xFFf15f79));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BACK_TO_THE_FUTURE:
        colorList.add(Color(0xFFc02425));
        colorList.add(Color(0xFFf0cb35));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PONCHO:
        colorList.add(Color(0xFF403a3e));
        colorList.add(Color(0xFFbe5869));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_GREEN_AND_BLUE:
        colorList.add(Color(0xFFc2e59c));
        colorList.add(Color(0xFF64b3f4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LIGHT_ORANGE:
        colorList.add(Color(0xFFffb75e));
        colorList.add(Color(0xFFed8f03));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NETFLIX:
        colorList.add(Color(0xFF8e0e00));
        colorList.add(Color(0xFF1f1c18));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LITTLE_LEAF:
        colorList.add(Color(0xFF76b852));
        colorList.add(Color(0xFF8dc26f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DEEP_PURPLE:
        colorList.add(Color(0xFF673ab7));
        colorList.add(Color(0xFF512da8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BACK_TO_EARTH:
        colorList.add(Color(0xFF00c9ff));
        colorList.add(Color(0xFF92fe9d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MASTER_CARD:
        colorList.add(Color(0xFFf46b45));
        colorList.add(Color(0xFFeea849));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CLEAR_SKY:
        colorList.add(Color(0xFF005c97));
        colorList.add(Color(0xFF363795));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PASSION:
        colorList.add(Color(0xFFe53935));
        colorList.add(Color(0xFFe35d5b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TIMBER:
        colorList.add(Color(0xFFfc00ff));
        colorList.add(Color(0xFF00dbde));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BETWEEN_NIGHT_AND_DAY:
        colorList.add(Color(0xFF2c3e50));
        colorList.add(Color(0xFF3498db));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SAGE_PERSUASION:
        colorList.add(Color(0xFFccccb2));
        colorList.add(Color(0xFF757519));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LIZARD:
        colorList.add(Color(0xFF304352));
        colorList.add(Color(0xFFd7d2cc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PIGLET:
        colorList.add(Color(0xFFee9ca7));
        colorList.add(Color(0xFFffdde1));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DARK_KNIGHT:
        colorList.add(Color(0xFFba8b02));
        colorList.add(Color(0xFF181818));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CURIOSITY_BLUE:
        colorList.add(Color(0xFF525252));
        colorList.add(Color(0xFF3d72b4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_UKRAINE:
        colorList.add(Color(0xFF004ff9));
        colorList.add(Color(0xFFfff94c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_GREEN_TO_DARK:
        colorList.add(Color(0xFF6a9113));
        colorList.add(Color(0xFF141517));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FRESH_TURBOSCENT:
        colorList.add(Color(0xFFf1f2b5));
        colorList.add(Color(0xFF135058));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KOKO_CARAMEL:
        colorList.add(Color(0xFFd1913c));
        colorList.add(Color(0xFFffd194));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VIRGIN_AMERICA:
        colorList.add(Color(0xFF7b4397));
        colorList.add(Color(0xFFdc2430));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PORTRAIT:
        colorList.add(Color(0xFF8e9eab));
        colorList.add(Color(0xFFeef2f3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TURQUOISE_FLOW:
        colorList.add(Color(0xFF136a8a));
        colorList.add(Color(0xFF267871));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VINE:
        colorList.add(Color(0xFF00bf8f));
        colorList.add(Color(0xFF001510));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FLICKR:
        colorList.add(Color(0xFFff0084));
        colorList.add(Color(0xFF33001b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_INSTAGRAM:
        colorList.add(Color(0xFF833ab4));
        colorList.add(Color(0xFFfd1d1d));
        colorList.add(Color(0xFFfcb045));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ATLAS:
        colorList.add(Color(0xFFfeac5e));
        colorList.add(Color(0xFFc779d0));
        colorList.add(Color(0xFF4bc0c8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TWITCH:
        colorList.add(Color(0xFF6441a5));
        colorList.add(Color(0xFF2a0845));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PASTEL_ORANGE_AT_THE_SUN:
        colorList.add(Color(0xFFffb347));
        colorList.add(Color(0xFFffcc33));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ENDLESS_RIVER:
        colorList.add(Color(0xFF43cea2));
        colorList.add(Color(0xFF185a9d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PREDAWN:
        colorList.add(Color(0xFFffa17f));
        colorList.add(Color(0xFF00223e));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLE_BLISS:
        colorList.add(Color(0xFF360033));
        colorList.add(Color(0xFF0b8793));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TALKING_TO_MICE_ELF:
        colorList.add(Color(0xFF948e99));
        colorList.add(Color(0xFF2e1437));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HERSHEYS:
        colorList.add(Color(0xFF1e130c));
        colorList.add(Color(0xFF9a8478));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CRAZY_ORANGE_I:
        colorList.add(Color(0xFFd38312));
        colorList.add(Color(0xFFa83279));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BETWEEN_THE_CLOUDS:
        colorList.add(Color(0xFF73c8a9));
        colorList.add(Color(0xFF373b44));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_METALLIC_TOAD:
        colorList.add(Color(0xFFabbaab));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MARTINI:
        colorList.add(Color(0xFFfdfc47));
        colorList.add(Color(0xFF24fe41));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FRIDAY:
        colorList.add(Color(0xFF83a4d4));
        colorList.add(Color(0xFFb6fbff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SERVQUICK:
        colorList.add(Color(0xFF485563));
        colorList.add(Color(0xFF29323c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BEHONGO:
        colorList.add(Color(0xFF52c234));
        colorList.add(Color(0xFF061700));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SOUNDCLOUD:
        colorList.add(Color(0xFFfe8c00));
        colorList.add(Color(0xFFf83600));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FACEBOOK_MESSENGER:
        colorList.add(Color(0xFF00c6ff));
        colorList.add(Color(0xFF0072ff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHORE:
        colorList.add(Color(0xFF70e1f5));
        colorList.add(Color(0xFFffd194));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CHEER_UP_EMO_KID:
        colorList.add(Color(0xFF556270));
        colorList.add(Color(0xFFff6b6b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AMETHYST:
        colorList.add(Color(0xFF9d50bb));
        colorList.add(Color(0xFF6e48aa));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MAN_OF_STEEL:
        colorList.add(Color(0xFF780206));
        colorList.add(Color(0xFF061161));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NEON_LIFE:
        colorList.add(Color(0xFFb3ffab));
        colorList.add(Color(0xFF12fff7));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TEAL_LOVE:
        colorList.add(Color(0xFFaaffa9));
        colorList.add(Color(0xFF11ffbd));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_RED_MIST:
        colorList.add(Color(0xFF000000));
        colorList.add(Color(0xFFe74c3c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_STARFALL:
        colorList.add(Color(0xFFf0c27b));
        colorList.add(Color(0xFF4b1248));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DANCE_TO_FORGET:
        colorList.add(Color(0xFFff4e50));
        colorList.add(Color(0xFFf9d423));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PARKLIFE:
        colorList.add(Color(0xFFadd100));
        colorList.add(Color(0xFF7b920a));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CHERRYBLOSSOMS:
        colorList.add(Color(0xFFfbd3e9));
        colorList.add(Color(0xFFbb377d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ASH:
        colorList.add(Color(0xFF606c88));
        colorList.add(Color(0xFF3f4c6b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VIRGIN:
        colorList.add(Color(0xFFc9ffbf));
        colorList.add(Color(0xFFffafbd));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EARTHLY:
        colorList.add(Color(0xFF649173));
        colorList.add(Color(0xFFdbd5a4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DIRTY_FOG:
        colorList.add(Color(0xFFb993d6));
        colorList.add(Color(0xFF8ca6db));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_THE_STRAIN:
        colorList.add(Color(0xFF870000));
        colorList.add(Color(0xFF190a05));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_REEF:
        colorList.add(Color(0xFF00d2ff));
        colorList.add(Color(0xFF3a7bd5));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CANDY:
        colorList.add(Color(0xFFd3959b));
        colorList.add(Color(0xFFbfe6ba));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AUTUMN:
        colorList.add(Color(0xFFdad299));
        colorList.add(Color(0xFFb0dab9));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NELSON:
        colorList.add(Color(0xFFf2709c));
        colorList.add(Color(0xFFff9472));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WINTER:
        colorList.add(Color(0xFFe6dada));
        colorList.add(Color(0xFF274046));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FOREVER_LOST:
        colorList.add(Color(0xFF5d4157));
        colorList.add(Color(0xFFa8caba));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ALMOST:
        colorList.add(Color(0xFFddd6f3));
        colorList.add(Color(0xFFfaaca8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOOR:
        colorList.add(Color(0xFF616161));
        colorList.add(Color(0xFF9bc5c3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AQUALICIOUS:
        colorList.add(Color(0xFF50c9c3));
        colorList.add(Color(0xFF96deda));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MISTY_MEADOW:
        colorList.add(Color(0xFF215f00));
        colorList.add(Color(0xFFe4e4d9));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KYOTO:
        colorList.add(Color(0xFFc21500));
        colorList.add(Color(0xFFffc500));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SIRIUS_TAMED:
        colorList.add(Color(0xFFefefbb));
        colorList.add(Color(0xFFd4d3dd));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JONQUIL:
        colorList.add(Color(0xFFffeeee));
        colorList.add(Color(0xFFddefbb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PETRICHOR:
        colorList.add(Color(0xFF666600));
        colorList.add(Color(0xFF999966));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_A_LOST_MEMORY:
        colorList.add(Color(0xFFde6262));
        colorList.add(Color(0xFFffb88c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VASILY:
        colorList.add(Color(0xFFe9d362));
        colorList.add(Color(0xFF333333));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLURRY_BEACH:
        colorList.add(Color(0xFFd53369));
        colorList.add(Color(0xFFcbad6d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NAMN:
        colorList.add(Color(0xFFa73737));
        colorList.add(Color(0xFF7a2828));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DAY_TRIPPER:
        colorList.add(Color(0xFFf857a6));
        colorList.add(Color(0xFFff5858));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PINOT_NOIR:
        colorList.add(Color(0xFF4b6cb7));
        colorList.add(Color(0xFF182848));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MIAKA:
        colorList.add(Color(0xFFfc354c));
        colorList.add(Color(0xFF0abfbc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ARMY:
        colorList.add(Color(0xFF414d0b));
        colorList.add(Color(0xFF727a17));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHRIMPY:
        colorList.add(Color(0xFFe43a15));
        colorList.add(Color(0xFFe65245));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_INFLUENZA:
        colorList.add(Color(0xFFc04848));
        colorList.add(Color(0xFF480048));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CALM_DARYA:
        colorList.add(Color(0xFF5f2c82));
        colorList.add(Color(0xFF49a09d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BOURBON:
        colorList.add(Color(0xFFec6f66));
        colorList.add(Color(0xFFf3a183));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_STELLAR:
        colorList.add(Color(0xFF7474bf));
        colorList.add(Color(0xFF348ac7));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CLOUDS:
        colorList.add(Color(0xFFece9e6));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOONRISE:
        colorList.add(Color(0xFFdae2f8));
        colorList.add(Color(0xFFd6a4a4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PEACH:
        colorList.add(Color(0xFFed4264));
        colorList.add(Color(0xFFffedbc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DRACULA:
        colorList.add(Color(0xFFdc2424));
        colorList.add(Color(0xFF4a569d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MANTLE:
        colorList.add(Color(0xFF24c6dc));
        colorList.add(Color(0xFF514a9d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_TITANIUM:
        colorList.add(Color(0xFF283048));
        colorList.add(Color(0xFF859398));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_OPA:
        colorList.add(Color(0xFF3d7eaa));
        colorList.add(Color(0xFFffe47a));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SEA_BLIZZ:
        colorList.add(Color(0xFF1cd8d2));
        colorList.add(Color(0xFF93edc7));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MIDNIGHT_CITY:
        colorList.add(Color(0xFF232526));
        colorList.add(Color(0xFF414345));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MYSTIC:
        colorList.add(Color(0xFF757f9a));
        colorList.add(Color(0xFFd7dde8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SHROOM_HAZE:
        colorList.add(Color(0xFF5c258d));
        colorList.add(Color(0xFF4389a2));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOSS:
        colorList.add(Color(0xFF134e5e));
        colorList.add(Color(0xFF71b280));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BORA_BORA:
        colorList.add(Color(0xFF2bc0e4));
        colorList.add(Color(0xFFeaecc6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VENICE_BLUE:
        colorList.add(Color(0xFF085078));
        colorList.add(Color(0xFF85d8ce));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ELECTRIC_VIOLET:
        colorList.add(Color(0xFF4776e6));
        colorList.add(Color(0xFF8e54e9));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_KASHMIR:
        colorList.add(Color(0xFF614385));
        colorList.add(Color(0xFF516395));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_STEEL_GRAY:
        colorList.add(Color(0xFF1f1c2c));
        colorList.add(Color(0xFF928dab));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MIRAGE:
        colorList.add(Color(0xFF16222a));
        colorList.add(Color(0xFF3a6073));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_JUICY_ORANGE:
        colorList.add(Color(0xFFff8008));
        colorList.add(Color(0xFFffc837));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MOJITO:
        colorList.add(Color(0xFF1d976c));
        colorList.add(Color(0xFF93f9b9));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_CHERRY:
        colorList.add(Color(0xFFeb3349));
        colorList.add(Color(0xFFf45c43));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PINKY:
        colorList.add(Color(0xFFdd5e89));
        colorList.add(Color(0xFFf7bb97));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SEA_WEED:
        colorList.add(Color(0xFF4cb8c4));
        colorList.add(Color(0xFF3cd3ad));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_STRIPE:
        colorList.add(Color(0xFF1fa2ff));
        colorList.add(Color(0xFF12d8fa));
        colorList.add(Color(0xFFa6ffcb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLE_PARADISE:
        colorList.add(Color(0xFF1d2b64));
        colorList.add(Color(0xFFf8cdda));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUNRISE:
        colorList.add(Color(0xFFff512f));
        colorList.add(Color(0xFFf09819));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AQUA_MARINE:
        colorList.add(Color(0xFF1a2980));
        colorList.add(Color(0xFF26d0ce));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_AUBERGINE:
        colorList.add(Color(0xFFaa076b));
        colorList.add(Color(0xFF61045f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLOODY_MARY:
        colorList.add(Color(0xFFff512f));
        colorList.add(Color(0xFFdd2476));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MANGO_PULP:
        colorList.add(Color(0xFFf09819));
        colorList.add(Color(0xFFedde5d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_FROZEN:
        colorList.add(Color(0xFF403b4a));
        colorList.add(Color(0xFFe7e9bb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROSE_WATER:
        colorList.add(Color(0xFFe55d87));
        colorList.add(Color(0xFF5fc3e4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HORIZON:
        colorList.add(Color(0xFF003973));
        colorList.add(Color(0xFFe5e5be));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MONTE_CARLO:
        colorList.add(Color(0xFFcc95c0));
        colorList.add(Color(0xFFdbd4b4));
        colorList.add(Color(0xFF7aa1d2));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LEMON_TWIST:
        colorList.add(Color(0xFF3ca55c));
        colorList.add(Color(0xFFb5ac49));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_EMERALD_WATER:
        colorList.add(Color(0xFF348f50));
        colorList.add(Color(0xFF56b4d3));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_INTUITIVE_PURPLE:
        colorList.add(Color(0xFFda22ff));
        colorList.add(Color(0xFF9733ee));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_GREEN_BEACH:
        colorList.add(Color(0xFF02aab0));
        colorList.add(Color(0xFF00cdac));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SUNNY_DAYS:
        colorList.add(Color(0xFFede574));
        colorList.add(Color(0xFFe1f5c4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PLAYING_WITH_REDS:
        colorList.add(Color(0xFFd31027));
        colorList.add(Color(0xFFea384d));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HARMONIC_ENERGY:
        colorList.add(Color(0xFF16a085));
        colorList.add(Color(0xFFf4d03f));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COOL_BROWN:
        colorList.add(Color(0xFF603813));
        colorList.add(Color(0xFFb29f94));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_YOUTUBE:
        colorList.add(Color(0xFFe52d27));
        colorList.add(Color(0xFFb31217));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NOON_TO_DUSK:
        colorList.add(Color(0xFFff6e7f));
        colorList.add(Color(0xFFbfe9ff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_HAZEL:
        colorList.add(Color(0xFF77a1d3));
        colorList.add(Color(0xFF79cbca));
        colorList.add(Color(0xFFe684ae));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_NIMVELO:
        colorList.add(Color(0xFF314755));
        colorList.add(Color(0xFF26a0da));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SEA_BLUE:
        colorList.add(Color(0xFF2b5876));
        colorList.add(Color(0xFF4e4376));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLOOKER20:
        colorList.add(Color(0xFFe65c00));
        colorList.add(Color(0xFFf9d423));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SEXY_BLUE:
        colorList.add(Color(0xFF2193b0));
        colorList.add(Color(0xFF6dd5ed));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PURPLE_LOVE:
        colorList.add(Color(0xFFcc2b5e));
        colorList.add(Color(0xFF753a88));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_DIMIGO:
        colorList.add(Color(0xFFec008c));
        colorList.add(Color(0xFFfc6767));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SKYLINE:
        colorList.add(Color(0xFF1488cc));
        colorList.add(Color(0xFF2b32b2));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SEL:
        colorList.add(Color(0xFF00467f));
        colorList.add(Color(0xFFa5cc82));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_SKY:
        colorList.add(Color(0xFF076585));
        colorList.add(Color(0xFFffffff));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_PETROL:
        colorList.add(Color(0xFFbbd2c5));
        colorList.add(Color(0xFF536976));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ANAMNISAR:
        colorList.add(Color(0xFF9796f0));
        colorList.add(Color(0xFFfbc7d4));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COPPER:
        colorList.add(Color(0xFFb79891));
        colorList.add(Color(0xFF94716b));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROYAL_BLUE_PETROL:
        colorList.add(Color(0xFFbbd2c5));
        colorList.add(Color(0xFF536976));
        colorList.add(Color(0xFF292e49));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ROYAL_BLUE:
        colorList.add(Color(0xFF536976));
        colorList.add(Color(0xFF292e49));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_WINDY:
        colorList.add(Color(0xFFacb6e5));
        colorList.add(Color(0xFF86fde8));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_REA:
        colorList.add(Color(0xFFffe000));
        colorList.add(Color(0xFF799f0c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BUPE:
        colorList.add(Color(0xFF00416a));
        colorList.add(Color(0xFFe4e5e6));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_MANGO:
        colorList.add(Color(0xFFffe259));
        colorList.add(Color(0xFFffa751));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_REAQUA:
        colorList.add(Color(0xFF799f0c));
        colorList.add(Color(0xFFacbb78));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_LUNADA:
        colorList.add(Color(0xFF5433ff));
        colorList.add(Color(0xFF20bdff));
        colorList.add(Color(0xFFa5fecb));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLUELAGOO:
        colorList.add(Color(0xFF0052d4));
        colorList.add(Color(0xFF4364f7));
        colorList.add(Color(0xFF6fb1fc));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_ANWAR:
        colorList.add(Color(0xFF334d50));
        colorList.add(Color(0xFFcbcaa5));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_COMBI:
        colorList.add(Color(0xFF00416a));
        colorList.add(Color(0xFF799f0c));
        colorList.add(Color(0xFFffe000));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VER_BLACK:
        colorList.add(Color(0xFFf7f8f8));
        colorList.add(Color(0xFFacbb78));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_VER:
        colorList.add(Color(0xFFffe000));
        colorList.add(Color(0xFF799f0c));
        break;
      case LinearGradientStyle.GRADIENT_TYPE_BLU:
        colorList.add(Color(0xFF00416a));
        colorList.add(Color(0xFFe4e5e6));
        break;
      default:
        {
          colorList.add(Color(0xFF8e2de2));
          colorList.add(Color(0xFF4a00e0));
        }
    }

    return colorList;
  }
}
