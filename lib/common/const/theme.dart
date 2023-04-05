import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  const AppTheme(this.name, this.scheme, this.index);

  final String name;
  final FlexScheme scheme;
  final int index;
}

const themeData = [
  AppTheme(
    'M3',
    FlexScheme.materialBaseline,
    0,
  ),
  AppTheme(
    '樱花',
    FlexScheme.sakura,
    1,
  ),
];
