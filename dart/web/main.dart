import 'dart:html';

void main() {
  final e = querySelector('#output');

  /// `Setting a single CSS color`

  /// Test the expense of setting the style.color property of an element
  iterate("set CSS color - e..style.color – no change", (int i) {
    e..style.color = "red";
  });

  /// Test the expense of setting the color via style.cssText property
  /// while making sure that its a new value every time
  iterate("set CSS color - e..style.cssText – red/green", (int i) {
    e..style.cssText = i % 2 == 0 ? "color: red;" : "color: green;";
  });

  /// Test the expense of setting the style.color property
  /// while making sure that its a new value every time
  iterate("set CSS color - e..style.color – red/green", (int i) {
    e..style.color = i % 2 == 0 ? "red" : "green";
  });

  /// `Setting multiple CSS properties`

  /// Test the expense of setting the style.color property of an element
  iterate("set CSS properties - e..style.color – no change", (int i) {
    e
      ..style.color = "red"
      ..style.backgroundColor = "green"
      ..style.borderColor = "blue";
  });

  /// Test the expense of setting the style.color property of an element
  iterate("set CSS properties - e..style.cssText – no change", (int i) {
    e
      ..style.cssText = """
        color: red;
        background-color: green;
        border-color: blue;
      """;
  });

  /// `Setting text contents of an element`

  /// Test the expense of setting the text property of an element
  iterate("setText - no change", (int i) {
    e..text = "test";
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
