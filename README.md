# jQuery Credit Card Validator

jQuery Credit Card Validator detects and validates credit card numbers. It’ll tell you the detected credit card type and whether the number length and Luhn checksum are valid for the type of card.

## Download

The latest stable version is always in [master branch](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tree/master). If you need previous versions, you’ll find them on the [tags page](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tags).

**Do not use any branches other than [master](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tree/master). Branches like `release/1.0` are development branches and they will most likely be broken.**

## How to use

For instructions see the official [jQuery Credit Card Validator homepage](http://paweldecowski.github.com/jQuery-CreditCardValidator/).

## How to contribute

1. [Open a new issue](https://github.com/PawelDecowski/jQuery-CreditCardValidator/issues/new) (but make sure it’s not a duplicate). Let’s discuss it before you start writing code.
2. Grab the latest [stable](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tree/master) commit.
3. Create a topic branch according to this naming scheme:
   
   `type/description`

   Where `type` is one of:
   * `feature`
   * `bug`
   * `chore`

   And `description` is an all-lowercase, hyphen-separated description of what the branch is about.

   ### Examples:
   * `feature/visa-support`
   * `bug/broken-mastercard-detection`
   * `chore/refactor-validate-function`

   Be concise but descriptive.

4. Commit your changes to the topic branch.
5. Make a pull request.

## Releases

### Stable

Latest stable version can always be found in the [master branch](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tree/master).

You can find current and previous stable releases on the [tags page](https://github.com/PawelDecowski/jQuery-CreditCardValidator/tags).

### Development

There are no development releases. All features, bugs and chores are developed in their own branches of master, then are merged into a release branch (eg release/1.1), which is in turn tagged and merged into master. Then the cycle repeats.

## Version history

### 1.0

* Full test coverage.

  (I wish!)

* Binding is now optional:

  ```
  .validateCreditCard( [options] )
  ```

  Called on an input field validates the number and *returns* a `result` object.

* Ability to pass an array of accepted credit cards:

  ```
  $('#cc_number').validateCreditCard({ accept: ['visa', 'mastercard'] })
  ```

* MIT licence.

  It’s much clearer than any other licences. It means you can use jQuery CC Validator in any way you want as long as you include the copyright notice and licence text (found at the top of the source file).

### pre-1.0

jQuery Credit Card validator was released almost a year before turning 1.0. It had gone through a lot of changes but wasn’t versioned so everything pre-1.0 is to be treated as *alpha*.
