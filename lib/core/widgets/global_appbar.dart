import 'package:codebase_assignment/core/utils/sizes.dart';
import 'package:flutter/material.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool cangoBack;
  final Function? onBackPress;
  const GlobalAppBar({
    super.key,
    required this.title,
    required this.cangoBack,
    this.onBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.bodyM(context).copyWith(color: Colors.green),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading:
          cangoBack
              ? IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.green),
                onPressed:
                    () =>
                        onBackPress != null
                            ? onBackPress!()
                            : Navigator.pop(context),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
