// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/3carat.svg
  SvgGenImage get a3carat => const SvgGenImage('assets/svg/3carat.svg');

  /// File path: assets/svg/Vector.svg
  SvgGenImage get vector => const SvgGenImage('assets/svg/Vector.svg');

  /// File path: assets/svg/account_circle.svg
  SvgGenImage get accountCircle =>
      const SvgGenImage('assets/svg/account_circle.svg');

  /// File path: assets/svg/acute.svg
  SvgGenImage get acute => const SvgGenImage('assets/svg/acute.svg');

  /// File path: assets/svg/add_box.svg
  SvgGenImage get addBox => const SvgGenImage('assets/svg/add_box.svg');

  /// File path: assets/svg/add_shopping_cart.svg
  SvgGenImage get addShoppingCart =>
      const SvgGenImage('assets/svg/add_shopping_cart.svg');

  /// File path: assets/svg/chat.svg
  SvgGenImage get chat => const SvgGenImage('assets/svg/chat.svg');

  /// File path: assets/svg/chevron_backward.svg
  SvgGenImage get chevronBackward =>
      const SvgGenImage('assets/svg/chevron_backward.svg');

  /// File path: assets/svg/chevron_right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/svg/chevron_right.svg');

  /// File path: assets/svg/dataset.svg
  SvgGenImage get dataset => const SvgGenImage('assets/svg/dataset.svg');

  /// File path: assets/svg/discount.svg
  SvgGenImage get discount => const SvgGenImage('assets/svg/discount.svg');

  /// File path: assets/svg/globe.svg
  SvgGenImage get globe => const SvgGenImage('assets/svg/globe.svg');

  /// File path: assets/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svg/home.svg');

  /// File path: assets/svg/keep.svg
  SvgGenImage get keep => const SvgGenImage('assets/svg/keep.svg');

  /// File path: assets/svg/local_fire_department.svg
  SvgGenImage get localFireDepartment =>
      const SvgGenImage('assets/svg/local_fire_department.svg');

  /// File path: assets/svg/location_on.svg
  SvgGenImage get locationOn => const SvgGenImage('assets/svg/location_on.svg');

  /// File path: assets/svg/logo_talaat.svg
  SvgGenImage get logoTalaat => const SvgGenImage('assets/svg/logo_talaat.svg');

  /// File path: assets/svg/rocket.svg
  SvgGenImage get rocket => const SvgGenImage('assets/svg/rocket.svg');

  /// File path: assets/svg/workspace_premium.svg
  SvgGenImage get workspacePremium =>
      const SvgGenImage('assets/svg/workspace_premium.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    a3carat,
    vector,
    accountCircle,
    acute,
    addBox,
    addShoppingCart,
    chat,
    chevronBackward,
    chevronRight,
    dataset,
    discount,
    globe,
    home,
    keep,
    localFireDepartment,
    locationOn,
    logoTalaat,
    rocket,
    workspacePremium,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
