import 'package:flutter/material.dart';

class UiBottomSheet extends StatelessWidget {

  final Widget? title;
  final Widget child;
  final Widget? bottom;
  final double? maxHeight;
  
  const UiBottomSheet({
    super.key,
    this.title,
    required this.child,
    this.bottom,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.75
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SirkaUiGrabbingIndicator(),
                    title ?? const SizedBox.shrink(),
                    Flexible(
                      child: child,
                    ),
                    bottom ?? const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SirkaUiGrabbingIndicator extends StatelessWidget {
  final Color color;
  final bool withIndicator;
  final bool withShadow;

  const SirkaUiGrabbingIndicator({
    Key? key,
    this.color = Colors.white,
    this.withIndicator = true,
    this.withShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: withShadow ? [const BoxShadow(
          blurRadius: 2,
          spreadRadius: 2,
          color: Colors.white,
          offset: Offset(0, 10),
        )] : [],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        color: color,
      ),
      child: withIndicator
          ? Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  color: Colors.grey[300],
                ),
                height: 5,
                width: 60,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}