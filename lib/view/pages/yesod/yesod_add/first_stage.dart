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
                    labelText: '订阅地址',
                  ),
                  initialValue: state.url,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入订阅地址';
                    }
                    value = value.trim();
                    if (value.startsWith('http://') ||
                        value.startsWith('https://')) {
                      return null;
                    }
                    return '请输入正确的地址格式';
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
                if (state is YesodAddFirstState && state.example != null)
                  YesodPreviewCard(
                    iconUrl: state.example!.subscription.iconUrl,
                    name: state.example!.subscription.title,
                    images: [state.example!.image!],
                    description: state.example!.description,
                    title: state.example!.title ?? '',
                    callback: () {},
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
