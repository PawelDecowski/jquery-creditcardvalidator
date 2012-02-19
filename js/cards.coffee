$ = jQuery

$.fn.cards = (callback) ->
    is_visa = (number) ->
        number.match /^4/

    is_visa_electron = (number) ->
        number.match /^(4026|417500|4508|4844|491(3|7))/

    is_mastercard = (number) ->
        number.match /^5[1-5]/

    is_maestro = (number) ->
        number.match /^(5018|5020|5038|6304|6759|676[1-3])/

    is_discover = (number) ->
        number.match /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/

    check_card = (number) ->
        if is_visa_electron number
            callback 'visa-electron'
            return
        else if is_visa number
            callback 'visa' 
            return
        else if is_maestro number
            callback 'maestro'
            return
        else if is_discover number
            callback 'discover'
            return
        else if is_mastercard number
            callback 'mastercard'
            return

        callback ''
        
    this.bind('input', ->
        number = $(this).val().replace(/[ -]/, '')
        check_card(number)
    )

    number = $(this).val().replace(/[ -]/, '')
    check_card(number)
