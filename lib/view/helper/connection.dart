import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';

class ConnectionHelper {
  static bool isLocal(BuildContext context) {
    return context.read<MainBloc>().state.currentUser?.id.id == 0;
  }

  static bool isNotLocal(BuildContext context) {
    return !isLocal(context);
  }
}
