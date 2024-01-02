class BootstrapBreakpoints {
  static const int xxs = 0;
  static const int xs = 344;
  static const int sm = 576;
  static const int md = 768;
  static const int lg = 992;
  static const int xl = 1200;
  static const int xxl = 1400;
}

class BootstrapContainerMaxWidth {
  static const double xxs = double.infinity;
  static const double xs = 320;
  static const double sm = 540;
  static const double md = 720;
  static const double lg = 960;
  static const double xl = 1140;
  static const double xxl = 1320;
}

enum BootstrapSteps {
  undefined._(0),
  xxs._(1),
  xs._(2),
  sm._(3),
  md._(4),
  lg._(5),
  xl._(6),
  xxl._(7);

  const BootstrapSteps._(this.value);
  final int value;
}
