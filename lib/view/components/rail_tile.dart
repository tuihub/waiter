import 'package:flutter/material.dart';

class RailTile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  final VoidCallback? onTap;
  final bool selected;

  const RailTile({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.onTap,
    this.selected = false,
  });

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
                const SizedBox(
                  width: 12,
                ),
                if (leading != null)
                  SizedBox(
                    width: kToolbarHeight - 16,
                    child: IconTheme(
                      data: IconThemeData(
                        size: 24,
                        color: selected
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      child: leading!,
                    ),
                  ),
                if (leading == null)
                  const SizedBox(
                    width: 4,
                  ),
                Expanded(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: selected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    child: SizedBox(
                      child: title,
                    ),
                  ),
                ),
                const SizedBox(
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
