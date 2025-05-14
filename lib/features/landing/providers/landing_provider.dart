import 'package:codebase_assignment/core/network/api_client.dart';
import 'package:codebase_assignment/core/utils/helper.dart';
import 'package:codebase_assignment/features/landing/data/landing_repository.dart';
import 'package:codebase_assignment/features/landing/domain/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepoProvider = Provider<ILandingRepository>(
  (ref) => LandingRepository(ref.watch(dioProvider)),
);

final userPaginationNotifierProvider = StateNotifierProvider.autoDispose<
  PaginationNotifier,
  PaginationState<UserModel>
>((ref) => PaginationNotifier(ref.read(userRepoProvider)));

class PaginationNotifier extends StateNotifier<PaginationState<UserModel>> {
  final ILandingRepository repository;

  PaginationNotifier(this.repository) : super(PaginationState.initial());

  Future<void> fetchNextPage(int perPage) async {
    if (state.isLoading || !state.hasMoreData) return;

    try {
      state = state.copyWith(isLoading: true);

      // Fetch the next page of data
      final newItems = await repository.getUsers(perPage, state.currentPage);

      state = state.copyWith(
        data: List.from(state.data)..addAll(newItems),
        currentPage: state.currentPage + 1,
        isLoading: false,
        hasMoreData: newItems.isNotEmpty, // Only true if more data exist
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load users');
    }
  }

  void reset() {
    state = PaginationState.initial();
  }

  Future<void> loadFirstPage(String endpoint, int perPage, int areaId) async {
    state = PaginationState.initial(); // Reset state
    await fetchNextPage(perPage); // Load page 1
  }
}
