import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../l10n/l10n.dart';
import '../components/toast.dart';
import '../helper/spacing.dart';

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        title: widget.title,
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
                  ElevatedButton(
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
                ElevatedButton(
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
      child: ListTile(
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
        prefixIcon: IconButton(
            icon: const Icon(Icons.lock_outline),
            onPressed: () {
              const Toast(title: '', message: '该项目无法修改').show(context);
            }),
        suffixIcon: IconButton(
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
