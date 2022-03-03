import 'package:flutter/material.dart';

import 'color_patterns.dart';
import 'orientation_type.dart';

class LinearGradientStyle {
  /// Orientation
  static const ORIENTATION_VERTICAL = 0001;
  static const ORIENTATION_HORIZONTAL = 0002;

  /// Types of Gradient Style
  static const GRADIENT_TYPE_GRADE_GREY = 0;
  static const GRADIENT_TYPE_PIGGY_PINK = 1;
  static const GRADIENT_TYPE_COOL_BLUES = 2;
  static const GRADIENT_TYPE_MEGATRON = 3;
  static const GRADIENT_TYPE_MOONLIT_ASTEROID = 4;
  static const GRADIENT_TYPE_JSHINE = 5;
  static const GRADIENT_TYPE_EVENING_SUNSHINE = 6;
  static const GRADIENT_TYPE_DARK_OCEAN = 7;
  static const GRADIENT_TYPE_COOL_SKY = 8;
  static const GRADIENT_TYPE_YODA = 9;
  static const GRADIENT_TYPE_MEMARIANI = 10;
  static const GRADIENT_TYPE_AMIN = 11;
  static const GRADIENT_TYPE_HARVEY = 12;
  static const GRADIENT_TYPE_NEUROMANCER = 13;
  static const GRADIENT_TYPE_AZUR_LANE = 14;
  static const GRADIENT_TYPE_WITCHING_HOUR = 15;
  static const GRADIENT_TYPE_FLARE = 16;
  static const GRADIENT_TYPE_METAPOLIS = 17;
  static const GRADIENT_TYPE_KYOO_PAL = 18;
  static const GRADIENT_TYPE_KYE_MEH = 19;
  static const GRADIENT_TYPE_KYOO_TAH = 20;
  static const GRADIENT_TYPE_BY_DESIGN = 21;
  static const GRADIENT_TYPE_ULTRA_VOILET = 22;
  static const GRADIENT_TYPE_BURNING_ORANGE = 23;
  static const GRADIENT_TYPE_WIRETAP = 24;
  static const GRADIENT_TYPE_SUMMER_DOG = 25;
  static const GRADIENT_TYPE_RASTAFARI = 26;
  static const GRADIENT_TYPE_SIN_CITY_RED = 27;
  static const GRADIENT_TYPE_CITRUS_PEEL = 28;
  static const GRADIENT_TYPE_BLUE_RASPBERRY = 29;
  static const GRADIENT_TYPE_MARGO = 30;
  static const GRADIENT_TYPE_MAGIC = 31;
  static const GRADIENT_TYPE_EVENING_NIGHT = 32;
  static const GRADIENT_TYPE_VANUSA = 33;
  static const GRADIENT_TYPE_SHIFTY = 34;
  static const GRADIENT_TYPE_EXPRESSO = 35;
  static const GRADIENT_TYPE_SLIGHT_OCEAN_VIEW = 36;
  static const GRADIENT_TYPE_PURE_LUST = 37;
  static const GRADIENT_TYPE_MOON_PURPLE = 38;
  static const GRADIENT_TYPE_RED_SUNSET = 39;
  static const GRADIENT_TYPE_SHIFTER = 40;
  static const GRADIENT_TYPE_WEDDING_DAY_BLUES = 41;
  static const GRADIENT_TYPE_SAND_TO_BLUE = 42;
  static const GRADIENT_TYPE_QUEPAL = 43;
  static const GRADIENT_TYPE_PUN_YETA = 44;
  static const GRADIENT_TYPE_SUBLIME_LIGHT = 45;
  static const GRADIENT_TYPE_SUBLIME_VIVID = 46;
  static const GRADIENT_TYPE_BIGHEAD = 47;
  static const GRADIENT_TYPE_TARAN_TADO = 48;
  static const GRADIENT_TYPE_RELAXING_RED = 49;
  static const GRADIENT_TYPE_LAWRENCIUM = 50;
  static const GRADIENT_TYPE_OHHAPPINESS = 51;
  static const GRADIENT_TYPE_DELICATE = 52;
  static const GRADIENT_TYPE_SELENIUM = 53;
  static const GRADIENT_TYPE_SULPHUR = 54;
  static const GRADIENT_TYPE_PINK_FLAVOUR = 55;
  static const GRADIENT_TYPE_RAINBOW_BLUE = 56;
  static const GRADIENT_TYPE_ORANGE_FUN = 57;
  static const GRADIENT_TYPE_DIGITAL_WATER = 58;
  static const GRADIENT_TYPE_LITHIUM = 59;
  static const GRADIENT_TYPE_VELVET_SUN = 63;
  static const GRADIENT_TYPE_KING_YNA = 64;
  static const GRADIENT_TYPE_SUMMER = 65;
  static const GRADIENT_TYPE_ORANGE_CORAL = 66;
  static const GRADIENT_TYPE_PURPINK = 67;
  static const GRADIENT_TYPE_DULL = 68;
  static const GRADIENT_TYPE_KIMOBY_IS_THE_NEW_BLUE = 69;
  static const GRADIENT_TYPE_BROKEN_HEARTS = 70;
  static const GRADIENT_TYPE_SUBU = 71;
  static const GRADIENT_TYPE_SOCIALIVE = 72;
  static const GRADIENT_TYPE_CRIMSON_TIDE = 73;
  static const GRADIENT_TYPE_TELEGRAM = 74;
  static const GRADIENT_TYPE_TERMINAL = 75;
  static const GRADIENT_TYPE_SCOOTER = 76;
  static const GRADIENT_TYPE_ALIVE = 77;
  static const GRADIENT_TYPE_RELAY = 78;
  static const GRADIENT_TYPE_MERIDIAN = 79;
  static const GRADIENT_TYPE_COMPARE_NOW = 80;
  static const GRADIENT_TYPE_MELLO = 81;
  static const GRADIENT_TYPE_CRYSTAL_CLEAR = 82;
  static const GRADIENT_TYPE_VISIONS_OF_GRANDEUR = 83;
  static const GRADIENT_TYPE_CHITTY_CHITTY_BANG_BANG = 84;
  static const GRADIENT_TYPE_BLUE_SKIES = 85;
  static const GRADIENT_TYPE_SUNKIST = 86;
  static const GRADIENT_TYPE_COAL = 87;
  static const GRADIENT_TYPE_HTML = 88;
  static const GRADIENT_TYPE_CINNAMINT = 89;
  static const GRADIENT_TYPE_MALDIVES = 90;
  static const GRADIENT_TYPE_MINI = 91;
  static const GRADIENT_TYPE_SHA_LA_LA = 92;
  static const GRADIENT_TYPE_PURPLEPINE = 93;
  static const GRADIENT_TYPE_CELESTIAL = 94;
  static const GRADIENT_TYPE_LEARNING_AND_LEADING = 95;
  static const GRADIENT_TYPE_PACIFIC_DREAM = 96;
  static const GRADIENT_TYPE_VENICE = 97;
  static const GRADIENT_TYPE_ORCA = 98;
  static const GRADIENT_TYPE_LOVE_AND_LIBERTY = 99;
  static const GRADIENT_TYPE_VERY_BLUE = 100;
  static const GRADIENT_TYPE_CAN_YOU_FEEL_THE_LOVE_TONIGHT = 101;
  static const GRADIENT_TYPE_THE_BLUE_LAGOON = 102;
  static const GRADIENT_TYPE_UNDER_THE_LAKE = 103;
  static const GRADIENT_TYPE_HONEY_DEW = 104;
  static const GRADIENT_TYPE_ROSEANNA = 105;
  static const GRADIENT_TYPE_WHAT_LIES_BEYOND = 106;
  static const GRADIENT_TYPE_ROSE_COLORED_LENSES = 107;
  static const GRADIENT_TYPE_EASYMED = 108;
  static const GRADIENT_TYPE_COCOAA_ICE = 109;
  static const GRADIENT_TYPE_JODHPUR = 110;
  static const GRADIENT_TYPE_JAIPUR = 111;
  static const GRADIENT_TYPE_VICE_CITY = 112;
  static const GRADIENT_TYPE_MILD = 113;
  static const GRADIENT_TYPE_DAWN = 114;
  static const GRADIENT_TYPE_IBIZA_SUNSET = 115;
  static const GRADIENT_TYPE_RADAR = 116;
  static const GRADIENT_TYPE_PURPLE_80 = 117;
  static const GRADIENT_TYPE_BLACK_ROSE = 118;
  static const GRADIENT_TYPE_BRADY_BRADY_FUN_FUN = 119;
  static const GRADIENT_TYPE_EDS_SUNSET_GRADIENT = 120;
  static const GRADIENT_TYPE_SNAPCHAT = 121;
  static const GRADIENT_TYPE_COSMIC_FUSION = 122;
  static const GRADIENT_TYPE_NEPAL = 123;
  static const GRADIENT_TYPE_AZURE_POP = 124;
  static const GRADIENT_TYPE_LOVE_COUPLE = 125;
  static const GRADIENT_TYPE_DISCO = 126;
  static const GRADIENT_TYPE_LIMEADE = 127;
  static const GRADIENT_TYPE_DANIA = 128;
  static const GRADIENT_TYPE_SHADES_OF_GREY_50 = 129;
  static const GRADIENT_TYPE_JUPITER = 130;
  static const GRADIENT_TYPE_IIIT_DELHI = 131;
  static const GRADIENT_TYPE_SUN_ON_THE_HORIZON = 132;
  static const GRADIENT_TYPE_BLOOD_RED = 133;
  static const GRADIENT_TYPE_SHERBERT = 134;
  static const GRADIENT_TYPE_FIREWATCH = 135;
  static const GRADIENT_TYPE_LUSH = 136;
  static const GRADIENT_TYPE_FROST = 137;
  static const GRADIENT_TYPE_MAUVE = 138;
  static const GRADIENT_TYPE_ROYAL = 139;
  static const GRADIENT_TYPE_MINIMAL_RED = 140;
  static const GRADIENT_TYPE_DUSK = 141;
  static const GRADIENT_TYPE_DEEP_SEA_SPACE = 142;
  static const GRADIENT_TYPE_GRAPEFRUIT_SUNSET = 143;
  static const GRADIENT_TYPE_SUNSET = 144;
  static const GRADIENT_TYPE_SOLID_VAULT = 145;
  static const GRADIENT_TYPE_BRIGHT_VAULT = 146;
  static const GRADIENT_TYPE_POLITICS = 147;
  static const GRADIENT_TYPE_SWEET_MORNING = 148;
  static const GRADIENT_TYPE_SYLVIA = 149;
  static const GRADIENT_TYPE_TRANSFILE = 150;
  static const GRADIENT_TYPE_TRANQUIL = 151;
  static const GRADIENT_TYPE_RED_OCEAN = 152;
  static const GRADIENT_TYPE_SHAHABI = 153;
  static const GRADIENT_TYPE_ALIHOSSEIN = 154;
  static const GRADIENT_TYPE_ALI = 155;
  static const GRADIENT_TYPE_PURPLE_WHITE = 156;
  static const GRADIENT_TYPE_COLORS_OF_SKY = 157;
  static const GRADIENT_TYPE_DECENT = 158;
  static const GRADIENT_TYPE_DEEP_SPACE = 159;
  static const GRADIENT_TYPE_DARK_SKIES = 160;
  static const GRADIENT_TYPE_SUZY = 161;
  static const GRADIENT_TYPE_SUPERMAN = 162;
  static const GRADIENT_TYPE_NIGHTHAWK = 163;
  static const GRADIENT_TYPE_FOREST = 164;
  static const GRADIENT_TYPE_MIAMI_DOLPHINS = 165;
  static const GRADIENT_TYPE_MINNESOTA_VIKINGS = 166;
  static const GRADIENT_TYPE_CHRISTMAS = 167;
  static const GRADIENT_TYPE_JOOMLA = 168;
  static const GRADIENT_TYPE_PIZELEX = 169;
  static const GRADIENT_TYPE_HAIKUS = 170;
  static const GRADIENT_TYPE_PALE_WOOD = 171;
  static const GRADIENT_TYPE_PURPLIN = 172;
  static const GRADIENT_TYPE_INBOX = 173;
  static const GRADIENT_TYPE_BLUSH = 174;
  static const GRADIENT_TYPE_BACK_TO_THE_FUTURE = 175;
  static const GRADIENT_TYPE_PONCHO = 176;
  static const GRADIENT_TYPE_GREEN_AND_BLUE = 177;
  static const GRADIENT_TYPE_LIGHT_ORANGE = 178;
  static const GRADIENT_TYPE_NETFLIX = 179;
  static const GRADIENT_TYPE_LITTLE_LEAF = 180;
  static const GRADIENT_TYPE_DEEP_PURPLE = 181;
  static const GRADIENT_TYPE_BACK_TO_EARTH = 182;
  static const GRADIENT_TYPE_MASTER_CARD = 183;
  static const GRADIENT_TYPE_CLEAR_SKY = 184;
  static const GRADIENT_TYPE_PASSION = 185;
  static const GRADIENT_TYPE_TIMBER = 186;
  static const GRADIENT_TYPE_BETWEEN_NIGHT_AND_DAY = 187;
  static const GRADIENT_TYPE_SAGE_PERSUASION = 188;
  static const GRADIENT_TYPE_LIZARD = 189;
  static const GRADIENT_TYPE_PIGLET = 190;
  static const GRADIENT_TYPE_DARK_KNIGHT = 191;
  static const GRADIENT_TYPE_CURIOSITY_BLUE = 192;
  static const GRADIENT_TYPE_UKRAINE = 193;
  static const GRADIENT_TYPE_GREEN_TO_DARK = 194;
  static const GRADIENT_TYPE_FRESH_TURBOSCENT = 195;
  static const GRADIENT_TYPE_KOKO_CARAMEL = 196;
  static const GRADIENT_TYPE_VIRGIN_AMERICA = 197;
  static const GRADIENT_TYPE_PORTRAIT = 198;
  static const GRADIENT_TYPE_TURQUOISE_FLOW = 199;
  static const GRADIENT_TYPE_VINE = 200;
  static const GRADIENT_TYPE_FLICKR = 201;
  static const GRADIENT_TYPE_INSTAGRAM = 202;
  static const GRADIENT_TYPE_ATLAS = 203;
  static const GRADIENT_TYPE_TWITCH = 204;
  static const GRADIENT_TYPE_PASTEL_ORANGE_AT_THE_SUN = 205;
  static const GRADIENT_TYPE_ENDLESS_RIVER = 206;
  static const GRADIENT_TYPE_PREDAWN = 207;
  static const GRADIENT_TYPE_PURPLE_BLISS = 208;
  static const GRADIENT_TYPE_TALKING_TO_MICE_ELF = 209;
  static const GRADIENT_TYPE_HERSHEYS = 210;
  static const GRADIENT_TYPE_CRAZY_ORANGE_I = 211;
  static const GRADIENT_TYPE_BETWEEN_THE_CLOUDS = 212;
  static const GRADIENT_TYPE_METALLIC_TOAD = 213;
  static const GRADIENT_TYPE_MARTINI = 214;
  static const GRADIENT_TYPE_FRIDAY = 215;
  static const GRADIENT_TYPE_SERVQUICK = 216;
  static const GRADIENT_TYPE_BEHONGO = 217;
  static const GRADIENT_TYPE_SOUNDCLOUD = 218;
  static const GRADIENT_TYPE_FACEBOOK_MESSENGER = 219;
  static const GRADIENT_TYPE_SHORE = 220;
  static const GRADIENT_TYPE_CHEER_UP_EMO_KID = 221;
  static const GRADIENT_TYPE_AMETHYST = 222;
  static const GRADIENT_TYPE_MAN_OF_STEEL = 223;
  static const GRADIENT_TYPE_NEON_LIFE = 224;
  static const GRADIENT_TYPE_TEAL_LOVE = 225;
  static const GRADIENT_TYPE_RED_MIST = 226;
  static const GRADIENT_TYPE_STARFALL = 227;
  static const GRADIENT_TYPE_DANCE_TO_FORGET = 228;
  static const GRADIENT_TYPE_PARKLIFE = 229;
  static const GRADIENT_TYPE_CHERRYBLOSSOMS = 230;
  static const GRADIENT_TYPE_ASH = 231;
  static const GRADIENT_TYPE_VIRGIN = 232;
  static const GRADIENT_TYPE_EARTHLY = 233;
  static const GRADIENT_TYPE_DIRTY_FOG = 234;
  static const GRADIENT_TYPE_THE_STRAIN = 235;
  static const GRADIENT_TYPE_REEF = 236;
  static const GRADIENT_TYPE_CANDY = 237;
  static const GRADIENT_TYPE_AUTUMN = 238;
  static const GRADIENT_TYPE_NELSON = 239;
  static const GRADIENT_TYPE_WINTER = 240;
  static const GRADIENT_TYPE_FOREVER_LOST = 241;
  static const GRADIENT_TYPE_ALMOST = 242;
  static const GRADIENT_TYPE_MOOR = 243;
  static const GRADIENT_TYPE_AQUALICIOUS = 244;
  static const GRADIENT_TYPE_MISTY_MEADOW = 245;
  static const GRADIENT_TYPE_KYOTO = 246;
  static const GRADIENT_TYPE_SIRIUS_TAMED = 247;
  static const GRADIENT_TYPE_JONQUIL = 248;
  static const GRADIENT_TYPE_PETRICHOR = 249;
  static const GRADIENT_TYPE_A_LOST_MEMORY = 250;
  static const GRADIENT_TYPE_VASILY = 251;
  static const GRADIENT_TYPE_BLURRY_BEACH = 252;
  static const GRADIENT_TYPE_NAMN = 253;
  static const GRADIENT_TYPE_DAY_TRIPPER = 254;
  static const GRADIENT_TYPE_PINOT_NOIR = 255;
  static const GRADIENT_TYPE_MIAKA = 256;
  static const GRADIENT_TYPE_ARMY = 257;
  static const GRADIENT_TYPE_SHRIMPY = 258;
  static const GRADIENT_TYPE_INFLUENZA = 259;
  static const GRADIENT_TYPE_CALM_DARYA = 260;
  static const GRADIENT_TYPE_BOURBON = 261;
  static const GRADIENT_TYPE_STELLAR = 262;
  static const GRADIENT_TYPE_CLOUDS = 263;
  static const GRADIENT_TYPE_MOONRISE = 264;
  static const GRADIENT_TYPE_PEACH = 265;
  static const GRADIENT_TYPE_DRACULA = 266;
  static const GRADIENT_TYPE_MANTLE = 267;
  static const GRADIENT_TYPE_TITANIUM = 268;
  static const GRADIENT_TYPE_OPA = 269;
  static const GRADIENT_TYPE_SEA_BLIZZ = 270;
  static const GRADIENT_TYPE_MIDNIGHT_CITY = 271;
  static const GRADIENT_TYPE_MYSTIC = 272;
  static const GRADIENT_TYPE_SHROOM_HAZE = 273;
  static const GRADIENT_TYPE_MOSS = 274;
  static const GRADIENT_TYPE_BORA_BORA = 275;
  static const GRADIENT_TYPE_VENICE_BLUE = 276;
  static const GRADIENT_TYPE_ELECTRIC_VIOLET = 277;
  static const GRADIENT_TYPE_KASHMIR = 278;
  static const GRADIENT_TYPE_STEEL_GRAY = 279;
  static const GRADIENT_TYPE_MIRAGE = 280;
  static const GRADIENT_TYPE_JUICY_ORANGE = 281;
  static const GRADIENT_TYPE_MOJITO = 282;
  static const GRADIENT_TYPE_CHERRY = 283;
  static const GRADIENT_TYPE_PINKY = 284;
  static const GRADIENT_TYPE_SEA_WEED = 285;
  static const GRADIENT_TYPE_STRIPE = 286;
  static const GRADIENT_TYPE_PURPLE_PARADISE = 287;
  static const GRADIENT_TYPE_SUNRISE = 288;
  static const GRADIENT_TYPE_AQUA_MARINE = 289;
  static const GRADIENT_TYPE_AUBERGINE = 290;
  static const GRADIENT_TYPE_BLOODY_MARY = 291;
  static const GRADIENT_TYPE_MANGO_PULP = 292;
  static const GRADIENT_TYPE_FROZEN = 293;
  static const GRADIENT_TYPE_ROSE_WATER = 294;
  static const GRADIENT_TYPE_HORIZON = 295;
  static const GRADIENT_TYPE_MONTE_CARLO = 296;
  static const GRADIENT_TYPE_LEMON_TWIST = 297;
  static const GRADIENT_TYPE_EMERALD_WATER = 298;
  static const GRADIENT_TYPE_INTUITIVE_PURPLE = 299;
  static const GRADIENT_TYPE_GREEN_BEACH = 300;
  static const GRADIENT_TYPE_SUNNY_DAYS = 301;
  static const GRADIENT_TYPE_PLAYING_WITH_REDS = 302;
  static const GRADIENT_TYPE_HARMONIC_ENERGY = 303;
  static const GRADIENT_TYPE_COOL_BROWN = 304;
  static const GRADIENT_TYPE_YOUTUBE = 305;
  static const GRADIENT_TYPE_NOON_TO_DUSK = 306;
  static const GRADIENT_TYPE_HAZEL = 307;
  static const GRADIENT_TYPE_NIMVELO = 308;
  static const GRADIENT_TYPE_SEA_BLUE = 309;
  static const GRADIENT_TYPE_BLOOKER20 = 310;
  static const GRADIENT_TYPE_SEXY_BLUE = 311;
  static const GRADIENT_TYPE_PURPLE_LOVE = 312;
  static const GRADIENT_TYPE_DIMIGO = 313;
  static const GRADIENT_TYPE_SKYLINE = 314;
  static const GRADIENT_TYPE_SEL = 315;
  static const GRADIENT_TYPE_SKY = 316;
  static const GRADIENT_TYPE_PETROL = 317;
  static const GRADIENT_TYPE_ANAMNISAR = 318;
  static const GRADIENT_TYPE_COPPER = 319;
  static const GRADIENT_TYPE_ROYAL_BLUE_PETROL = 320;
  static const GRADIENT_TYPE_ROYAL_BLUE = 321;
  static const GRADIENT_TYPE_WINDY = 322;
  static const GRADIENT_TYPE_REA = 323;
  static const GRADIENT_TYPE_BUPE = 324;
  static const GRADIENT_TYPE_MANGO = 325;
  static const GRADIENT_TYPE_REAQUA = 326;
  static const GRADIENT_TYPE_LUNADA = 327;
  static const GRADIENT_TYPE_BLUELAGOO = 328;
  static const GRADIENT_TYPE_ANWAR = 329;
  static const GRADIENT_TYPE_COMBI = 330;
  static const GRADIENT_TYPE_VER_BLACK = 331;
  static const GRADIENT_TYPE_VER = 332;
  static const GRADIENT_TYPE_BLU = 333;

