import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie/presentation/widgets/filters/sort_form_widget.dart';
import 'package:movie_app/resources/widgets/bottom_sheet.dart';

class SortBottomSheet extends StatefulWidget {

  const SortBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<SortBottomSheet> createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UiBottomSheet(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SortForm(
          onSelected: (value) {
            Get.back(result: {'sort': value});
          },
        ),
      ),
    );
  }
}
