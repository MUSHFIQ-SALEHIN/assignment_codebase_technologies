import 'package:codebase_assignment/core/utils/sizes.dart';
import 'package:codebase_assignment/core/widgets/global_appbar.dart';
import 'package:codebase_assignment/features/user_details/providers/user_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {
  final String loginName;
  const UserDetailsScreen({super.key, required this.loginName});

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(userDetailProvider(widget.loginName));

    return Scaffold(
      appBar: GlobalAppBar(title: widget.loginName, cangoBack: true),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (user) {
          if (user != null) {
            return SingleChildScrollView(
              padding: AppSpacing.paddingL(context),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        user.avatarUrl != null
                            ? NetworkImage(user.avatarUrl!)
                            : null,
                    child:
                        user.avatarUrl == null
                            ? const Icon(Icons.person, size: 60)
                            : null,
                  ),
                  AppSpacing.verticalSpaceXL(context),
                  Text(
                    user.name ?? "",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  AppSpacing.verticalSpaceXL(context),
                  Row(
                    children: [
                      const Icon(Icons.email),
                      const SizedBox(width: 8),
                      Expanded(child: Text(user.email ?? "")),
                    ],
                  ),
                   AppSpacing.verticalSpaceM(context),
                  Row(
                    children: [
                      const Icon(Icons.location_city),
                      const SizedBox(width: 8),
                      Expanded(child: Text(user.location ?? "")),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('User not found'));
          }
        },
      ),
    );
  }
}
