part of 'yesod_add.dart';

class YesodAddSecondStage extends StatefulWidget {
  const YesodAddSecondStage({Key? key}) : super(key: key);

  @override
  YesodAddSecondStageState createState() => YesodAddSecondStageState();
}

class YesodAddSecondStageState extends State<YesodAddSecondStage> {
  final _formKey = GlobalKey<FormState>();

  late String rssUrl;
  late int refreshInterval;
  late bool enabled;
  late String name;
  String? iconUrl;

  void submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<YesodAddBloc>().add(
            YesodFeedConfigEvent(
              name: name,
              iconUrl: iconUrl!,
              refreshInterval: refreshInterval,
              enabled: enabled,
            ),
          );
    }
  }

  void getLinkMeta() async {
    _formKey.currentState!.save();
    var url = Uri.parse(rssUrl);
    var response = await http.get(url);
    var data = RssFeed.parse(response.body);

    print(data.title); // Flutter - Beautiful native apps in record time

    print(data
        .description); // Flutter is Google's UI toolkit for crafting beautiful...

    var icon = await FaviconFinder.getBest(rssUrl);
    print(icon);

    setState(() {
      name = data.title!;
      iconUrl = icon!.url;
    });
  }

  int step = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 600,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (iconUrl != null) Image.network(iconUrl!),
                TextFormField(
                  onSaved: (newValue) => rssUrl = newValue!,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.rss_feed),
                    border: OutlineInputBorder(),
                    labelText: 'RSS订阅地址',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入RSS订阅地址';
                    }
                    if (value.startsWith("http://") ||
                        value.startsWith("https://")) {
                      return null;
                    }
                    return "请输入正确的地址格式";
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onSaved: (newValue) => name = newValue!,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.text_fields),
                    border: const OutlineInputBorder(),
                    labelText: '名称',
                    suffixIcon: IconButton(
                      onPressed: () {
                        getLinkMeta();
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                  ),
                  // The validator receives the text that the user has entered.
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
                  onSaved: (newValue) => refreshInterval = int.parse(newValue!),
                  initialValue: "60",
                  decoration: const InputDecoration(
                    icon: Icon(Icons.timer),
                    border: OutlineInputBorder(),
                    labelText: '刷新间隔(秒)',
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
                const Divider(
                  height: 8,
                ),
                SwitchFormField(
                  onSaved: (newValue) => enabled = newValue!,
                  title: const Text("立即启用"),
                  initialValue: true,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: state is YesodFeedConfigFail ? 48 : 0,
                  child: state is YesodFeedConfigFail
                      ? Ink(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius: BorderRadius.circular(kToolbarHeight),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 24,
                              ),
                              Text(state.message),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Future<CreateFeedConfigResponse> request(client, option) async {
    return await client.createFeedConfig(
      CreateFeedConfigRequest(
        config: FeedConfig(
          name: name,
          feedUrl: rssUrl,
          source: FeedConfigSource.FEED_CONFIG_SOURCE_COMMON,
          status: enabled
              ? FeedConfigStatus.FEED_CONFIG_STATUS_ACTIVE
              : FeedConfigStatus.FEED_CONFIG_STATUS_SUSPEND,
          pullInterval: $duration.Duration(
            seconds: $fixnum.Int64(refreshInterval),
          ),
        ),
      ),
      options: option,
    );
  }
}
