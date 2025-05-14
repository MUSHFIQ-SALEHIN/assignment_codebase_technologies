import 'package:codebase_assignment/core/navigation/app_navigator.dart';
import 'package:codebase_assignment/core/service/internet_service.dart';
import 'package:codebase_assignment/core/utils/loader.dart';
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
  late final InternetHandler _internetHandler;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _internetHandler = InternetHandler(context: context, ref: ref);
    // Trigger first load with 15 items
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(userPaginationNotifierProvider.notifier).fetchNextPage(15);
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
        // Load more with 10 items
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
    final searchQuery = ref.watch(searchQueryProvider);

    _internetHandler.init();

    // Filtered list based on search query
    final filteredData =
        paginationState.data.where((user) {
          final query = searchQuery.toLowerCase();
          final name = (user.login ?? '').toLowerCase();
          return name.contains(query);
        }).toList();

    return Scaffold(
      appBar: GlobalAppBar(title: "", cangoBack: false),
      body: RefreshIndicator(
        onRefresh: () {
          return ref
              .read(userPaginationNotifierProvider.notifier)
              .loadFirstPage(15);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: TextField(
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
                decoration: InputDecoration(
                  hintText: 'Search by name...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  /// Spacing
                  SliverToBoxAdapter(child: AppSpacing.verticalSpaceS(context)),
        
                  /// Shimmer while loading initial data
                  if (paginationState.isLoading && paginationState.data.isEmpty)
                    const SliverToBoxAdapter(child: DefaultShimmer()),
        
                  /// Filtered list
                  if (filteredData.isNotEmpty)
                    SliverList(
                      delegate: SliverChildListDelegate(
                        filteredData.map((item) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: AppSpacing.paddingVerticalS(context).bottom,
                            ),
                            child: Card(
                              elevation: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.userDetails,
                                    arguments: item.login,
                                  );
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    item.avatarUrl ?? "",
                                  ),
                                ),
                                title: Text(item.login ?? ""),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
        
                  /// No results found (after filtering)
                  if (!paginationState.isLoading && filteredData.isEmpty)
                    const SliverToBoxAdapter(
                      child: Center(child: Text("No users found")),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
