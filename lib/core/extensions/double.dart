extension DoubleExtensions on double {
  String? maxComma(int number) {
    var str2comma = (this).toStringAsFixed(number);
    var regex = RegExp(r'([.]*0)(?!.*\d)');
    return double.parse(str2comma).toString().replaceAll(regex, '');
  }
}
