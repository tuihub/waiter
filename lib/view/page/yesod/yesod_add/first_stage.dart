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
                  Expanded(
                      child: const Center(child: CircularProgressIndicator())),
                if (state is YesodUrlCheckSuccess)
                  SizedBox(
                    height: 16,
                  ),
                if (state is YesodUrlCheckSuccess)
                  Ink(
                    height: 320,
                    width: 600,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).cardColor,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                state.example.subscription.iconUrl,
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                height: 16,
                                child: Text(
                                  state.example.subscription.title,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              if (state.example.image != null)
                                Container(
                                  width: 160,
                                  height: 256,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(state.example.image!),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              if (state.example.image != null)
                                SizedBox(
                                  width: 16,
                                ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (state.example.title != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Text(
                                          state.example.title!,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    if (state.example.description != null)
                                      Text(state.example.description!),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ],
                          ),
                        )
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
