import 'package:get/get.dart';

enum ToastType { 
  error, 
  success,
  info,
  warning,
}

class ToastRequest {
  final ToastType? toastType;
  final String? message;

  ToastRequest({
    this.toastType = ToastType.info,
    this.message,
  });
}

class ToastService {

  static ToastService get to => Get.find();

  Function(ToastRequest?)? _showToastListener;

  void registerToastListener(Function(ToastRequest?) showToastListener) {
    _showToastListener = showToastListener;
  }

  void showToastInfo(String? message) {
    _show(ToastRequest(
      toastType: ToastType.info,
      message: message,
    ));
  }

  void showToastWarning(String? message) {
    _show(ToastRequest(
      toastType: ToastType.warning,
      message: message,
    ));
  }

  void showToastError(String? message) {
    _show(ToastRequest(
      toastType: ToastType.error,
      message: message,
    ));
  }

  void showToastSuccess(String? message) {
    _show(ToastRequest(
      toastType: ToastType.success,
      message: message,
    ));
  }

  void _show(ToastRequest request) {
    _showToastListener?.call(request);
  }
  
}

final toast = ToastService.to;