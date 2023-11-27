import 'package:file_sizes/file_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/main_bloc.dart';

class CacheSetting extends StatefulWidget {
  const CacheSetting({super.key});

  @override
  State<CacheSetting> createState() => _CacheSettingState();
}

class _CacheSettingState extends State<CacheSetting> {
  var _clearing = false;
  var _cacheSize = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(builder: (context, state) {
      _cacheSize = context.read<MainBloc>().cacheSize();
      return Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const SizedBox(height: kToolbarHeight, width: 16),
            const Text(
              '缓存',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              FileSize.getSize(_cacheSize),
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).disabledColor,
              ),
            ),
            const Expanded(child: SizedBox()),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _cacheSize = context.read<MainBloc>().cacheSize();
                });
              },
              icon: const Icon(Icons.cached),
              label: const Text('刷新'),
            ),
            TextButton.icon(
              onPressed: () async {
                setState(() {
                  _clearing = true;
                });
                await context.read<MainBloc>().clearCache().then((_) {
                  setState(() {
                    _cacheSize = context.read<MainBloc>().cacheSize();
                  });
                });
                setState(() {
                  _clearing = false;
                });
              },
              icon: _clearing
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                        ),
                      ))
                  : const Icon(Icons.delete),
              label: const Text('清空'),
            )
          ],
        ),
      );
    });
  }
}
