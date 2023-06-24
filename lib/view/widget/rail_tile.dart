// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RailTile extends StatelessWidget {
  Widget? leading;
  Widget? title;
  Widget? trailing;

  VoidCallback? onTap;
  bool selected;

  RailTile({
    Key? key,
    this.leading,
    this.title,
    this.trailing,
    this.onTap,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(kToolbarHeight),
      child: SizedBox(
        height: kToolbarHeight - 8,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kToolbarHeight),
          child: AnimatedContainer(
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(kToolbarHeight),
            ),
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Row(
              children: [
                SizedBox(
                  width: 12,
                ),
                if (leading != null)
                  SizedBox(
                    width: kToolbarHeight - 16,
                    child: IconTheme(
                      data: IconThemeData(
                        size: 24,
                        color: selected
                            ? Theme.of(context).colorScheme.onSecondaryContainer
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      child: leading!,
                    ),
                  ),
                if (leading == null)
                  SizedBox(
                    width: 4,
                  ),
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: selected
                          ? Theme.of(context).colorScheme.onSecondaryContainer
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    child: SizedBox(
                      child: title,
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                if (trailing != null)
                  SizedBox(
                    width: kToolbarHeight - 16,
                    child: trailing,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
