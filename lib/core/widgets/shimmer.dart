import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  final double height;
  final double? width;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  final Axis direction;
  final BorderRadius? borderRadius;

  const DefaultShimmer({
    super.key,
    this.height = 80,
    this.width,
    this.itemCount = 6,
    this.padding,
    this.direction = Axis.vertical,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(16),
      scrollDirection: direction,
      itemCount: itemCount,
      itemBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: height,
              width: width ?? double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius ?? BorderRadius.circular(10),
              ),
            ),
          ),
        );
      },
    );
  }
}
