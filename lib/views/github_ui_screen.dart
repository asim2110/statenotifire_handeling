import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/provider/providers.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Users'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 243, 69, 199),
        foregroundColor: Colors.white,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final userItem = ref.watch(userViewProvider);

          return RefreshIndicator(
            color: Colors.white,
            backgroundColor: Color.fromARGB(255, 243, 69, 199),
            onRefresh: () async {
              await ref.read(userViewProvider.notifier).fetchUsers();
            },
            child: userItem.when(
              data: (users) {
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Card(
                        color: Colors.white,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.avatarUrl),
                          ),
                          title: Text(
                            user.login,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            user.nodeId,
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 243, 69, 199),
                            radius: 10,
                            child: Text(
                              user.id.toString(),
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color.fromARGB(255, 243, 69, 199),
                color: Colors.black,
              )),
              error: (err, stack) => Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Something went wrong!',
                            style: TextStyle(fontSize: 16, color: Colors.red),
                          ),
                        ))),
              ),
            ),
          );
        },
      ),
    );
  }
}
