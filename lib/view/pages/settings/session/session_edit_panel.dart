import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:universal_ui/universal_ui.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import '../../frame_page.dart';

class SessionEditPanel extends StatelessWidget {
  const SessionEditPanel({super.key, required this.session});

  final UserSession session;

  void close(BuildContext context) {
    ModuleFramePage.of(context)?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
      listener: (context, state) {
        if (state is TipherethEditSessionState && state.success) {
          Toast(title: '', message: S.of(context).applySuccess).show(context);
          close(context);
        }
      },
      builder: (context, state) {
        return RightPanelForm(
          title: Text(S.of(context).deviceDetail),
          formFields: [
            UniversalTextFormField(
              initialValue: session.id.id.toString(),
              readOnly: true,
              labelText: S.of(context).id,
            ),
            UniversalTextFormField(
              initialValue: '${session.deviceInfo.deviceName} ',
              readOnly: true,
              labelText: S.of(context).deviceName,
            ),
            UniversalTextFormField(
              initialValue: '${session.deviceInfo.systemVersion} ',
              readOnly: true,
              labelText: S.of(context).operatingSystem,
            ),
            UniversalTextFormField(
              initialValue:
                  '${session.deviceInfo.clientName} ${session.deviceInfo.clientVersion}',
              readOnly: true,
              labelText: S.of(context).client,
            ),
            UniversalTextFormField(
              initialValue: session.createTime
                  .toDateTime(toLocal: true)
                  .toIso8601String(),
              readOnly: true,
              labelText: S.of(context).lastLogin,
            ),
          ],
          errorMsg: state is TipherethEditSessionState && state.failed
              ? state.msg
              : null,
          extraActions: [
            UniversalFilledButton(
              onPressed: () {
                context.read<TipherethBloc>().add(TipherethEditSessionEvent(
                      null,
                      session.id,
                    ));
              },
              backgroundColor: Colors.red,
              child: state is TipherethEditSessionState && state.processing
                  ? const CircularProgressIndicator()
                  : Text(
                      S.of(context).logoutDevice,
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
          ],
          close: () => close(context),
        );
      },
    );
  }
}
