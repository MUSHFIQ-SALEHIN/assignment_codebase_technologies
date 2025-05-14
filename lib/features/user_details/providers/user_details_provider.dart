import 'package:codebase_assignment/core/network/api_client.dart';
import 'package:codebase_assignment/features/user_details/data/user_details_repository.dart';
import 'package:codebase_assignment/features/user_details/domain/user_detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserDetailsRepository>((ref) {
  final dio = ref.watch(dioProvider); // You already have this
  return UserDetailsRepository(dio);
});

final userDetailProvider = FutureProvider.family<UserDetailModel?, String>((
  ref,
  loginName,
) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.getUserDetails(loginName);
});
