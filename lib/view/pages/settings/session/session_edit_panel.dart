import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';

import '../../../../bloc/tiphereth/tiphereth_bloc.dart';
import '../../../../l10n/l10n.dart';
import '../../../components/toast.dart';
import '../../../specialized/right_panel_form.dart';
import '../../../universal/button.dart';
import '../../frame_page.dart';

class SessionEditPanel extends StatelessWidget {
  const SessionEditPanel({super.key});

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
      buildWhen: (previous, current) =>
          previous.selectedSessionEditIndex != current.selectedSessionEditIndex,
      builder: (context, state) {
        final session =
            state.sessions != null && state.selectedSessionEditIndex != null
                ? state.sessions![state.selectedSessionEditIndex!]
                : UserSession();

        return RightPanelForm(
          title: Text(S.of(context).deviceDetail),
          formFields: [
            TextFormField(
              initialValue: session.id.id.toString(),
              readOnly: true,
              decoration: InputDecoration(
                labelText: S.of(context).id,
              ),
            ),
            TextFormField(
              initialValue: '${session.deviceInfo.deviceName} ',
              readOnly: true,
              decoration: InputDecoration(
                labelText: S.of(context).deviceName,
              ),
            ),
            TextFormField(
              initialValue: '${session.deviceInfo.systemVersion} ',
              readOnly: true,
              decoration: InputDecoration(
                label: Text(S.of(context).operatingSystem),
              ),
            ),
            TextFormField(
              initialValue:
                  '${session.deviceInfo.clientName} ${session.deviceInfo.clientVersion}',
              readOnly: true,
              decoration: InputDecoration(
                labelText: S.of(context).client,
              ),
            ),
            TextFormField(
              initialValue: session.createTime
                  .toDateTime(toLocal: true)
                  .toIso8601String(),
              readOnly: true,
              decoration: InputDecoration(
                label: Text(S.of(context).lastLogin),
              ),
            ),
          ],
          errorMsg: state is TipherethEditSessionState && state.failed
              ? state.msg
              : null,
          extraActions: [
            UniversalElevatedButton(
              onPressed: () {
                context.read<TipherethBloc>().add(TipherethEditSessionEvent(
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
