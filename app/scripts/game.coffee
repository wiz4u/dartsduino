'use strict'

class Game

    State =
        NOT_STARTED: 0
        PLAYING: 1

    state: State.NOT_STARTED

    constructor: ->
        peer = new Peer 'server', {host: 'localhost', port: 9999}
        conn = peer.connect 'device'

        conn.on 'open', =>
            conn.send 'Conneced.'
        conn.on 'data', (id) =>
            console.log id

        @resizeWindow()
        $(window).resize =>
            @resizeWindow()

        dartsUi = new DartsUi $('#darts-ui')[0]
        dartsUi.setListener (score, ratio) ->
            console.log score + ', ' + ratio + ' = ' + score * ratio

        $('#select-button').click @start
        $('#cancel-button').click @cancel

    resizeWindow: ->
        bodyHeight = $('body').height()
        headerHeight = $('.header').height() + 11
        footerHeight = $('.footer').height() + 11
        canvasHeight = bodyHeight - headerHeight - footerHeight - 40
        length = (Math.min $('body').width(), canvasHeight) - 20
        marginLeft = ($('.container').width() - length) / 2
        $('#darts-ui').width(length).height(length).css('margin-left', marginLeft)

    start: =>
        # console.log 'Start'

        $('#myModal').modal('hide')
        @changeState State.PLAYING

    cancel: =>
        # console.log 'Cancel'

        @changeState State.NOT_STARTED

    changeState: (state) =>
        oldState = @state
        @state = state

        switch state
            when State.NOT_STARTED
                $('#start-button').show()
                $('#cancel-button').hide()

            when State.PLAYING
                $('#start-button').hide()
                $('#cancel-button').show()

window.Game = Game
