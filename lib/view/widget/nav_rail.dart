import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitress/bloc/app_setting/app_setting_bloc.dart';

class NavRail extends StatelessWidget {
  const NavRail({super.key, required this.children});

  final List<IconMenuItem> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Ink(
        child: Column(
          children: [
            IconMenuItem(
              icon: Icons.account_circle_sharp,
              selected: false,
              onPressed: () => {},
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            ),
            Divider(
              height: 2,
              indent: 20,
              endIndent: 20,
              thickness: 2,
            ),
            IconMenuItem(
              icon: Icons.settings,
              selected: false,
              onPressed: () => {},
            ),
            IconMenuItem(
              icon: Icons.logout,
              selected: false,
              onPressed: () {
                context.read<AppSettingBloc>().add(UserLogoutEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class IconMenuItem extends StatefulWidget {
  IconMenuItem({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.selected,
    this.primaryColor = const Color.fromARGB(255, 255, 145, 0),
    this.containerSize = 72,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;
  final Color primaryColor;
  final double containerSize;

  @override
  State<IconMenuItem> createState() => _IconMenuItemState();
}

class _IconMenuItemState extends State<IconMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.containerSize,
      height: widget.containerSize,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(12),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.selected | isHover
              ? widget.primaryColor
              : widget.primaryColor.withAlpha(28),
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
            padding: const EdgeInsets.all(6),
            child: Icon(
              widget.icon,
              color: widget.selected | isHover
                  ? Colors.black
                  : widget.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
