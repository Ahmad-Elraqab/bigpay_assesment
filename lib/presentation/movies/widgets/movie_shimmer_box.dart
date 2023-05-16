import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieShimmerBox extends StatelessWidget {
  const MovieShimmerBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 5,
              color: Colors.grey.shade200,
              spreadRadius: 2,
            ),
          ],
          color: Colors.white,
        ),
      ),
    );
  }
}
