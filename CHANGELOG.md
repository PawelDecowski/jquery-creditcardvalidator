# Change log

## 1.0

* Unit tests — thanks to [James Allardice](https://github.com/jamesallardice)

* Binding is now optional — thanks to [Tanner M Young](https://github.com/tmyoung)

  ```
  .validateCreditCard( [options] )
  ```

  Called on an input field validates the number and *returns* a `result` object.

* Ability to pass an array of accepted credit cards — thanks to [gabrieljoelc](https://github.com/gabrieljoelc)

  ```
  $('#cc_number').validateCreditCard({ accept: ['visa', 'mastercard'] })
  ```

* Redesigned demo page — thanks to [Relish](http://relish.io)

* MIT licence.

  It’s much clearer than any other licences. It means you can use jQuery CC Validator in any way you want as long as you include the copyright notice and licence text (found at the top of the source file).

## pre-1.0

jQuery Credit Card validator was released more than two years before turning 1.0. It had gone through a lot of changes but wasn’t versioned so everything pre-1.0 is to be treated as *alpha*.