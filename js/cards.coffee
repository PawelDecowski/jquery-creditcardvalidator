$ = jQuery

$.fn.cards = (callback) ->
    cards = [
        {
            name: 'visa-electron'
            pattern: /^(4026|417500|4508|4844|491(3|7))/
        }
        {
            name: 'visa'
            pattern: /^4/
        }
        {
            name: 'mastercard'
            pattern: /^5[1-5]/
        }
        {
            name: 'maestro'
            pattern: /^(5018|5020|5038|6304|6759|676[1-3])/
        }
        {
            name: 'discover'
            pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/
        }
    ]

    check_card = (number) ->
        for card in cards
            if number.match card.pattern
                return callback card.name

        callback ''

    validate_luhn = (number) ->
        check_digit = number[number.length - 1]

        sum = 0

        for digit, n in number.split('').reverse().slice(1).join('')
            n = parseInt n, 10
            digit = parseInt digit, 10
            if n % 2
                sum += digit
            else
                digit *= 2
                if digit < 10
                    sum += digit
                else
                    sum += parseInt(digit.toString()[0], 10) + parseInt(digit.toString()[1], 10)

    this.bind('input', ->
        number = $(this).val().replace /[ -]/, ''
        validate_luhn number
        check_card number
    )

    number = $(this).val().replace /[ -]/, ''
    check_card number

    this
