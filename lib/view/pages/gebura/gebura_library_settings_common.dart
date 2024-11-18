part of 'gebura_library_settings.dart';

class _CommonAppFolderScanSettingPage extends StatefulWidget {
  const _CommonAppFolderScanSettingPage({this.initialValue});

  final CommonAppScan? initialValue;

  @override
  State<_CommonAppFolderScanSettingPage> createState() =>
      _CommonAppFolderScanSettingPageState();
}

class _CommonAppFolderScanSettingPageState
    extends State<_CommonAppFolderScanSettingPage> {
  @override
  void initState() {
    super.initState();
    final initialValue = widget.initialValue ??
        CommonAppScan(
          uuid: const Uuid().v1(),
          basePath: '',
        );

    basePath = initialValue.basePath;
    excludeDirectoryMatchers = initialValue.excludeDirectoryMatchers;
    minInstallDirDepth = initialValue.minInstallDirDepth;
    maxInstallDirDepth = initialValue.maxInstallDirDepth;
    pathFieldMatcher = initialValue.pathFieldMatcher;
    _deconstructPathFieldMatcher();
    pathFieldMatcherAlignment = initialValue.pathFieldMatcherAlignment;
    includeExecutableMatchers = initialValue.includeExecutableMatchers;
    excludeExecutableMatchers = initialValue.excludeExecutableMatchers;
    minExecutableDepth = initialValue.minExecutableDepth;
    maxExecutableDepth = initialValue.maxExecutableDepth;

    basePathController.text = initialValue.basePath;
    excludeDirectoryMatchersController.text =
        initialValue.excludeDirectoryMatchers.join('\n');
    targetFileMatchersController.text =
        initialValue.includeExecutableMatchers.join('\n');
    excludeFileMatchersController.text =
        initialValue.excludeExecutableMatchers.join('\n');
  }

  Future<void> _saveAndExit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final success = await context
          .read<GeburaBloc>()
          .saveLocalCommonAppLibraryFolder(setting);
      if (success) {
        Navigator.of(context).pop();
      } else {
        Toast(title: '', message: '保存失败').show(context);
      }
    }
  }

  void _constructPathFieldMatcher() {
    final length = maxInstallDirDepth - minInstallDirDepth + 1;
    pathFieldMatcher = List.generate(length, (index) {
      return pathFieldMatcherMap[index] ?? CommonAppScanPathFieldMatcher.ignore;
    });
  }

  void _deconstructPathFieldMatcher() {
    pathFieldMatcherMap = {};
    for (var i = 0; i < pathFieldMatcher.length; i++) {
      pathFieldMatcherMap[i] = pathFieldMatcher[i];
    }
  }

  CommonAppScan get setting {
    _constructPathFieldMatcher();
    return CommonAppScan(
      basePath: basePath,
      excludeDirectoryMatchers: excludeDirectoryMatchers,
      minInstallDirDepth: minInstallDirDepth,
      maxInstallDirDepth: maxInstallDirDepth,
      pathFieldMatcher: pathFieldMatcher,
      pathFieldMatcherAlignment: pathFieldMatcherAlignment,
      includeExecutableMatchers: includeExecutableMatchers,
      excludeExecutableMatchers: excludeExecutableMatchers,
      minExecutableDepth: minExecutableDepth,
      maxExecutableDepth: maxExecutableDepth,
      uuid: '',
    );
  }

  late String basePath;
  late List<String> excludeDirectoryMatchers;
  late int minInstallDirDepth;
  late int maxInstallDirDepth;
  late List<CommonAppScanPathFieldMatcher> pathFieldMatcher;
  late Map<int, CommonAppScanPathFieldMatcher> pathFieldMatcherMap;
  late CommonAppScanPathFieldMatcherAlignment pathFieldMatcherAlignment;
  late List<String> includeExecutableMatchers;
  late List<String> excludeExecutableMatchers;
  late int minExecutableDepth;
  late int maxExecutableDepth;

  CommonAppFolderScanResult? result;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController basePathController = TextEditingController();
  final TextEditingController excludeDirectoryMatchersController =
      TextEditingController();
  final TextEditingController targetFileMatchersController =
      TextEditingController();
  final TextEditingController excludeFileMatchersController =
      TextEditingController();

  bool testRunning = false;
  String testRunMsg = '';
  IndexedTreeNode<CommonAppFolderScanResultDetail> tree =
      IndexedTreeNode.root();

  Future<void> doTest() async {
    setState(() {
      testRunning = true;
      testRunMsg = 'Scanning';
    });
    result = await scanCommonApps(setting);
    setState(() {
      testRunMsg = 'Indexing';
    });
    await Future.delayed(const Duration(seconds: 1), () {
      tree = indexTree();
    });
    setState(() {
      testRunning = false;
    });
  }

  IndexedTreeNode<CommonAppFolderScanResultDetail> indexTree() {
    final IndexedTreeNode<CommonAppFolderScanResultDetail> newTree =
        IndexedTreeNode.root();
    if (result == null) {
      testRunMsg = 'No result';
      return newTree;
    }
    String keyPath(List<String> parts) {
      final res = StringBuffer();
      for (final index in parts.asMap().keys) {
        if (index > 0) {
          res.write('.');
        }
        res.write(parts
            .take(index + 1)
            .map((e) => base64Encode(utf8.encode(e)))
            .join());
      }
      return res.toString();
    }

    String key(List<String> parts) {
      return parts.map((e) => base64Encode(utf8.encode(e))).join();
    }

    try {
      for (final detail in result!.details) {
        final parts = detail.path
            .replaceFirst(setting.basePath, '')
            .split(Platform.pathSeparator);

        IndexedListenableNode node = newTree;
        for (final index in parts.asMap().keys) {
          final path = parts.take(index + 1).toList();
          try {
            final child = newTree.elementAt(keyPath(path));
            node = child;
          } catch (e) {
            final newNode = IndexedTreeNode<CommonAppFolderScanResultDetail>(
              key: key(path),
              data: detail,
            );
            node.add(newNode);
            node = newNode;
          }
        }
      }
    } catch (e) {
      testRunMsg = 'Error: $e';
      return newTree;
    }
    testRunMsg = '';
    return newTree;
  }

  IconData _entryTypeIcon(
      BuildContext context, CommonAppFolderScanEntryType type) {
    switch (type) {
      case CommonAppFolderScanEntryType.file:
        return UniversalUI.of(context).icons.fileCopy;
      case CommonAppFolderScanEntryType.directory:
        return UniversalUI.of(context).icons.folder;
      case CommonAppFolderScanEntryType.unknown:
        return UniversalUI.of(context).icons.help;
    }
  }

  Color? _entryStatusColor(
      BuildContext context, CommonAppFolderScanEntryStatus status) {
    switch (status) {
      case CommonAppFolderScanEntryStatus.error:
        return Colors.red.shade400;
      case CommonAppFolderScanEntryStatus.hit:
        return Colors.green.shade400;
      case CommonAppFolderScanEntryStatus.skipped:
        return Theme.of(context).disabledColor;
      case CommonAppFolderScanEntryStatus.accessed:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopAlert(onConfirm: () async {
      await _saveAndExit(context);
    }, builder: (context, triggerPop) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('文件夹扫描设置'),
          shape: UniversalUI.of(context).defaultShape,
          backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
          leading: IconButton(
            icon: Icon(UniversalUI.of(context).icons.arrowBack),
            onPressed: triggerPop,
          ),
          actions: [
            UniversalTextButton.icon(
              label: const Text('保存并退出'),
              icon: Icon(UniversalUI.of(context).icons.check),
              onPressed: () {
                _saveAndExit(context);
              },
            ),
          ],
        ),
        body: BootstrapContainer(children: [
          BootstrapColumn(
            xxs: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('配置信息',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: DynMouseScroll(
                          builder: (context, controller, physics) {
                        return SingleChildScrollView(
                          controller: controller,
                          physics: physics,
                          child: Column(
                            children: SpacingHelper.listSpacing(
                              height: 8,
                              includeEnds: true,
                              children: [
                                SectionDividerFormField(
                                  title: Text(
                                    '基本',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                UniversalTextFormField(
                                  controller: basePathController,
                                  labelText: '起始路径',
                                  hintText: '请输入起始路径',
                                  suffixIcon: UniversalTextButton(
                                    onPressed: () async {
                                      final path = await FilePicker.platform
                                          .getDirectoryPath();
                                      if (path != null) {
                                        basePathController.text = path;
                                        setState(() {
                                          basePath = path;
                                        });
                                      }
                                    },
                                    child: const Text('选择'),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return '请输入起始路径';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    if (value != null) {
                                      setState(() {
                                        basePath = value;
                                      });
                                    }
                                  },
                                ),
                                SectionDividerFormField(
                                  title: Text(
                                    '安装目录扫描',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                UniversalTextFormField(
                                  controller:
                                      excludeDirectoryMatchersController,
                                  labelText: '排除文件夹',
                                  hintText: '请输入排除文件夹',
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  onSaved: (value) {
                                    if (value != null) {
                                      setState(() {
                                        excludeDirectoryMatchers =
                                            value.split('\n');
                                      });
                                    }
                                  },
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  child: const Text('安装目录深度'),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    NumberFormField(
                                      title: const Text('最小'),
                                      maxValue: allowedMaxInstallDirDepth,
                                      initialValue: setting.minInstallDirDepth,
                                      minValue: allowedMinInstallDirDepth,
                                      validator: (value) {
                                        if (value == null) {
                                          return '请输入最小安装目录深度';
                                        }
                                        if (value < allowedMinInstallDirDepth) {
                                          return '最小安装目录深度不能小于$allowedMinInstallDirDepth';
                                        }
                                        if (value > allowedMaxInstallDirDepth) {
                                          return '最小安装目录深度不能大于$allowedMaxInstallDirDepth';
                                        }
                                        if (value >
                                            setting.maxInstallDirDepth) {
                                          return '不能大于最大安装目录深度';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        if (value != null) {
                                          setState(() {
                                            minInstallDirDepth = value.toInt();
                                          });
                                        }
                                      },
                                    ),
                                    NumberFormField(
                                      title: const Text('最大'),
                                      maxValue: allowedMaxInstallDirDepth,
                                      initialValue: setting.maxInstallDirDepth,
                                      minValue: allowedMinInstallDirDepth,
                                      validator: (value) {
                                        if (value == null) {
                                          return '请输入最大安装目录深度';
                                        }
                                        if (value < allowedMinInstallDirDepth) {
                                          return '最大安装目录深度不能小于$allowedMinInstallDirDepth';
                                        }
                                        if (value > allowedMaxInstallDirDepth) {
                                          return '最大安装目录深度不能大于$allowedMaxInstallDirDepth';
                                        }
                                        if (value <
                                            setting.minInstallDirDepth) {
                                          return '不能小于最小安装目录深度';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        if (value != null) {
                                          setState(() {
                                            maxInstallDirDepth = value.toInt();
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  child: const Text('信息匹配'),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(basePath),
                                    for (var i = 0;
                                        i <
                                            maxInstallDirDepth -
                                                minInstallDirDepth +
                                                1;
                                        i++) ...[
                                      Text(Platform.pathSeparator),
                                      Container(
                                        width: 100,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: UniversalDropdownButtonFormField<
                                            CommonAppScanPathFieldMatcher>(
                                          value: pathFieldMatcherMap[i],
                                          isExpanded: true,
                                          onChanged: (value) {
                                            setState(() {
                                              pathFieldMatcherMap[i] = value!;
                                            });
                                          },
                                          items: CommonAppScanPathFieldMatcher
                                              .values
                                              .map((e) {
                                            return UniversalDropdownMenuItem(
                                              value: e,
                                              child: Text(
                                                  e.toString().split('.').last),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                    Text(Platform.pathSeparator),
                                  ],
                                ),
                                if (maxInstallDirDepth - minInstallDirDepth >
                                    0) ...[
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    alignment: Alignment.centerLeft,
                                    child: const Text('非最大深度时的匹配对齐'),
                                  ),
                                  UniversalSwitchFormField(
                                    title: Text(pathFieldMatcherAlignment ==
                                            CommonAppScanPathFieldMatcherAlignment
                                                .right
                                        ? '右对齐'
                                        : '左对齐'),
                                    initialValue: pathFieldMatcherAlignment ==
                                        CommonAppScanPathFieldMatcherAlignment
                                            .right,
                                    onChanged: (value) {
                                      setState(() {
                                        pathFieldMatcherAlignment = value
                                            ? CommonAppScanPathFieldMatcherAlignment
                                                .right
                                            : CommonAppScanPathFieldMatcherAlignment
                                                .left;
                                      });
                                    },
                                  ),
                                ],
                                SectionDividerFormField(
                                  title: Text(
                                    '启动文件扫描',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                UniversalExpansionTile(
                                  title: const Text('文件名匹配'),
                                  subtitle: const Text('点击展开，推荐保持默认'),
                                  children: SpacingHelper.listSpacing(
                                    height: 8,
                                    includeEnds: true,
                                    children: [
                                      UniversalTextFormField(
                                        controller:
                                            targetFileMatchersController,
                                        labelText: '包含文件',
                                        hintText: '请输入包含文件',
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        onSaved: (value) {
                                          if (value != null) {
                                            setState(() {
                                              includeExecutableMatchers =
                                                  value.split('\n');
                                            });
                                          }
                                        },
                                      ),
                                      UniversalTextFormField(
                                        controller:
                                            excludeFileMatchersController,
                                        labelText: '排除文件',
                                        hintText: '请输入排除文件',
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        onSaved: (value) {
                                          if (value != null) {
                                            setState(() {
                                              excludeExecutableMatchers =
                                                  value.split('\n');
                                            });
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.centerLeft,
                                  child: const Text('启动文件深度'),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    NumberFormField(
                                      title: const Text('最小'),
                                      maxValue: allowedMaxExecutableDepth,
                                      initialValue: setting.minExecutableDepth,
                                      minValue: allowedMinExecutableDepth,
                                      validator: (value) {
                                        if (value == null) {
                                          return '请输入最小启动文件深度';
                                        }
                                        if (value < allowedMinExecutableDepth) {
                                          return '最小启动文件深度不能小于$allowedMinExecutableDepth';
                                        }
                                        if (value > allowedMaxExecutableDepth) {
                                          return '最小启动文件深度不能大于$allowedMaxExecutableDepth';
                                        }
                                        if (value >
                                            setting.maxExecutableDepth) {
                                          return '不能大于最大启动文件深度';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        if (value != null) {
                                          setState(() {
                                            minExecutableDepth = value.toInt();
                                          });
                                        }
                                      },
                                    ),
                                    NumberFormField(
                                      title: const Text('最大'),
                                      maxValue: allowedMaxExecutableDepth,
                                      initialValue: setting.maxExecutableDepth,
                                      minValue: allowedMinExecutableDepth,
                                      validator: (value) {
                                        if (value == null) {
                                          return '请输入最大启动文件深度';
                                        }
                                        if (value < allowedMinExecutableDepth) {
                                          return '最大启动文件深度不能小于$allowedMinExecutableDepth';
                                        }
                                        if (value > allowedMaxExecutableDepth) {
                                          return '最大启动文件深度不能大于$allowedMaxExecutableDepth';
                                        }
                                        if (value <
                                            setting.minExecutableDepth) {
                                          return '不能小于最小启动文件深度';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        if (value != null) {
                                          setState(() {
                                            maxExecutableDepth = value.toInt();
                                          });
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BootstrapColumn(
            xxs: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: SpacingHelper.listSpacing(
                height: 16,
                children: [
                  UniversalElevatedButton.icon(
                    onPressed: testRunning
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              await doTest();
                            }
                          },
                    label: const Text('测试'),
                    icon: Icon(UniversalUI.of(context).icons.play),
                  ),
                  UniversalElevatedButton.icon(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    label: const Text('提交'),
                    icon: Icon(UniversalUI.of(context).icons.check),
                  ),
                ],
              ),
            ),
          ),
          BootstrapColumn(
            xxs: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text('扫描预览', style: Theme.of(context).textTheme.titleLarge),
                  Text(testRunMsg),
                  if (testRunning) const LinearProgressIndicator(),
                  if (result?.msg?.isNotEmpty ?? false) Text(result!.msg!),
                  Expanded(
                    child: TreeView.indexTyped<CommonAppFolderScanResultDetail,
                        IndexedTreeNode<CommonAppFolderScanResultDetail>>(
                      tree: tree,
                      expansionBehavior:
                          ExpansionBehavior.collapseOthersAndSnapToTop,
                      shrinkWrap: true,
                      showRootNode: false,
                      builder: (context, node) {
                        List<Widget> chips = [];
                        final usedMatchersCount =
                            <CommonAppScanPathFieldMatcher, int>{};
                        if (node.data != null) {
                          for (final matcher in node.data!.usedMatchers) {
                            usedMatchersCount.update(
                              matcher,
                              (value) => value + 1,
                              ifAbsent: () => 1,
                            );
                          }
                          chips = usedMatchersCount.entries
                              .map(
                                (e) => Chip(
                                  label: Text(
                                      '${e.key.toString().split('.').last}${e.value > 1 ? ' x${e.value}' : ''}'),
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                ),
                              )
                              .toList();
                        }
                        return UniversalListTile(
                          leading: Icon(
                            _entryTypeIcon(
                                context,
                                node.data?.type ??
                                    CommonAppFolderScanEntryType.unknown),
                          ),
                          title: Text(
                            node.data?.path
                                    .split(Platform.pathSeparator)
                                    .last ??
                                '未知',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: node.data != null
                                ? TextStyle(
                                    color: _entryStatusColor(
                                        context, node.data!.status))
                                : null,
                          ),
                          trailing: Wrap(
                            children: [
                              ...chips,
                              if (result?.installedApps.any((e) =>
                                      e.installPath == node.data?.path) ??
                                  false)
                                const Chip(
                                  label: Text('安装目录'),
                                  visualDensity: VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}
