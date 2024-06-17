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

double calculateColumnWidth({
  required double containerWidth,
  required int xxs,
  int xs = -1,
  int sm = -1,
  int md = -1,
  int lg = -1,
  int xl = -1,
  int xxl = -1,
  BootstrapSteps fill = BootstrapSteps.undefined,
}) {
  int xxs_ = 0;
  int xs_ = 0;
  int sm_ = 0;
  int md_ = 0;
  int lg_ = 0;
  int xl_ = 0;
  int xxl_ = 0;
  double columnWidth;

  if (0 <= xxs && xxs <= 12) {
    xxs_ = xxs;
  } else {
    xxs_ = 0;
  }
  if (0 <= xs && xs <= 12) {
    xs_ = xs;
  } else {
    xs_ = xxs_;
  }
  if (0 <= sm && sm <= 12) {
    sm_ = sm;
  } else {
    sm_ = xs_;
  }
  if (0 <= md && md <= 12) {
    md_ = md;
  } else {
    md_ = sm_;
  }
  if (0 <= lg && lg <= 12) {
    lg_ = lg;
  } else {
    lg_ = md_;
  }
  if (0 <= xl && xl <= 12) {
    xl_ = xl;
  } else {
    xl_ = lg_;
  }
  if (0 <= xxl && xxl <= 12) {
    xxl_ = xxl;
  } else {
    xxl_ = xl_;
  }

  if (containerWidth == BootstrapContainerMaxWidth.xxs ||
      containerWidth < BootstrapContainerMaxWidth.xs) {
    if (fill.value >= BootstrapSteps.xxs.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = containerWidth * xxs_ / 12;
    }
  } else if (containerWidth < BootstrapContainerMaxWidth.sm) {
    if (fill.value >= BootstrapSteps.xs.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.xs * xs_ / 12;
    }
  } else if (containerWidth < BootstrapContainerMaxWidth.md) {
    if (fill.value >= BootstrapSteps.sm.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.sm * sm_ / 12;
    }
  } else if (containerWidth < BootstrapContainerMaxWidth.lg) {
    if (fill.value >= BootstrapSteps.md.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.md * md_ / 12;
    }
  } else if (containerWidth < BootstrapContainerMaxWidth.xl) {
    if (fill.value >= BootstrapSteps.lg.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.lg * lg_ / 12;
    }
  } else if (containerWidth < BootstrapContainerMaxWidth.xxl) {
    if (fill.value >= BootstrapSteps.xl.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.xl * xl_ / 12;
    }
  } else {
    if (fill.value >= BootstrapSteps.xxl.value) {
      columnWidth = containerWidth;
    } else {
      columnWidth = BootstrapContainerMaxWidth.xxl * xxl_ / 12;
    }
  }
  return columnWidth;
}
