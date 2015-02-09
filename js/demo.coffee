$ ->
    $('.demo .numbers li').wrapInner('<a href="#"></a>').click( (e) ->
        e.preventDefault()
        $('.demo .numbers').slideUp(100)
        $('#card_number').val($(@).text()).trigger('input')
    )

    $('body').click ->
        $('.demo .numbers').slideUp(100)

    $('.demo .numbers').click (e) ->
        e.stopPropagation()

    $('#sample-numbers-trigger').click (e) ->
        e.preventDefault()
        e.stopPropagation()
        $('.demo .numbers').slideDown(100)

    $('.demo .numbers').hide();
    $('.vertical.maestro').hide().css opacity: 0

    $('#card_number').validateCreditCard (result) ->
        $(this).removeClass()

        if not result.card_type?
            $('.vertical.maestro').slideUp(duration: 200).animate(opacity: 0, { queue: false, duration: 200 })
            return

        $(this).addClass(result.card_type.name)

        if result.card_type.name == 'maestro'
            $('.vertical.maestro').slideDown(duration: 200).animate(opacity: 1, { queue: false });
        else
            $('.vertical.maestro').slideUp(duration: 200).animate(opacity: 0, { queue: false, duration: 200 })

        if result.valid
            $(this).addClass 'valid';
        else
            $(this).removeClass 'valid';
    , { accept: ['visa', 'visa_electron', 'mastercard', 'maestro', 'discover'] }
