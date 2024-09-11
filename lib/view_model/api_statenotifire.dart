import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/model.dart';

class UserViewModel extends StateNotifier<AsyncValue<List<User>>> {
  UserViewModel() : super(const AsyncLoading()) {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await Dio().get('https://api.github.com/users');
      final users = (response.data as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
      print(response);
      state = AsyncData(users);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
      print(e);
    }
  }
}
