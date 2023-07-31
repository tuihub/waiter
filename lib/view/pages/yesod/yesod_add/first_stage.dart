part of 'yesod_add.dart';

class YesodAddFirstStage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  YesodAddFirstStage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<YesodAddBloc, YesodAddState>(
      listener: (context, state) {
        if (state is YesodAddValidate) {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        }
      },
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
                        .add(YesodUrlCheckEvent(url: newValue!.trim()));
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.rss_feed),
                    border: OutlineInputBorder(),
                    labelText: 'RSS订阅地址',
                  ),
                  initialValue: state.url,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入RSS订阅地址';
                    }
                    value = value.trim();
                    if (value.startsWith("http://") ||
                        value.startsWith("https://")) {
                      return null;
                    }
                    return "请输入正确的地址格式";
                  },
                ),
                if (state.loadState == LoadState.loading)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (state.loadState == LoadState.failure)
                  Expanded(
                    child: Center(
                      child: Text(state.errorMessage),
                    ),
                  ),
                if (state is YesodAddFirstState)
                  RssPreviewCard(
                    iconUrl: state.example.subscription.iconUrl,
                    name: state.example.subscription.title,
                    image: state.example.image,
                    description: state.example.description,
                    title: state.example.title!,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RssPreviewCard extends StatelessWidget {
  const RssPreviewCard({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.title,
    this.image,
    this.description,
  });

  final String iconUrl;
  final String name;
  final String? image;
  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 220,
      width: 600,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 32,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  iconUrl,
                  height: 16,
                  width: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 16,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Row(
              children: [
                if (image != null)
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                if (image != null)
                  const SizedBox(
                    width: 16,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (description != null) Text(description!),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
