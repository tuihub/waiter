// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'yesod_add_bloc.dart';

abstract class YesodAddState extends Equatable {
  final String url;
  final LoadState loadState;
  final String errorMessage;

  const YesodAddState(
      {this.url = '',
      this.loadState = LoadState.initial,
      this.errorMessage = ''});

  @override
  List<Object> get props => [url, loadState, errorMessage];

  YesodAddState copyWith({
    String? url,
    String? errorMessage,
    LoadState? loadState,
  });
}

class YesodAddInitial extends YesodAddState {
  const YesodAddInitial({
    String? url,
    String? errorMessage,
    super.loadState,
  }) : super(
          url: url ?? '',
          errorMessage: errorMessage ?? '',
        );

  @override
  YesodAddInitial copyWith({
    String? url,
    RssPostItem? example,
    String? errorMessage,
    LoadState? loadState,
  }) {
    return YesodAddInitial(
      url: url ?? this.url,
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
    );
  }
}

class YesodAddValidate extends YesodAddInitial {
  const YesodAddValidate({
    String? url,
    String? errorMessage,
    super.loadState,
  }) : super(
          url: url ?? '',
          errorMessage: errorMessage ?? '',
        );
}

class YesodAddFirstState extends YesodAddState {
  final RssPostItem example;

  const YesodAddFirstState({
    String? url,
    String? errorMessage,
    super.loadState,
    required this.example,
  }) : super(
          url: url ?? '',
          errorMessage: errorMessage ?? '',
        );

  @override
  List<Object> get props {
    return [
      url,
      example,
      errorMessage,
      loadState,
    ];
  }

  @override
  YesodAddFirstState copyWith({
    String? url,
    RssPostItem? example,
    String? errorMessage,
    LoadState? loadState,
  }) {
    return YesodAddFirstState(
      url: url ?? this.url,
      example: example ?? this.example,
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
    );
  }
}

class YesodAddSecondState extends YesodAddState {
  final String name;
  final String iconUrl;
  final int refreshInterval;
  final String category;
  final bool enabled;

  const YesodAddSecondState({
    String? url,
    String? errorMessage,
    super.loadState,
    required this.name,
    required this.iconUrl,
    required this.refreshInterval,
    required this.category,
    required this.enabled,
  }) : super(
          url: url ?? '',
          errorMessage: errorMessage ?? '',
        );

  @override
  List<Object> get props {
    return [
      url,
      name,
      iconUrl,
      refreshInterval,
      enabled,
      errorMessage,
      loadState,
    ];
  }

  @override
  YesodAddSecondState copyWith({
    String? url,
    String? name,
    String? iconUrl,
    int? refreshInterval,
    String? category,
    bool? enabled,
    String? errorMessage,
    LoadState? loadState,
  }) {
    return YesodAddSecondState(
      url: url ?? this.url,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      refreshInterval: refreshInterval ?? this.refreshInterval,
      category: category ?? this.category,
      enabled: enabled ?? this.enabled,
      errorMessage: errorMessage ?? this.errorMessage,
      loadState: loadState ?? this.loadState,
    );
  }
}
