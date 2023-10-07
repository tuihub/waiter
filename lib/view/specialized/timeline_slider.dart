import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TimelineSlider extends StatefulWidget {
  const TimelineSlider({super.key});

  @override
  State<TimelineSlider> createState() => _TimelineSliderState();
}

class _TimelineSliderState extends State<TimelineSlider> {
  dynamic _value = DateTime(2002, 01, 01);

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
        activeTrackHeight: 10,
        inactiveTrackHeight: 10,
        activeTrackColor: Colors.grey,
        inactiveTrackColor: Colors.grey,
        activeDividerColor: Colors.grey,
        inactiveDividerColor: Colors.grey,
        activeDividerStrokeColor: Colors.white,
        activeDividerStrokeWidth: 2,
        inactiveDividerStrokeWidth: 2,
        inactiveDividerStrokeColor: Colors.white,
        activeDividerRadius: 5,
        inactiveDividerRadius: 5,
        labelOffset: const Offset(-100.0, 0.0),
      ),
      child: SfSlider.vertical(
        min: DateTime(2000, 01, 01, 00),
        max: DateTime(2000, 12, 31, 24),
        value: _value,
        interval: 1,
        // showTicks: true,
        showDividers: true,
        showLabels: true,
        enableTooltip: true,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        dateFormat: DateFormat.yMd(),
        dateIntervalType: DateIntervalType.months,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}
