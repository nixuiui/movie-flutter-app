import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nixui/widgets/nixui.dart';

import '../../core/services/dialog_service.dart';
import '../../core/services/toast_service.dart';

class DialogManager extends StatefulWidget {
  final Widget? child;
  const DialogManager({
    super.key,
    this.child
  });

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final _toastService = ToastService.to;
  final _dialogService = DialogService.to;

  late FToast fToast;
  GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    _initToast();
    _initDialog();
    super.initState();
  }

  _initDialog() {
    _dialogService.closeListener(() {
      Navigator.pop(context);
    });

    _dialogService.registerDialogListener((dialog) {
      FocusManager.instance.primaryFocus?.unfocus();
      switch (dialog?.dialogType) {
        
        case NxDialogType.information:
          Get.dialog(
            NxDialog.information(
              illustration: dialog?.illustration,
              title: dialog?.title ?? '',
              description: dialog?.description ?? '',
              textAlign: dialog?.textAlign,
              confirmLabel: dialog?.confirmLabel,
              confirmLabelColor: dialog?.confirmLabelColor,
              confirmButtonColor: dialog?.confirmButtonColor,
              onConfirmed: (val) {
                _dialogService.dialogComplete(
                  DialogResponse(confirmed: val)
                );
                Navigator.pop(context);
              },
            ),
            barrierDismissible: false,
          );
          break;

        case NxDialogType.confirmation:
          Get.dialog(
            NxDialog.confirmation(
              illustration: dialog?.illustration,
              title: dialog?.title ?? '',
              description: dialog?.description ?? '',
              textAlign: dialog?.textAlign,
              confirmLabel: dialog?.confirmLabel,
              confirmLabelColor: dialog?.confirmLabelColor,
              confirmButtonColor: dialog?.confirmButtonColor,
              cancelLabel: dialog?.cancelLabel,
              cancelLabelColor: dialog?.cancelLabelColor,
              cancelButtonColor: dialog?.cancelButtonColor,
              onConfirmed: (val) {
                _dialogService.dialogComplete(
                  DialogResponse(confirmed: val)
                );
                Navigator.pop(context);
              },
            ),
            barrierDismissible: false,
          );
          break;

        case NxDialogType.loader:
          Get.dialog(
            NxDialog.loader(
              illustration: dialog?.illustration,
              title: dialog?.title ?? '',
              description: dialog?.description ?? '',
              textAlign: dialog?.textAlign,
            ),
            barrierDismissible: false,
          );
          break;

        default:
      }
    });
  }

  _initToast() {
    fToast = FToast();
    _toastService.registerToastListener((toast) {
      _showToast(toast!);
    });
  }

  _showToast(ToastRequest toast) {
    late Widget toastWidget;
      switch (toast.toastType) {
        case ToastType.info:
          toastWidget = NxToast.info(
            message: toast.message
          );
          break;
        case ToastType.warning:
          toastWidget = NxToast.warning(
            message: toast.message
          );
          break;
        case ToastType.success:
          toastWidget = NxToast.success(
            message: toast.message
          );
          break;
        case ToastType.error:
          toastWidget = NxToast.error(
            message: toast.message
          );
          break;
        default:
      }
    fToast.init(globalKey.currentState!.context);
    fToast.showToast(
      child: toastWidget,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      key: globalKey,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: widget.child ?? const SizedBox.shrink()
      ),
    );
  }
}