import 'package:flutter/material.dart';

import '../components/avatar.dart';
import '../helper/spacing.dart';

class NavRail extends StatelessWidget {
  const NavRail(
      {super.key,
      this.body = const [],
      this.leading = const [],
      this.trailing = const []});

  final List<_MenuItem> leading;
  final List<_MenuItem> body;
  final List<_MenuItem> trailing;

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

@immutable
class _MenuItem extends StatefulWidget {
  const _MenuItem({
    super.key,
    required this.onPressed,
    required this.selected,
    required this.containerSize,
  });

  final VoidCallback onPressed;
  final bool selected;
  final double containerSize;

  Widget content(BuildContext context, bool isHover) {
    return Container();
  }

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
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
            padding: const EdgeInsets.all(0),
            child: widget.content(context, isHover),
          ),
        ),
      ),
    );
  }
}

class IconMenuItem extends _MenuItem {
  const IconMenuItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected,
    this.containerSize = 64,
  }) : super(
          onPressed: onPressed,
          selected: selected,
          containerSize: containerSize,
        );

  final IconData icon;
  @override
  final VoidCallback onPressed;
  @override
  final bool selected;
  @override
  final double containerSize;

  @override
  Widget content(BuildContext context, bool isHover) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Icon(
      icon,
      color: selected | isHover ? Colors.black : primaryColor,
    );
  }
}

class AvatarMenuItem extends _MenuItem {
  const AvatarMenuItem({
    super.key,
    required this.name,
    required this.onPressed,
    required this.selected,
    this.image,
    this.containerSize = 64,
  }) : super(
          onPressed: onPressed,
          selected: selected,
          containerSize: containerSize,
        );

  final String name;
  final String? image;
  @override
  final VoidCallback onPressed;
  @override
  final bool selected;
  @override
  final double containerSize;

  @override
  Widget content(BuildContext context, bool isHover) {
    return Avatar(
      name: name,
      image: image ?? '',
      radius: selected | isHover ? 12 : 24,
    );
  }
}
