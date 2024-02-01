import 'package:flutter/material.dart';

import '../helper/spacing.dart';

class NavRail extends StatelessWidget {
  const NavRail(
      {super.key,
      this.body = const [],
      this.leading = const [],
      this.trailing = const []});

  final List<IconMenuItem> leading;
  final List<IconMenuItem> body;
  final List<IconMenuItem> trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Ink(
        child: Column(
          children: [
            if (leading.isNotEmpty) ...leading,
            if (leading.isNotEmpty && body.isNotEmpty)
              SpacingHelper.defaultDivider,
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: body,
              ),
            ),
            if ((leading.isNotEmpty || body.isNotEmpty) && body.isNotEmpty)
              SpacingHelper.defaultDivider,
            if (trailing.isNotEmpty) ...trailing,
          ],
        ),
      ),
    );
  }
}

class IconMenuItem extends StatefulWidget {
  const IconMenuItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected,
    this.containerSize = 64,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;
  final double containerSize;

  @override
  State<IconMenuItem> createState() => _IconMenuItemState();
}

class _IconMenuItemState extends State<IconMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: widget.containerSize,
      height: widget.containerSize,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(8),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.selected | isHover
              ? primaryColor
              : primaryColor.withAlpha(28),
          borderRadius: BorderRadius.all(
              Radius.circular(widget.selected | isHover ? 12 : 24)),
        ),
        child: InkWell(
          onTap: widget.onPressed,
          onHover: (val) => setState(() {
            isHover = val;
          }),
          borderRadius: BorderRadius.all(
              Radius.circular(widget.selected | isHover ? 12 : 24)),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(
              widget.icon,
              color: widget.selected | isHover ? Colors.black : primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
