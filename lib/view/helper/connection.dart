import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc.dart';

class ConnectionHelper {
  static bool isLocal(BuildContext context) {
    return context.read<MainBloc>().isLocal;
  }

  static bool isNotLocal(BuildContext context) {
    return !isLocal(context);
  }
}
