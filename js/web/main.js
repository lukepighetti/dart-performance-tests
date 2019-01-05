main();

function main() {
  var e = document.querySelector("#output");

  /// Set CSS color
  iterate("red/green CSS color", i => {
    e.style.color = i % 2 == 0 ? "red" : "green";
  });

  /// Set text content
  iterate("red/green text content", i => {
    e.textContent = i % 2 == 0 ? "red" : "green";
  });

  /// Create sibling children
  iterate("create children ", i => {
    const child = document.createElement("div");
    e.appendChild(child);
  });

  /// Delete children
  once("delete children", () => {
    while (e.firstChild) {
      e.firstChild.remove();
    }
  });

  /// Query the dom
  iterate("query dom", i => {
    document.querySelector("#output");
  });

  /// Query the dom, set text content
  iterate("query dom, set text content", i => {
    var element = document.querySelector("#output");
    element.textContent = i.toString();
  });

  /// Create a nested tree
  once("create nested tree", i => {
    var a = document.createElement("div");
    a.id = "target";

    var b = document.createElement("div");

    for (var i = 0; i < 500; i++) {
      b.appendChild(a);
      b.id = i;
      a = b;
      b = document.createElement("div");
    }

    e.appendChild(a);
  });

  /// Nested tests

  {
    var element = document.querySelector("#target");

    /// Set color at leaf
    iterate("red/green color at leaf of tree", i => {
      element.style.color = i % 2 == 0 ? "red" : "green";
    });

    /// Set text at leaf
    iterate("red/green text at leaf of tree", i => {
      element.textContent = i % 2 == 0 ? "red" : "green";
    });
  }
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

  console.log(`[js] ${title} completed in ${time.toPrecision(3)}ms`);
}

function once(title, f) {
  //
  const start = performance.now();

  f();

  const finish = performance.now();

  var time = finish - start;

  console.log(`[js] ${title} completed in ${time.toPrecision(3)}ms`);
}
