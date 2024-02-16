import 'package:flutter/material.dart';
import 'package:task_cat/assets/colors/colors.dart';
import 'package:shimmer/shimmer.dart';


class WShimmer extends StatelessWidget {
  const WShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: white,
        border: Border(
          bottom: BorderSide(width: 1, color: grey),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                width: 180,
                height: 204,
                color: white,
              ),
            ),
          ),
          const Positioned(
            top: 212,
            left: 0,
            right: 0,
            child: Divider(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Shimmer.fromColors(
              baseColor: grey.withOpacity(0.5),
              highlightColor: grey.withOpacity(0.16),
              child: Container(
                height: 92,
                width: double.infinity,
                color: white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
