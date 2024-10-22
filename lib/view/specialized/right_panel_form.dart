import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jsonschema_builder/flutter_jsonschema_builder.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:tuihub_protos/librarian/v1/common.pb.dart';
import 'package:tuihub_protos/librarian/v1/wellknown.pb.dart';

import '../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../l10n/l10n.dart';
import '../components/toast.dart';
import '../helper/app_bar.dart';
import '../universal/button.dart';
import '../universal/list_tile.dart';
import '../universal/spacing.dart';
import '../universal/universal.dart';

class RightPanelForm extends StatefulWidget {
  const RightPanelForm({
    super.key,
    required this.title,
    this.formKey,
    required this.formFields,
    this.extraActions,
    this.errorMsg,
    this.onSubmit,
    this.submitting,
    required this.close,
    this.spacing = 8,
  });

  final Widget? title;
  final GlobalKey<FormState>? formKey;
  final List<Widget> formFields;
  final List<Widget>? extraActions;
  final String? errorMsg;
  final void Function()? onSubmit;
  final bool? submitting;
  final void Function() close;
  final double spacing;

  @override
  State<StatefulWidget> createState() => _RightPanelFormState();
}

class _RightPanelFormState extends State<RightPanelForm> {
  @override
  void initState() {
    super.initState();
    if (widget.formKey != null) {
      formKey = widget.formKey!;
    } else {
      formKey = GlobalKey<FormState>();
    }
  }

