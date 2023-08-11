import 'dart:io';

import 'package:file_sizes/file_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../consts.dart';

class CacheSetting extends StatefulWidget {
  const CacheSetting({super.key});

  @override
  State<CacheSetting> createState() => _CacheSettingState();
}

class _CacheSettingState extends State<CacheSetting> {
  int cacheSize = 0;
  List<String> cacheFiles = [yesodCacheBoxKey];
  bool clearing = false;

  Future<int> _getFileSize(String path) async {
    final fileBytes = await File(path).readAsBytes();

    return fileBytes.lengthInBytes;
  }

  @override
  void initState() {
    super.initState();
    loadCacheSize();
  }

  Future<void> loadCacheSize() async {
    int size = 0;
    for (final box in cacheFiles) {
      final path = GetIt.I<Box<String>>(instanceName: box).path;
      if (path != null) {
        size += await _getFileSize(path);
      }
    }

    setState(() {
      cacheSize = size;
    });
    print('cache size loaded $cacheSize');
  }

  Future<void> clearCache() async {
    if (clearing) return;
    setState(() {
      clearing = true;
    });
    for (final box in cacheFiles) {
      await GetIt.I<Box<String>>(instanceName: box).clear();
    }
    await Future.delayed(const Duration(seconds: 1));
    await loadCacheSize();
    setState(() {
      clearing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
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
            FileSize.getSize(cacheSize),
            style: TextStyle(
              fontSize: 12,
              color: Theme.of(context).disabledColor,
            ),
          ),
          const Expanded(child: SizedBox()),
          TextButton.icon(
            onPressed: loadCacheSize,
            icon: const Icon(Icons.cached),
            label: const Text('刷新'),
          ),
          TextButton.icon(
            onPressed: clearCache,
            icon: clearing
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
  }
}
