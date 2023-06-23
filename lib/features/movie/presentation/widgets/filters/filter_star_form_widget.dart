import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nixui.dart';

class FilterStarForm extends StatelessWidget {
  const FilterStarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const NxText.headline6('Bintang Hotel'),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('1')
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('2')
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('3')
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('4')
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('5')
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16,),
            Expanded(
              child: NxBox(
                padding: const EdgeInsets.all(8),
                borderRadius: 50,
                borderColor: NxColor.border,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, size: 18),
                    NxText('Unrated')
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}