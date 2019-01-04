main();

function main() {
  var e = document.querySelector("#output");

  /// Set CSS color
  iterate("set CSS color - e.style.color – red/green", i => {
    e.style.color = i % 2 == 0 ? "red" : "green";
  });

  /// Set text content
  iterate("setText - red/green", i => {
    e.textContent = i % 2 == 0 ? "red" : "green";
  });

  /// Create sibling children
  iterate("create children ", i => {
    const child = document.createElement("div");
    e.appendChild(child);
  });

  /// Delete children
  once("delete children", i => {
    while (e.firstChild) {
      e.firstChild.remove();
    }
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

  console.log(
    `[js] ${title} completed in an average of ${time.toPrecision(3)}ms`
  );
}

function once(title, f) {
  //
  const start = performance.now();

  f();

  const finish = performance.now();

  var time = finish - start;

  console.log(
    `[js] ${title} completed in an average of ${time.toPrecision(3)}ms`
  );
}
