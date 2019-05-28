class StringUtils {

  static bool isEmpty(String content) {
    if (content == null) {
      return true;
    }
    if (content.length == 0) {
      return true;
    }
    return false;
  }

}
