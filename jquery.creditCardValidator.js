(function() {
  var $,
    __indexOf = Array.prototype.indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  $ = jQuery;

  $.fn.cards = function(callback) {
    var card_types, get_card_type, is_valid_length, is_valid_luhn, number, validate;
    card_types = [
      {
        name: 'visa-electron',
        pattern: /^(4026|417500|4508|4844|491(3|7))/,
        valid_length: [16]
      }, {
        name: 'visa',
        pattern: /^4/,
        valid_length: [13, 16]
      }, {
        name: 'mastercard',
        pattern: /^5[1-5]/,
        valid_length: [16]
      }, {
        name: 'maestro',
        pattern: /^(5018|5020|5038|6304|6759|676[1-3])/,
        valid_length: [12, 13, 14, 15, 16, 17, 18, 19]
      }, {
        name: 'discover',
        pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/,
        valid_length: [16]
      }
    ];
    get_card_type = function(number) {
      var card_type, _i, _len;
      for (_i = 0, _len = card_types.length; _i < _len; _i++) {
        card_type = card_types[_i];
        if (number.match(card_type.pattern)) return card_type;
      }
      return null;
    };
    is_valid_luhn = function(number) {
      var digit, n, sum, _len, _ref;
      sum = 0;
      _ref = number.split('').reverse().join('');
      for (n = 0, _len = _ref.length; n < _len; n++) {
        digit = _ref[n];
        digit = +digit;
        if (n % 2) {
          digit *= 2;
          if (digit < 10) {
            sum += digit;
          } else {
            sum += digit - 9;
          }
        } else {
          sum += digit;
        }
      }
      return sum % 10 === 0;
    };
    is_valid_length = function(number, card_type) {
      var _ref;
      return _ref = number.length, __indexOf.call(card_type.valid_length, _ref) >= 0;
    };
    validate = function(number) {
      var card_type, length, luhn;
      card_type = get_card_type(number);
      if (card_type != null) {
        luhn = is_valid_luhn(number);
        length = is_valid_length(number, card_type);
      }
      return callback({
        card_type: card_type,
        luhn: luhn,
        length: length
      });
    };
    this.bind('input', function() {
      var number;
      number = $(this).val().replace(/[ -]/, '');
      return validate(number);
    });
    number = $(this).val().replace(/[ -]/, '');
    validate(number);
    return this;
  };

}).call(this);
