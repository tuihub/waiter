import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/gebura.pb.dart';
import 'package:universal_io/io.dart';

import '../../../bloc/gebura/gebura_bloc.dart';

class NewLocalAppInstDialog extends StatefulWidget {
  const NewLocalAppInstDialog(
      {super.key, this.app, this.newAppWithSameInfo = false});

  final App? app;
  final bool newAppWithSameInfo;

  @override
  State<NewLocalAppInstDialog> createState() => _NewLocalAppInstDialogState();
}

class _NewLocalAppInstDialogState extends State<NewLocalAppInstDialog> {
  @override
  void initState() {
    super.initState();
    _nameController.text = widget.app?.name ?? '';
    _allowEditName = widget.app == null || widget.newAppWithSameInfo;
  }

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _pathController = TextEditingController();
  bool _allowEditName = true;
  bool _nameReadOnly = true;
  String? msg;

  Future<void> _selectPath() async {
    try {
      final p =
          await FilePicker.platform.getDirectoryPath(lockParentWindow: true);
      if (p != null) {
        setState(() {
          _pathController.text = p;
          if (_allowEditName) _nameController.text = basename(p);
        });
      }
    } catch (e) {
      setState(() {
        msg = e.toString();
      });
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeburaBloc, GeburaState>(
      listener: (context, state) {
        if (state is GeburaImportNewAppInstState && state.success) {
          Navigator.of(context).pop();
        }
        if (state is GeburaImportNewAppInstState && !state.success) {
          setState(() {
            msg = state.msg;
          });
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Text(
            widget.app != null
                ? widget.newAppWithSameInfo ?? false
                    ? '添加新版本'
                    : '添加新安装位置'
                : '添加新应用',
          ),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    widget.app != null
                        ? widget.newAppWithSameInfo ?? false
                            ? '为 ${widget.app!.name} 添加新版本'
                            : '为 ${widget.app!.name} 添加安装位置'
                        : '导入新应用并添加安装位置\n如果已经在其他设备导入过，此操作将产生重复应用',
                  ),
                ),
                TextFormField(
                  controller: _pathController,
                  decoration: InputDecoration(
                    labelText: '应用路径',
                    suffixIcon: TextButton(
                      onPressed: () async {
                        await _selectPath();
                      },
                      child: const Text('选择'),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入应用路径';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  readOnly: _nameReadOnly,
                  decoration: InputDecoration(
                    labelText: '应用名称',
                    suffixIcon: _allowEditName
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _nameReadOnly = !_nameReadOnly;
                              });
                            },
                            icon: Icon(
                                _nameReadOnly ? Icons.lock : Icons.lock_open),
                          )
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入应用名称';
                    }
                    return null;
                  },
                ),
                if (msg != null)
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 16),
                    child: Text(msg!),
                  ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (Directory(_pathController.text).existsSync()) {
                    context.read<GeburaBloc>().add(
                          GeburaImportNewAppInstEvent(
                            _pathController.text,
                            _nameController.text,
                            appID: widget.app?.id,
                            newAppWithInfoID: widget.newAppWithSameInfo
                                ? widget.app?.assignedAppInfoId
                                : null,
                          ),
                        );
                  } else {
                    setState(() {
                      msg = '应用路径不存在';
                    });
                  }
                }
              },
              child: (state is GeburaImportNewAppInstState && state.processing)
                  ? const CircularProgressIndicator()
                  : const Text('添加'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
          ],
        );
      },
    );
  }
}
