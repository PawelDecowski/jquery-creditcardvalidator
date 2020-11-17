# jQuery Credit Card Validator

jQuery Credit Card Validator detects and validates credit card numbers. It’ll tell you the detected credit card type and whether the number length and Luhn checksum are valid for the type of card.

## Installation

### NPM

```bash
npm i jquery-creditcardvalidator
```

### Download

Download the latest [jquery.creditCardValidator.js](https://raw.githubusercontent.com/PawelDecowski/jquery-creditcardvalidator/master/jquery.creditCardValidator.js).

The latest stable version is always in the [master branch](https://github.com/PawelDecowski/jquery-creditcardvalidator/tree/master). If you need previous versions, you’ll find them on the [releases page](https://github.com/PawelDecowski/jquery-creditcardvalidator/releases).

Do not use any branches other than [master](https://github.com/PawelDecowski/jquery-creditcardvalidator/tree/master). Branches starting with `release/` are development branches and they will most likely be broken.

## How to use

Run validation every time a field value changes:

```js
$('#cc_number').validateCreditCard(function(result) {
    if (result.valid) {
        $(this).addClass('cc-valid');
    } else {
        $(this).removeClass('cc-valid');
    }
});
```

Run validation once:

```js
const result = $('#cc_number').validateCreditCard();

if (result.valid) {
    $(this).addClass('cc-valid');
} else {
    $(this).removeClass('cc-valid');
}
```

## Documentation

For full documentation see the [jQuery Credit Card Validator website](http://jquerycreditcardvalidator.com/).