  late GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        shape: UniversalUI.of(context).defaultShape,
        backgroundColor: UniversalUI.of(context).appBarBackgroundColor,
        leading: AppBarHelper.defaultRightLeading(context),
      ),
      body: DynMouseScroll(builder: (context, controller, physics) {
        return SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: SpacingHelper.listSpacing(
                  height: widget.spacing,
                  children: widget.formFields,
                ),
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: widget.errorMsg != null ? 48 : 0,
              child: widget.errorMsg != null
                  ? Ink(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(kToolbarHeight),
                      ),
                      child: Center(
                        child: Text(
                          widget.errorMsg ?? S.of(context).unknownErrorOccurred,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 8,
              children: [
                ...widget.extraActions ?? [],
                if (widget.onSubmit != null)
                  UniversalElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        widget.onSubmit?.call();
                      }
                    },
                    child: widget.submitting ?? false
                        ? const CircularProgressIndicator()
                        : Text(S.of(context).submit),
                  ),
                UniversalElevatedButton(
                  onPressed: () => widget.close(),
                  child: Text(S.of(context).close),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FormSectionDivider extends StatelessWidget {
  const FormSectionDivider({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 10,
          indent: 10,
          endIndent: 10,
          thickness: 2,
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.outline
              : Theme.of(context).colorScheme.outlineVariant,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class TextFormMessage extends StatelessWidget {
  const TextFormMessage({
    super.key,
    required this.title,
    this.message,
  });

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return UniversalExpansionTile(
      title: Text(
        title,
      ),
      children: [
        if (message != null)
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              message!,
            ),
          )
      ],
    );
  }
}

class TextFormErrorMessage extends StatelessWidget {
  const TextFormErrorMessage({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: UniversalListTile(
        leading: const Icon(Icons.error, color: Colors.red),
        title: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}

class TextReadOnlyFormField extends StatelessWidget {
  const TextReadOnlyFormField({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: UniversalIconButton(
            icon: const Icon(Icons.lock_outline),
            onPressed: () {
              const Toast(title: '', message: '该项目无法修改').show(context);
            }),
        suffixIcon: UniversalIconButton(
          icon: const Icon(Icons.copy),
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: value)).then((value) {
              const Toast(title: '', message: '已复制').show(context);
            });
          },
        ),
      ),
    );
  }
}

class FeatureRequestFormField extends StatefulWidget {
  const FeatureRequestFormField({
    super.key,
    required this.featureFlags,
    required this.jsonFormController,
    required this.onChanged,
    required this.getFeatureProvider,
    this.initialValue,
    this.flagReadOnly = false,
    this.spacing = 8,
  });

  final List<FeatureFlag> featureFlags;
  final JsonFormController jsonFormController;
  final void Function(FeatureRequest) onChanged;
  final PorterGroup? Function(String) getFeatureProvider;
  final FeatureRequest? initialValue;
  final bool flagReadOnly;
  final double spacing;

  @override
  State<FeatureRequestFormField> createState() =>
      _FeatureRequestFormFieldState();
}

class _FeatureRequestFormFieldState extends State<FeatureRequestFormField> {
  List<FeatureFlag> get featureFlags => widget.featureFlags;
  JsonFormController get jsonFormController => widget.jsonFormController;
  FeatureFlag? selectedFlag;
  String config = '{}';
  String? region;
  InternalID? contextId;
  PorterGroup? porterGroup;
  int buildCounter = 0;

  @override
  void initState() {
    super.initState();
    try {
      selectedFlag = widget.initialValue != null
          ? featureFlags.firstWhere(
              (e) => e.id == widget.initialValue!.id,
              orElse: FeatureFlag.new,
            )
          : featureFlags.first;
      config = widget.initialValue?.configJson ?? config;
      region = widget.initialValue?.region;
      contextId = widget.initialValue?.contextId;
      if (selectedFlag != null) {
        porterGroup = widget.getFeatureProvider(selectedFlag!.id);
      }
    } catch (_) {}
  }

  void _onChanged() {
    widget.onChanged(FeatureRequest(
      id: selectedFlag?.id,
      region: region,
      configJson: config,
      contextId: contextId,
    ));
    buildCounter++;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TipherethBloc, TipherethState>(
        builder: (context, state) {
      return Column(
        children: SpacingHelper.listSpacing(
          height: widget.spacing,
          children: [
            if (featureFlags.isEmpty)
              const TextFormErrorMessage(message: '服务器无可用类型')
            else if (!featureFlags.any((e) => e.id == selectedFlag?.id))
              TextFormErrorMessage(
                  message: '服务器未启用 ${widget.initialValue?.id ?? '功能'}'),
            if (widget.flagReadOnly)
              TextReadOnlyFormField(
                label: '类型',
                value: selectedFlag?.id ?? '',
              )
            else
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '类型',
                ),
                value: selectedFlag,
                items: [
                  for (final s in featureFlags)
                    DropdownMenuItem(
                      value: s,
                      child: Text(s.id),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedFlag = newValue;
                    if (selectedFlag != null) {
                      porterGroup = widget.getFeatureProvider(selectedFlag!.id);
                    }
                  });
                  _onChanged();
                },
                validator: (value) {
                  if (value == null) {
                    return '请选择类型';
                  }
                  return null;
                },
              ),
            if ((porterGroup?.regions.isNotEmpty ?? false) &&
                ((porterGroup?.regions.length ?? 0) > 1))
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '区域',
                ),
                value: null,
                items: [
                  for (final s in porterGroup!.regions)
                    DropdownMenuItem(
                      value: s,
                      child: Text(s),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    region = newValue;
                  });
                  _onChanged();
                },
                validator: (value) {
                  if (value == null) {
                    return '请选择区域';
                  }
                  return null;
                },
              ),
            if ((selectedFlag?.requireContext ?? false) &&
                state
                    .getPorterContexts(porterGroup?.globalName ?? '',
                        region: region ?? '')
                    .isEmpty)
              const TextFormErrorMessage(message: '无可用执行环境，请前往插件环境管理页面添加'),
            if (selectedFlag?.requireContext ?? false)
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '执行环境',
                ),
                value: contextId,
                items: [
                  for (final s in state.getPorterContexts(
                      porterGroup?.globalName ?? '',
                      region: region ?? ''))
                    DropdownMenuItem(
                      value: s.id,
                      enabled: s.status ==
                          PorterContextStatus.PORTER_CONTEXT_STATUS_ACTIVE,
                      child: Text(s.name),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    contextId = newValue;
                  });
                  _onChanged();
                },
                validator: (value) {
                  if (value == null) {
                    return '请选择执行环境';
                  }
                  return null;
                },
              ),
            if (selectedFlag != null &&
                featureFlags.any((e) => e.id == selectedFlag!.id))
              JsonForm(
                key: ValueKey(buildCounter++),
                controller: jsonFormController,
                jsonSchema: featureFlags
                    .firstWhere((e) => e.id == selectedFlag!.id)
                    .configJsonSchema,
                jsonData: config,
                onFormDataSaved: (data) {
                  config = jsonEncode(data);
                  _onChanged();
                },
                jsonFormSchemaUiConfig: JsonFormSchemaUiConfig(
                  expandGenesis: true,
                  headerTitleBuilder: (_, __) => Container(),
                  submitButtonBuilder: (_) => Container(),
                ),
              ),
          ],
        ),
      );
    });
  }
}
