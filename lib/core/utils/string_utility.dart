class StringUtility {
  static String? getUsernameFromInputString(String input) {
    List<String> captured = input.split(" ");
    List<String> names = [];
    for (var item in captured) {
      if (item.startsWith("@")) {
        names.add(item);
      }
    }
    if (names.isNotEmpty) {
      return names.first;
    } else {
      return null;
    }
  }
}
