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
      child: SizedBox(
        height: kToolbarHeight,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kToolbarHeight),
          child: Ink(
            decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(kToolbarHeight),
            ),
            child: Row(
              children: [
                leading != null
                    ? SizedBox(
                        width: kToolbarHeight - 16,
                        child: leading,
                      )
                    : SizedBox(
                        width: 12,
                      ),
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
