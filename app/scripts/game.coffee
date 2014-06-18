'use strict'

class Game

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

        $('#start-button').click @start

    resizeWindow: ->
        bodyHeight = $('body').height()
        headerHeight = $('.header').height() + 11
        footerHeight = $('.footer').height() + 11
        canvasHeight = bodyHeight - headerHeight - footerHeight - 40
        length = (Math.min $('body').width(), canvasHeight) - 20
        marginLeft = ($('.container').width() - length) / 2
        $('#darts-ui').width(length).height(length).css('margin-left', marginLeft)

    start: =>
        console.log 'Start'

window.Game = Game
