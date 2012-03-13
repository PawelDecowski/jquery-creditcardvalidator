$ ->
    $('.demo .numbers li').wrapInner('<a href="#"></a>').click( (e) ->
        e.preventDefault()
        $('#card_number').val($(@).text()).trigger('input')

    )

    $('.vertical.maestro').hide().css opacity: 0 ;
    $('#card_number').validateCreditCard (result) ->
        if not result.card_type?
            $('.cards li').removeClass 'off';
            $('#card_number').removeClass 'valid';
            $('.vertical.maestro').slideUp(duration: 200).animate(opacity: 0, { queue: false, duration: 200 });
            return

        $('.cards li').addClass 'off';
        $('.cards .' + result.card_type.name).removeClass 'off';

        if result.card_type.name == 'maestro'
            $('.vertical.maestro').slideDown(duration: 200).animate(opacity: 1, { queue: false });
        else   
            $('.vertical.maestro').slideUp(duration: 200).animate(opacity: 0, { queue: false, duration: 200 });

        if result.length_valid and result.luhn_valid
            $('#card_number').addClass 'valid';
        else
            $('#card_number').removeClass 'valid';