import 'package:codebase_assignment/core/utils/logger.dart';
import 'package:codebase_assignment/core/utils/sizes.dart';
import 'package:codebase_assignment/core/widgets/global_appbar.dart';
import 'package:codebase_assignment/core/widgets/shimmer.dart';
import 'package:codebase_assignment/features/landing/providers/landing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    // Trigger first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userPaginationNotifierProvider.notifier).fetchNextPage(10);
    });
  }

  void _onScroll() {
    AppLogger.i('scrolling...');

    final controller = _scrollController;
    if (!controller.hasClients) return;

    final maxScroll = controller.position.maxScrollExtent;
    final currentScroll = controller.position.pixels;

    AppLogger.i('Current: $currentScroll / Max: $maxScroll');

    if (currentScroll >= (maxScroll - 100)) {
      AppLogger.i('Near bottom, trying to load more...');
      final notifier = ref.read(userPaginationNotifierProvider.notifier);
      final state = ref.read(userPaginationNotifierProvider);
      if (!state.isLoading && state.hasMoreData) {
        notifier.fetchNextPage(10);
      } else {
        AppLogger.i('Empty');
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final paginationState = ref.watch(userPaginationNotifierProvider);
    return Scaffold(
      appBar: GlobalAppBar(title: "", cangoBack: false),
      body: Container(
        padding: AppSpacing.paddingL(context),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            /// Spacing
            SliverToBoxAdapter(child: AppSpacing.verticalSpaceS(context)),

            /// Loading State
            if (paginationState.data.isEmpty && paginationState.isLoading)
              SliverToBoxAdapter(child: DefaultShimmer())
            /// List of Items
            else if (paginationState.data.isNotEmpty)
              SliverList(
                delegate: SliverChildListDelegate(
                  paginationState.data.map((item) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item.avatarUrl ?? ""),),
                      title: Text(item.login ?? ""));
                  }).toList(),
                ),
              )
            /// No Data
            else
              const SliverToBoxAdapter(
                child: Center(child: Text("No data found")),
              ),
          ],
        ),
      ),
    );
  }
}
