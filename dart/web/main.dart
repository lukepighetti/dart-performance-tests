import 'dart:html';

import 'iterate.dart';

void main() {
  final e = querySelector('#output');

  iterate("setColor", (int i) {
    e..style.color = "red";
  });

  iterate("setText", (int i) {
    e..text = i % 2 == 0 ? "red" : "green";
  });
}
