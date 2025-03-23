part of 'tiphereth_bloc.dart';

@MappableClass(generateMethods: GenerateMethods.copy)
class TipherethState with TipherethStateMappable {
  late List<Account>? accounts;
  late List<PorterDigest>? porterGroups;
  late List<PorterContext>? porterContexts;
  late List<UserSession>? sessions;

  TipherethState({
    this.accounts,
    this.porterGroups,
    this.porterContexts,
    this.sessions,
  });

  TipherethState.clone(TipherethState other)
      : accounts = other.accounts,
        porterGroups = other.porterGroups,
        porterContexts = other.porterContexts,
        sessions = other.sessions;

  PorterDigest? getNotifyDestinationProvider(String id) {
    try {
      return porterGroups?.firstWhere((element) =>
          element.featureSummary.notifyDestinations.any((e) => e.id == id));
    } catch (e) {
      return null;
    }
  }

  List<PorterContext> getPorterContexts(String globalName, {String? region}) {
    try {
      return porterContexts?.where((element) {
            if (region != null) {
              return element.globalName == globalName &&
                  element.region == region;
            } else {
              return element.globalName == globalName;
            }
          }).toList() ??
          [];
    } catch (e) {
      return [];
    }
  }
}

class TipherethEventState extends TipherethState with EventStatusMixin {
  TipherethEventState.clone(super.state, this.statusCode, {this.msg})
      : super.clone();

  @override
  final EventStatus? statusCode;
  @override
  final String? msg;
}

class TipherethEditUserState extends TipherethEventState {
  TipherethEditUserState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethGetAccountsState extends TipherethEventState {
  TipherethGetAccountsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethLinkAccountState extends TipherethEventState {
  TipherethLinkAccountState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethUnLinkAccountState extends TipherethEventState {
  TipherethUnLinkAccountState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethAddPorterContextState extends TipherethEventState {
  TipherethAddPorterContextState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethEditPorterContextState extends TipherethEventState {
  TipherethEditPorterContextState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethLoadPorterContextsState extends TipherethEventState {
  TipherethLoadPorterContextsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethLoadSessionsState extends TipherethEventState {
  TipherethLoadSessionsState(super.state, super.statusCode, {super.msg})
      : super.clone();
}

class TipherethEditSessionState extends TipherethEventState {
  TipherethEditSessionState(super.state, super.statusCode, {super.msg})
      : super.clone();
}
