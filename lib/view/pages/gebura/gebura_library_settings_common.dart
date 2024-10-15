part of 'gebura_library_settings.dart';

class _CommonSettingCard extends StatelessWidget {
  const _CommonSettingCard();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeburaBloc, GeburaState>(builder: (context, state) {
      final localCommonApps = state.localInstalledCommonAppInsts ?? {};
      final localTrackedCommonAppInsts = state.localTrackedAppInsts?.values
              .where((e) => e.commonLaunchSetting != null)
              .toList() ??
          [];
      final untrackedCommonApps = localCommonApps.values
          .where(
            (l) => localTrackedCommonAppInsts.every(
              (i) =>
                  i.commonLaunchSetting == null ||
                  l.installPath != i.commonLaunchSetting!.installPath,
            ),
          )
          .toList();
      final uninstalledCommonApps = localTrackedCommonAppInsts
          .where((e) =>
              localCommonApps[e.commonLaunchSetting!.installPath] == null)
          .toList();
      return Card(
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: SpacingHelper.listSpacing(width: 16, children: [
                  const Icon(Icons.folder),
                  const Text('文件夹扫描'),
                  Expanded(child: Container()),
                  // OutlinedButton.icon(
                  //   label: const Text('添加应用'),
                  //   icon: const Icon(FontAwesomeIcons.circlePlus),
                  //   onPressed: () {
                  //     // unawaited(
                  //     //   showDialog(
                  //     //     context: context,
                  //     //     builder: (_) {
                  //     //       return BlocProvider.value(
                  //     //         value: context.read<GeburaBloc>(),
                  //     //         child: const NewLocalAppInstDialog(),
                  //     //       );
                  //     //     },
                  //     //   ),
                  //     // );
                  //   },
                  // ),
                  OutlinedButton.icon(
                    label: const Text('添加文件夹'),
                    icon: const Icon(FontAwesomeIcons.folderPlus),
                    onPressed: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const _CommonAppFolderScanSettingPage();
                        }),
                      );
                    },
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      context
                          .read<GeburaBloc>()
                          .add(GeburaScanLocalCommonLibraryEvent());
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('刷新'),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              Text(
                  '发现${untrackedCommonApps.length}个游戏（已导入${localTrackedCommonAppInsts.length}个${uninstalledCommonApps.isNotEmpty ? '，已卸载${uninstalledCommonApps.length}个' : ''}）'),
              if (untrackedCommonApps.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                  ),
                  child: _CommonGameList(apps: untrackedCommonApps),
                ),
            ],
          ),
        ),
      );
    });
  }
}

class _CommonGameList extends StatefulWidget {
  const _CommonGameList({
    required this.apps,
  });

  final List<InstalledCommonApps> apps;

  @override
  State<_CommonGameList> createState() => _CommonGameListState();
}

class _CommonGameListState extends State<_CommonGameList> {
  @override
  void initState() {
    super.initState();
    selectedIndex = List.generate(widget.apps.length, (index) => false);
  }

  late List<bool> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      onSelectAll: (isSelectedAll) {
        if (isSelectedAll ?? false) {
          setState(() {
            selectedIndex = List.generate(widget.apps.length, (index) => true);
          });
        } else {
          setState(() {
            selectedIndex = List.generate(widget.apps.length, (index) => false);
          });
        }
      },
      columns: [
        DataColumn2(
          label: Text(
              '游戏列表${selectedIndex.contains(true) ? '（已选${selectedIndex.where((element) => element).length}个）' : ''}'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: selectedIndex.contains(true)
                  ? () {
                      // context.read<GeburaBloc>().add(
                      //       GeburaTrackCommonAppsEvent(
                      //         widget.apps
                      //             .where((element) => selectedIndex[
                      //                 widget.apps.indexOf(element)])
                      //             .map((e) => e.installPath)
                      //             .toList(),
                      //       ),
                      //     );
                      for (var i = 0; i < selectedIndex.length; i++) {
                        selectedIndex[i] = false;
                      }
                    }
                  : null,
              child: const Text('导入选中'),
            ),
          ),
          fixedWidth: 150,
        ),
      ],
      rows: widget.apps.map(
        (e) {
          return DataRow(
            selected: selectedIndex[widget.apps.indexOf(e)],
            onSelectChanged: (isSelected) {
              setState(() {
                selectedIndex[widget.apps.indexOf(e)] = isSelected ?? false;
              });
            },
            cells: [
              DataCell(Row(
                children: [
                  Text(e.name),
                ],
              )),
              DataCell(
                Align(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await OpenFile.open(e.installPath);
                      },
                      icon: const Icon(Icons.folder, size: 16),
                      label: const Text('查看'),
                    )),
              ),
            ],
          );
        },
      ).toList(),
    );
  }
}

class _CommonAppFolderScanSettingPage extends StatefulWidget {
  const _CommonAppFolderScanSettingPage({this.initialValue});

  final CommonAppFolderScanSetting? initialValue;

  @override
  State<_CommonAppFolderScanSettingPage> createState() =>
      _CommonAppFolderScanSettingPageState();
}

