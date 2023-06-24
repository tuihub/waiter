part of 'yesod_add.dart';

class YesodAddFirstStage extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const YesodAddFirstStage({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodAddBloc, YesodAddState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: 600,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (newValue) {
                    context
                        .read<YesodAddBloc>()
                        .add(YesodUrlCheckEvent(url: newValue!));
                  },
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
                if (state is YesodUrlCheckLoading)
                  const CircularProgressIndicator(),
                if (state is YesodUrlCheckSuccess)
                  Ink(
                    height: 300,
                    width: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: kToolbarHeight,
                          child: Row(
                            children: [
                              Image.network(state.example.subscription.iconUrl),
                              Text(state.example.subscription.title),
                            ],
                          ),
                        ),
                        if (state.example.title != null)
                          Text(state.example.title!),
                        if (state.example.description != null)
                          Text(state.example.description!),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
