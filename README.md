# Dart Performance Tests

This repo tests the performance of Dart in the browser with vanilla JavaScript as a control.

## Purpose

**IS** to make it easy to test the speed of different DOM operations with Dart for the purpose of designing Dart web frameworks.

**IS NOT** to prove that one language is faster than another.

## Dart

```
pub get
pub global activate webdev
webdev serve --release
```

## JavaScript

```
npm install
npm run serve
```

### Results

We observed poor precision during these tests, many would vary ±10% across trials. The variation did not seem to reduce with more iterations. Chrome seemed to exhibit very fast results on first start, but not consistently enough to be deterministic.

These results are in no way conclusive.

| Test                     | js       | dart | %    | js       | dart | %     |
| ------------------------ | -------- | ---- | ---- | -------- | ---- | ----- |
| _browser ---->_          | _safari_ |      |      | _chrome_ |      |       |
| CSS color                | 114      | 138  | 21%  | 181      | 190  | 5.0%  |
| set text                 | 156      | 167  | 7.1% | 175      | 228  | 30%   |
| create children          | 189      | 432  | 229% | 279      | 494  | 77%   |
| delete children          | 56       | 220  | 393% | 155      | 258  | 66%   |
| query selector           | 64       | 104  | 62%  | 31       | 39   | 25%   |
| query + set text         | 260      | 318  | 22%  | 333      | 416  | 25%   |
| create nested elements   | 2.0      | 3.0  | 50%  | 3.0      | 3.90 | 30%   |
| set color at nested leaf | 106      | 161  | 52%  | 181      | 198  | 9.0%  |
| set text at nested leaf  | 94       | 160  | 70%  | 164      | 7630 | 4600% |

_Times are in milliseconds with 400,000k iterations_

### Contributing

All tests must be deterministic, novel, clean, documented, and written for both platforms. If there are standardized tests for browser performance please make a PR implementing them.
