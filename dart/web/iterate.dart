iterate(String title, Function(int) f, [int count = 10]) {
  List<double> results = [];

  for (int i = 0; i < count; i++) {
    results.add(_oneTrial(f));
  }

  final average = results.reduce((acc, cur) => acc + cur) / count;

  print("$title completed in an average of ${average}ms");
}

_oneTrial(Function(int) f) {
  const iterations = 40000;

  final s = Stopwatch();

  s.start();

  for (int i = 0; i < iterations; i++) {
    f(i);
  }

  s.stop();

  return s.elapsedMicroseconds / 1000;
}
