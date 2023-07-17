String concatenateStrings(String str1, String str2) {
  List<String> characters = [];

  for (int i = 0; i < str1.length; i++) {
    characters.add(str1[i]);
  }

  for (int i = 0; i < str2.length; i++) {
    characters.add(str2[i]);
  }

  return characters.join('');
}

void main() {
  String string1 = "Hello";
  String string2 = "World!";

  String result = concatenateStrings(string1, string2);

  print("Concatenated String: $result");
}
