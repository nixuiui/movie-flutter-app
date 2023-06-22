import 'package:flutter/material.dart';
import 'package:nixui/widgets/nx_loading_spinner.dart';

class UiImage extends StatelessWidget {
  const UiImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.radius = 8,
  });

  final String? url;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        color: Colors.grey[300],
        child: Image.network(
          width: width,
          height: height,
          url ?? '',
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: 120,
              height: 180,
              color: Colors.grey[300],
              child: const Center(
                child: NxLoadingSpinner()
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return SizedBox(
              width: width,
              height: height,
              child: const Icon(
                Icons.movie,
                color: Colors.black38,
                size: 32,
              ),
            );
          },
        ),
      ),
    );
  }
}