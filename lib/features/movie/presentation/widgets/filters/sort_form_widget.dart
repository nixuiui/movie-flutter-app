import 'package:flutter/material.dart';
import 'package:movie_app/core/const/enum.dart';
import 'package:nixui/widgets/nixui.dart';

class SortForm extends StatelessWidget {
  
  const SortForm({
    super.key,
    this.onSelected,
  });

  final Function(SortOption)? onSelected;

  @override
  Widget build(BuildContext context) {

    final sortOptions = [
      SortOption.popular,
      SortOption.bestSelling,
      SortOption.bestScore,
      SortOption.latest,
    ];

    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        const NxText.headline6('Urutkan'),
        const SizedBox(height: 16,),
        ...sortOptions.map((e) => NxBox(
          onPressed: () => onSelected?.call(e),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: NxText(e.label),
        ))
      ],
    );
  }
}