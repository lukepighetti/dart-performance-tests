main();

function main() {
  var e = document.querySelector("#output");

  /// `Setting a single CSS color`

  /// Test the expense of setting the style.color property of an element
  iterate("set CSS color - e.style.color – red/green", i => {
    e.style.color = i % 2 == 0 ? "red" : "green";
  });

  /// Test the expense of setting the text property of an element
  /// while making sure that its a new value every time
  iterate("setText - red/green", i => {
    e.textContent = i % 2 == 0 ? "red" : "green";
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
