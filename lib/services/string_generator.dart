import 'dart:math';

String stringGenerator() {
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();

  return String.fromCharCodes(
    Iterable.generate(
      20,
      (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
    ),
  );
}