  /// [getColorCombination()] which get color Combination based on Gradient Type Selection
  /// [OrientationType()] It will set Gradient offset Horizontal and Vertical based on Selection.
  static LinearGradient linearGradient(
      {required int orientation, required int gradientType}) {
    LinearGradient linearGradient;
    if (orientation == 0) {
      linearGradient = LinearGradient(
          colors: ColorPatterns().getColorCombination(gradientType),
          begin: const FractionalOffset(0.0, 0.0),
          end: OrientationType().offsetEnd(orientation),
          stops: ColorPatterns().getColorCombination(gradientType).length > 2
              ? [0.0, 0.0, 1.0]
              : [0.0, 1.0],
          tileMode: TileMode.mirror);
    } else if (orientation == 1) {
      linearGradient = LinearGradient(
          colors: ColorPatterns().getColorCombination(gradientType),
          begin: const FractionalOffset(0.0, 0.0),
          end: OrientationType().offsetEnd(orientation),
          stops: ColorPatterns().getColorCombination(gradientType).length > 2
              ? [0.0, 0.0, 1.0]
              : [0.0, 1.0],
          tileMode: TileMode.mirror);
    } else {
      linearGradient = LinearGradient(
          colors: ColorPatterns().getColorCombination(gradientType),
          begin: const FractionalOffset(0.0, 0.0),
          end: OrientationType().offsetEnd(orientation),
          stops: ColorPatterns().getColorCombination(gradientType).length > 2
              ? [0.0, 0.0, 1.0]
              : [0.0, 1.0],
          tileMode: TileMode.mirror);
    }

    return linearGradient;
  }

  static List<Color> getColorCombination({required int gradientType}) {
    return ColorPatterns().getColorCombination(gradientType);
  }
}
