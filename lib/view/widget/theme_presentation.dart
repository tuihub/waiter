import 'package:flutter/material.dart';

class ThemePresent extends StatelessWidget {
  final String title;
  final ColorScheme lightScheme;
  final ColorScheme darkScheme;
  final Brightness brightness;
  final bool selected;
  final VoidCallback? onTap;

  const ThemePresent({
    Key? key,
    required this.title,
    required this.lightScheme,
    required this.darkScheme,
    required this.selected,
    this.onTap,
    required this.brightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = brightness == Brightness.light
        ? ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme: lightScheme,
          )
        : ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: darkScheme,
          );
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: theme.colorScheme.primary),
        ),
        Material(
          color: theme.colorScheme.surfaceVariant,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Ink(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:
                    selected ? theme.colorScheme.primary : theme.disabledColor,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                splashColor: theme.colorScheme.primary,
                onTap: onTap,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: theme.colorScheme.background,
                  ),
                  width: 200,
                  height: 128,
                  child: Column(
                    children: [
                      Container(
                        height: 56,
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: theme.colorScheme.primaryContainer,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 16,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(8),
                                ),
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 16,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(8),
                                ),
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 32,
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 24,
                          width: 24,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: theme.colorScheme.tertiaryContainer,
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Ink(
                        height: 28,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          ),
                          color: theme.colorScheme.surfaceVariant,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Container(
                                height: 16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: theme.colorScheme.tertiary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
