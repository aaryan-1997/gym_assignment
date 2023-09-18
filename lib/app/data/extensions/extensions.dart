extension StringExtension on String? {
  /// Returns true if given String is null or isEmpty
  bool get isNullOrEmpty =>
      this == null ||
      (this != null && this!.isEmpty) ||
      (this != null && this! == 'null');

  String validate({String value = ''}) {
    if (isNullOrEmpty) {
      return value;
    } else {
      return this!;
    }
  }
}
