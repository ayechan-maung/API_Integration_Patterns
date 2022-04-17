class Helper {
  static isNull(String? str) {
    if (str == null || str.toString() == "null") {
      return true;
    } else {
      return false;
    }
  }

  static var green = 0xFF00e676;
  static var yellow = 0xFFffea00;
  static var red = 0xFFff1744;
  double? percent;
  static colorIndicator(double percent) {
    if (percent >= 0.7) {
      return green;
    } else if (percent > 0.2) {
      return yellow;
    } else {
      return red;
    }
  }
}
