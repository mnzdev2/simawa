class AppThemes {
  static const int lightBlue = 0;
  static const int lightRed = 1;
  static const int darkBlue = 2;
  static const int darkRed = 3;

  static String toStr(int themeId) {
    switch (themeId) {
      case lightBlue:
        return 'Light Blue';
      case lightRed:
        return 'Light Red';
      case darkBlue:
        return 'Dark Blue';
      case darkRed:
        return 'Dark Red';
      default:
        return 'Unknown';
    }
  }
}
