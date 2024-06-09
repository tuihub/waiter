import 'package:flutter/material.dart';
import 'package:smooth_scroll_multiplatform/smooth_scroll_multiplatform.dart';

import '../../l10n/l10n.dart';

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
  });

  final Widget? title;
  final GlobalKey<FormState>? formKey;
  final List<Widget> formFields;
  final List<Widget>? extraActions;
  final String? errorMsg;
  final void Function()? onSubmit;
  final bool? submitting;
  final void Function() close;

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
                children: widget.formFields,
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
