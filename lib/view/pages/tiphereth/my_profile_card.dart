import 'package:flutter/material.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/tiphereth.pb.dart';
import 'package:waitress/common/api/api_mixins.dart';

class MyProfileCard extends StatefulWidget {
  const MyProfileCard({super.key});

  @override
  State<StatefulWidget> createState() => _MyProfileCardState();
}

class _MyProfileCardState extends State<MyProfileCard>
    with SingleRequestMixin<MyProfileCard, GetUserResponse> {
  @override
  void initState() {
    super.initState();
    loadMyProfile();
  }

  Widget _buildStatePage() {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (isSuccess) {
      return MyProfile(data: response.getData());
    }
    if (isError) {
      return Center(
        child: Text("加载失败: ${response.error}"),
      );
    }
    return const SizedBox();
  }

  void loadMyProfile() {
    doRequest(request: (client, option) {
      return client.getUser(
        GetUserRequest(),
        options: option,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: _buildStatePage(),
          ),
        ),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  const MyProfile({
    super.key,
    required this.data,
  });

  final GetUserResponse data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID: ${data.user.id.id.toHexString()}"),
          Text(data.user.username,
              style: const TextStyle(
                fontSize: 32,
              )),
          Text("${data.user.type} | ${data.user.status}")
        ],
      ),
    );
  }
}
