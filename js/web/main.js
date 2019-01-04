main();

function main() {
  var e = document.querySelector("#output");

  /// `Setting a single CSS color`

  /// Test the expense of setting the style.color property of an element
  iterate("set CSS color - e..style.color – no change", i => {
    e.style.color = "red";
  });
}

/**
 *
 *
 *
 */

function iterate(title, f) {
  var iterations = 400000;

  const start = performance.now();

  // do an iteration
  for (var i = 0; i < iterations; i++) {
    f(i);
  }

  const finish = performance.now();

  var time = finish - start;

  console.log(`${title} completed in an average of ${time}ms`);
}
