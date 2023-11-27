import 'package:flutter/material.dart';

class RightPanelForm extends StatelessWidget {
  const RightPanelForm({
    super.key,
    this.title,
    required this.form,
    required this.actions,
  });

  final Widget? title;
  final Widget form;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        title: title,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16), child: form),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: actions,
        ),
      ),
    );
  }
}
