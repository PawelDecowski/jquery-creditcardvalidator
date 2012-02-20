(function() {
  var $;

  $ = jQuery;

  $.fn.cards = function(callback) {
    var cards, check_card, number, validate_luhn;
    cards = [
      {
        name: 'visa-electron',
        pattern: /^(4026|417500|4508|4844|491(3|7))/
      }, {
        name: 'visa',
        pattern: /^4/
      }, {
        name: 'mastercard',
        pattern: /^5[1-5]/
      }, {
        name: 'maestro',
        pattern: /^(5018|5020|5038|6304|6759|676[1-3])/
      }, {
        name: 'discover',
        pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/
      }
    ];
    check_card = function(number) {
      var card, _i, _len;
      for (_i = 0, _len = cards.length; _i < _len; _i++) {
        card = cards[_i];
        if (number.match(card.pattern)) return callback(card.name);
      }
      return callback('');
    };
    validate_luhn = function(number) {
      var check_digit, digit, n, sum, _len, _ref, _results;
      check_digit = number[number.length - 1];
      sum = 0;
      _ref = number.split('').reverse().slice(1).join('');
      _results = [];
      for (n = 0, _len = _ref.length; n < _len; n++) {
        digit = _ref[n];
        n = parseInt(n, 10);
        digit = parseInt(digit, 10);
        if (n % 2) {
          _results.push(sum += digit);
        } else {
          digit *= 2;
          if (digit < 10) {
            _results.push(sum += digit);
          } else {
            _results.push(sum += parseInt(digit.toString()[0], 10) + parseInt(digit.toString()[1], 10));
          }
        }
      }
      return _results;
    };
    this.bind('input', function() {
      var number;
      number = $(this).val().replace(/[ -]/, '');
      validate_luhn(number);
      return check_card(number);
    });
    number = $(this).val().replace(/[ -]/, '');
    check_card(number);
    return this;
  };

}).call(this);
