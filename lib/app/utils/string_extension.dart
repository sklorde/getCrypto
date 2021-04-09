extension StringExtension on String {
  toURL() {
    return this.toLowerCase().replaceAll(' ', '-');
  }
}
