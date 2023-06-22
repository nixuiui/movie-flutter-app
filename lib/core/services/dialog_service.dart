import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nixui/themes/theme.dart';
import 'package:nixui/widgets/nx_dialog.dart';

class DialogRequest {
  final NxDialogType? dialogType;
  final String? title;
  final String? description;
  final Widget? illustration;
  final String? confirmLabel;
  final Color? confirmLabelColor;
  final Color? confirmButtonColor;
  final String? cancelLabel;
  final Color? cancelLabelColor;
  final Color? cancelButtonColor;
  final TextAlign? textAlign;
  final MainAxisAlignment? actionsAlignment;
  final ActionsDirection? actionsDirection;
  final bool? dismissable;

  DialogRequest({
    this.dialogType = NxDialogType.information,
    this.title,
    this.description,
    this.confirmLabel,
    this.confirmLabelColor,
    this.confirmButtonColor,
    this.cancelLabel,
    this.cancelLabelColor,
    this.cancelButtonColor,
    this.illustration,
    this.textAlign,
    this.actionsAlignment,
    this.actionsDirection,
    this.dismissable,
  });
}

class DialogResponse {
  final bool confirmed;
  final dynamic responseData;

  DialogResponse({
    this.confirmed = false,
    this.responseData,
  });
}

class DialogService {
  static DialogService get to => Get.find();

  Function(DialogRequest?)? _showDialogListener;
  Function()? _closeDialogListener;
  Completer<DialogResponse>? _dialogCompleter;

  void registerDialogListener(Function(DialogRequest?) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  void closeListener(Function() closeDialogListener) {
    _closeDialogListener = closeDialogListener;
  }

  void dismiss() {
    _dialogCompleter!.isCompleted;
  }
  
  Future<DialogResponse> showDialog({
    Widget? illustration,
    String? title,
    String? description,
    String? buttonLabel,
    TextAlign? textAlign,
    Color? buttonLabelColor,
    Color? buttonColor,
  }) {
    return _show(DialogRequest(
      dialogType: NxDialogType.information,
      illustration: illustration,
      title: title,
      description: description,
      textAlign: textAlign,
      confirmLabel: buttonLabel,
      confirmLabelColor: buttonLabelColor,
      confirmButtonColor: buttonColor,
    ));
  }

  Future<DialogResponse> showDialogSuccess({
    Widget? illustration,
    String? title,
    String? description,
    TextAlign? textAlign,
    String? buttonLabel,
  }) {
    
    illustration ??= Icon(
      Icons.check_circle,
      color: NxColor.success,
      size: 80,
    );

    return _show(DialogRequest(
      dialogType: NxDialogType.information,
      illustration: illustration,
      title: title,
      description: description,
      textAlign: textAlign,
      confirmLabel: buttonLabel,
      confirmButtonColor: NxColor.success,
    ));
  }

  Future<DialogResponse> showDialogError({
    Widget? illustration,
    String? title,
    String? description,
    TextAlign? textAlign,
    String? buttonLabel,
  }) {
    
    illustration ??= Icon(
      Icons.cancel_rounded,
      color: NxColor.error,
      size: 80,
    );

    return _show(DialogRequest(
      dialogType: NxDialogType.information,
      illustration: illustration,
      title: title,
      description: description,
      textAlign: textAlign,
      confirmLabel: buttonLabel,
      confirmLabelColor: Colors.white,
      confirmButtonColor: NxColor.error,
    ));
  }

  Future<DialogResponse> showDialogConfirmation({
    Widget? illustration,
    String? title,
    String? description,
    TextAlign? textAlign,
    String? confirmLabel,
    String? cancelLabel,
    ActionsDirection? actionsDirection,
  }) {
    return _show(DialogRequest(
      dialogType: NxDialogType.confirmation,
      illustration: illustration,
      title: title,
      description: description,
      textAlign: textAlign,
      confirmLabel: confirmLabel ?? 'Ya',
      confirmButtonColor: NxColor.primary,
      cancelLabel: cancelLabel ?? 'Tidak',
      cancelButtonColor: NxColor.secondary,
      actionsDirection: actionsDirection,
    ));
  }

  Future<DialogResponse> showDialogLoader({
    Widget? illustration,
    String? title,
    String? description,
    TextAlign? textAlign,
  }) {
    return _show(DialogRequest(
      dialogType: NxDialogType.loader,
      illustration: illustration,
      title: title,
      description: description,
      textAlign: textAlign,
    ));
  }

  Future<DialogResponse> _show(DialogRequest dialogRequest) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener?.call(dialogRequest);
    return _dialogCompleter!.future;
  }

  void closeDialog() {
    _closeDialogListener?.call();
  }

  void dialogComplete(DialogResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }
  
}

final dialog = DialogService.to;