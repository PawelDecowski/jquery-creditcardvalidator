$ = jQuery

$.fn.cards = (callback) ->
    card_types = [
        {
            name: 'visa-electron'
            pattern: /^(4026|417500|4508|4844|491(3|7))/
            valid_length: [ 16 ]
        }
        {
            name: 'visa'
            pattern: /^4/
            valid_length: [ 13, 16 ]
        }
        {
            name: 'mastercard'
            pattern: /^5[1-5]/
            valid_length: [ 16 ]
        }
        {
            name: 'maestro'
            pattern: /^(5018|5020|5038|6304|6759|676[1-3])/
            valid_length: [ 12..19 ]
        }
        {
            name: 'discover'
            pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/
            valid_length: [ 16 ]
        }
    ]

    get_card_type = (number) ->
        for card_type in card_types
            if number.match card_type.pattern
                return card_type

        null

    is_valid_luhn = (number) ->
        sum = 0

        for digit, n in number.split('').reverse().join('')
            digit = +digit # the + casts the string to int 
            if n % 2
                digit *= 2
                if digit < 10 then sum += digit else sum += digit - 9
            else
                sum += digit
        
        sum % 10 == 0

    is_valid_length = (number, card_type) ->
        number.length in card_type.valid_length
    
    validate_number = (number) ->
        card_type = get_card_type number
        luhn_valid = false
        length_valid = false

        if card_type?
            luhn_valid = is_valid_luhn number
            length_valid = is_valid_length number, card_type

        callback
            card_type: card_type
            luhn_valid: luhn_valid
            length_valid: length_valid

    validate = ->
        number = normalize $(this).val()
        validate_number number       

    normalize = (number) ->
        number.replace /[ -]/g, ''

    this.bind('input', ->
        $(this).unbind('keyup') # if input event is fired (so is supported) then unbind keyup
        validate.call this
    )

    # bind keyup in case input event isn't supported
    this.bind('keyup', ->
        validate.call this
    )

    # run validation on page load in case the card number is prefilled
    validate.call this

    this
