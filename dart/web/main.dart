import 'dart:html';

void main() {
  final e = querySelector('#output');

  /// Set CSS color
  iterate("red/green CSS color", (int i) {
    e..style.color = i % 2 == 0 ? "red" : "green";
  });

  /// Set text content
  iterate("red/green text content", (int i) {
    e..text = i % 2 == 0 ? "red" : "green";
  });

  /// Create sibling children
  iterate("create children", (int i) {
    final child = Element.div();
    e.children.add(child);
  });

  /// Delete children
  once("delete children", () {
    while (e.firstChild != null) {
      e.firstChild.remove();
    }
  });

  /// Query the dom
  iterate("query dom", (i) {
    querySelector("#output");
  });

  /// Query the dom, set text content
  iterate("query dom, set text content", (i) {
    var element = querySelector("#output");
    element.text = i.toString();
  });

  /// Create a nested tree
  once("create nested tree", () {
    var a = document.createElement("div");
    a.id = "target";

    var b = document.createElement("div");

    for (var i = 0; i < 500; i++) {
      b.children.add(a);
      b.id = i.toString();
      a = b;
      b = document.createElement("div");
    }

    e.children.add(a);
  });

  /// Nested tests

  {
    var element = querySelector("#target");

    /// Set color at leaf
    iterate("red/green color at leaf of tree", (i) {
      element.style.color = i % 2 == 0 ? "red" : "green";
    });

    /// Set text at leaf
    iterate("red/green text at leaf of tree", (i) {
      element.text = i % 2 == 0 ? "red" : "green";
    });
  }
}

///
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

  print("[dart] $title completed in ${time.toStringAsPrecision(3)}ms");
}

once(String title, Function() f) {
  final s = Stopwatch();
  s.start();

  f();

  s.stop();

  final time = (s.elapsedMicroseconds / 1000);

  print("[dart] $title completed in ${time.toStringAsPrecision(3)}ms");
}
