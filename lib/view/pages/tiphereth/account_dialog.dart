part of 'tiphereth_nav.dart';

class UnLinkAccountDialog extends StatelessWidget {
  const UnLinkAccountDialog({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TipherethBloc, TipherethState>(
        listener: (context, state) {
      if (state is TipherethUnLinkAccountState && state.success) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return UniversalDialog(
        title: const Text('账户详情'),
        content: SizedBox(
          width: 600,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
                initialValue: account.platformAccountId,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '平台',
                ),
                initialValue: account.platform,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '用户名',
                ),
                initialValue: account.name,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onSaved: null,
                readOnly: true,
                decoration: const InputDecoration(
                  // icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  labelText: '上次更新时间',
                ),
                initialValue: DurationHelper.recentString(
                    account.latestUpdateTime.toDateTime()),
              ),
              const SizedBox(
                height: 16,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: state is TipherethUnLinkAccountState && state.failed
                    ? 48
                    : 0,
                child: state is TipherethUnLinkAccountState && state.failed
                    ? Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(kToolbarHeight),
                        ),
                        child: Center(
                          child: Text(
                            state.msg ?? '未知错误',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
        actions: [
          UniversalDialogAction(
            onPressed: () {
              context.read<TipherethBloc>().add(TipherethUnLinkAccountEvent(
                null,
                    account.platform,
                    account.platformAccountId,
                  ));
            },
            child: state is TipherethUnLinkAccountState && state.processing
                ? const CircularProgressIndicator()
                : const Text('解绑'),
          ),
          UniversalDialogAction(
            onPressed: () {
              Navigator.pop(context); //close Dialog
            },
            isPrimary: true,
            child: const Text('关闭'),
          )
        ],
      );
    });
  }
}
