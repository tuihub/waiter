part of 'yesod_config_add.dart';

class YesodAddSecondStage extends StatefulWidget {
  const YesodAddSecondStage({super.key});

  @override
  YesodAddSecondStageState createState() => YesodAddSecondStageState();
}

class YesodAddSecondStageState extends State<YesodAddSecondStage> {
  final _formKey = GlobalKey<FormState>();

  late String rssUrl;
  late int refreshInterval;
  late bool enabled;
  late String name;

  int step = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodAddBloc, YesodAddState>(
      listener: (context, state) {
        if (state is YesodAddSecondState) {
          if (state.loadState == LoadState.success) {
            AppRoutes.yesodConfigAdd().pop(context);
          }
        }
      },
      builder: (context, state) {
        if (state is YesodAddSecondState) {
          return SizedBox(
            width: 600,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.rss_feed),
                      border: OutlineInputBorder(),
                      label: Text('订阅地址'),
                    ),
                    initialValue: state.url,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (newValue) {
                      context
                          .read<YesodAddBloc>()
                          .add(ChangeNameEvent(newValue));
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.text_fields),
                      border: OutlineInputBorder(),
                      label: Text('名称'),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入名称';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    onChanged: (newValue) {
                      context
                          .read<YesodAddBloc>()
                          .add(ChangeIntervalEvent(int.parse(newValue)));
                    },
                    initialValue: state.refreshInterval.toString(),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.timer),
                      border: OutlineInputBorder(),
                      labelText: '刷新间隔(分钟)',
                    ),
                    inputFormatters: [IntInputFormatter()],
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入刷新间隔';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    onChanged: (newValue) {
                      context
                          .read<YesodAddBloc>()
                          .add(ChangeCategoryEvent(newValue));
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.category),
                      border: OutlineInputBorder(),
                      labelText: '分组',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 8,
                  ),
                  SwitchFormField(
                    onSaved: (newValue) {
                      context
                          .read<YesodAddBloc>()
                          .add(ChangeEnabledEvent(newValue ?? false));
                    },
                    title: const Text('立即启用'),
                    initialValue: state.enabled,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: state.loadState == LoadState.failure ? 48 : 0,
                    child: state.loadState == LoadState.failure
                        ? Ink(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius:
                                  BorderRadius.circular(kToolbarHeight),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 24,
                                ),
                                Text(state.errorMessage),
                              ],
                            ),
                          )
                        : const SizedBox(),
                  ),
                  if (state.loadState == LoadState.loading)
                    const LinearProgressIndicator(),
                ],
              ),
            ),
          );
        }
        throw UnimplementedError();
      },
    );
  }
}
