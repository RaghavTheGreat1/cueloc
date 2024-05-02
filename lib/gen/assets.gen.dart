/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $MapStylesGen {
  const $MapStylesGen();

  /// File path: map_styles/dark_theme.json
  String get darkTheme => 'map_styles/dark_theme.json';

  /// File path: map_styles/light_theme.json
  String get lightTheme => 'map_styles/light_theme.json';

  /// List of all assets
  List<String> get values => [darkTheme, lightTheme];
}

class $AssetsAlarmSoundsGen {
  const $AssetsAlarmSoundsGen();

  /// File path: assets/alarm_sounds/morning.mp3
  String get morning => 'assets/alarm_sounds/morning.mp3';

  /// File path: assets/alarm_sounds/sunrise.mp3
  String get sunrise => 'assets/alarm_sounds/sunrise.mp3';

  /// List of all assets
  List<String> get values => [morning, sunrise];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/alarm-bw.png
  AssetGenImage get alarmBw => const AssetGenImage('assets/icons/alarm-bw.png');

  /// File path: assets/icons/alarm.png
  AssetGenImage get alarm => const AssetGenImage('assets/icons/alarm.png');

  /// File path: assets/icons/cueloc.png
  AssetGenImage get cueloc => const AssetGenImage('assets/icons/cueloc.png');

  /// List of all assets
  List<AssetGenImage> get values => [alarmBw, alarm, cueloc];
}

class $AssetsIllustrationsGen {
  const $AssetsIllustrationsGen();

  /// File path: assets/illustrations/undraw_adventure_map_hnin.svg
  String get undrawAdventureMapHnin =>
      'assets/illustrations/undraw_adventure_map_hnin.svg';

  /// List of all assets
  List<String> get values => [undrawAdventureMapHnin];
}

class Assets {
  Assets._();

  static const $AssetsAlarmSoundsGen alarmSounds = $AssetsAlarmSoundsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsIllustrationsGen illustrations =
      $AssetsIllustrationsGen();
  static const $MapStylesGen mapStyles = $MapStylesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
