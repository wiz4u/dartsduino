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

    resizeWindow: ->
        bodyHeight = $('body').height()
        headerHeight = $('.header').height() + 11
        footerHeight = $('.footer').height() + 11
        canvasHeight = bodyHeight - headerHeight - footerHeight
        length = (Math.min $('body').width(), canvasHeight) - 20
        $('#darts-ui').width(length).height(length)

window.Game = Game
