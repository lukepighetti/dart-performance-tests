import 'dart:html';

void main() {
  final e = querySelector('#output');

  /// `Setting a single CSS color`

  /// Test the expense of setting the style.color property
  /// while making sure that its a new value every time
  iterate("set CSS color - e..style.color – red/green", (int i) {
    e..style.color = i % 2 == 0 ? "red" : "green";
  });

  /// Test the expense of setting the text property of an element
  /// while making sure that its a new value every time
  iterate("setText - red/green", (int i) {
    e..text = i % 2 == 0 ? "red" : "green";
  });
}

///
///
///
///

iterate(String title, Function(int) f) {
  const iterations = 400000;

  final s = Stopwatch();

  s.start();

  /// do an iteration
  for (int i = 0; i < iterations; i++) {
    f(i);
  }

  s.stop();

  final time = (s.elapsedMicroseconds / 1000);

  print("$title completed in ${time}ms");
}
