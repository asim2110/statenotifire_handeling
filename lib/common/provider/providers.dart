import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/model.dart';
import '../../view_model/api_statenotifire.dart';

/////////////////////////////////////////////////////////////////////////??
final userViewProvider =
    StateNotifierProvider<UserViewModel, AsyncValue<List<User>>>((ref) {
  return UserViewModel();
});
