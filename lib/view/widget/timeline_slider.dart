import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TimelineSlider extends StatefulWidget {
  @override
  State<TimelineSlider> createState() => _TimelineSliderState();
}

class _TimelineSliderState extends State<TimelineSlider> {
  DateTime _value = DateTime(2002, 01, 01);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SfSlider.vertical(
        min: DateTime(2000, 01, 01, 00),
        max: DateTime(2000, 01, 31, 24),
        value: _value,
        interval: 10,
        showTicks: true,
        showDividers: true,
        // showLabels: true,
        enableTooltip: true,
        dateFormat: DateFormat.yMd(),
        dateIntervalType: DateIntervalType.days,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}