class _CommonAppFolderScanSettingPageState
    extends State<_CommonAppFolderScanSettingPage> {
  @override
  void initState() {
    super.initState();
    setting = widget.initialValue ?? CommonAppFolderScanSetting.empty();

    basePathController.text = setting.basePath;
    excludeDirectoryMatchersController.text =
        setting.excludeDirectoryMatchers.join('\n');
    targetFileMatchersController.text =
        setting.includeExecutableMatchers.join('\n');
    excludeFileMatchersController.text =
        setting.excludeExecutableMatchers.join('\n');
  }

  void _saveAndExit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<GeburaBloc>().add(
            GeburaSaveLocalCommonAppFolderSettingEvent(setting),
          );
      Navigator.of(context).pop();
    }
  }

  late CommonAppFolderScanSetting setting;
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

  IconData _entryTypeIcon(CommonAppFolderScanEntryType type) {
    switch (type) {
      case CommonAppFolderScanEntryType.file:
        return Icons.file_copy;
      case CommonAppFolderScanEntryType.directory:
        return Icons.folder;
      case CommonAppFolderScanEntryType.unknown:
        return Icons.help;
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
    return PopAlert(
      title: '确定退出',
      content: '是否保存更改再退出',
      onConfirm: () {
        _saveAndExit(context);
      },
      onDeny: () {},
      onCancel: () {},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('文件夹扫描设置'),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                _saveAndExit(context);
              },
            ),
          ],
        ),
        body: BootstrapContainer(children: [
          BootstrapColumn(
            xxs: 6,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Text('配置信息', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    Form(
                      key: _formKey,
                      child: Expanded(
                        child: DynMouseScroll(
                            builder: (context, controller, physics) {
                          return SingleChildScrollView(
                            controller: controller,
                            physics: physics,
                            child: Column(
                              children: SpacingHelper
                                  .listSpacing(height: 8, children: [
                                SectionDividerFormField(
                                  title: const Text('基本'),
                                ),
                                TextFormField(
                                  controller: basePathController,
                                  decoration: InputDecoration(
                                    labelText: '起始路径',
                                    hintText: '请输入起始路径',
                                    suffixIcon: TextButton(
                                      onPressed: () async {
                                        final path = await FilePicker.platform
                                            .getDirectoryPath();
                                        if (path != null) {
                                          basePathController.text = path;
                                          setState(() {
                                            setting = setting.copyWith(
                                                basePath: path);
                                          });
                                        }
                                      },
                                      child: const Text('选择'),
                                    ),
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
                                        setting =
                                            setting.copyWith(basePath: value);
                                      });
                                    }
                                  },
                                ),
                                SectionDividerFormField(
                                  title: const Text('文件夹扫描'),
                                ),
                                TextFormField(
                                  controller:
                                      excludeDirectoryMatchersController,
                                  decoration: const InputDecoration(
                                    labelText: '排除文件夹',
                                    hintText: '请输入排除文件夹',
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  onSaved: (value) {
                                    if (value != null) {
                                      setState(() {
                                        setting = setting.copyWith(
                                            excludeDirectoryMatchers:
                                                value.split('\n'));
                                      });
                                    }
                                  },
                                ),
                                SectionDividerFormField(
                                  title: const Text('启动文件定位'),
                                ),
                                TextFormField(
                                  controller: targetFileMatchersController,
                                  decoration: const InputDecoration(
                                    labelText: '目标文件',
                                    hintText: '请输入目标文件',
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  onSaved: (value) {
                                    if (value != null) {
                                      setState(() {
                                        setting = setting.copyWith(
                                            includeExecutableMatchers:
                                                value.split('\n'));
                                      });
                                    }
                                  },
                                ),
                                TextFormField(
                                  controller: excludeFileMatchersController,
                                  decoration: const InputDecoration(
                                    labelText: '排除文件',
                                    hintText: '请输入排除文件',
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  onSaved: (value) {
                                    if (value != null) {
                                      setState(() {
                                        setting = setting.copyWith(
                                            excludeExecutableMatchers:
                                                value.split('\n'));
                                      });
                                    }
                                  },
                                ),
                                Wrap(
                                  spacing: 8,
                                  children: [
                                    ElevatedButton(
                                      onPressed: testRunning
                                          ? null
                                          : () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                await doTest();
                                              }
                                            },
                                      child: const Text('测试'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                        }
                                      },
                                      child: const Text('提交'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                              ]),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )),
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
                  Expanded(
                    child: TreeView.indexTyped<CommonAppFolderScanResultDetail,
                        IndexedTreeNode<CommonAppFolderScanResultDetail>>(
                      tree: tree,
                      expansionBehavior:
                          ExpansionBehavior.collapseOthersAndSnapToTop,
                      shrinkWrap: true,
                      showRootNode: false,
                      builder: (context, node) => ListTile(
                        leading: Icon(
                          _entryTypeIcon(node.data?.type ??
                              CommonAppFolderScanEntryType.unknown),
                        ),
                        title: Text(
                          node.data?.path.split(Platform.pathSeparator).last ??
                              '未知',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: node.data != null
                              ? TextStyle(
                                  color: _entryStatusColor(
                                      context, node.data!.status))
                              : null,
                        ),
                        trailing: result?.installedApps.any(
                                    (e) => e.installPath == node.data?.path) ??
                                false
                            ? const Chip(
                                label: Text('安装目录'),
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                              )
                            : null,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
