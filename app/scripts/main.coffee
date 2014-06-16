peer = new Peer 'server', {host: 'localhost', port: 9999}
conn = peer.connect 'device'

conn.on 'open', =>
    conn.send 'Conneced.'

conn.on 'data', (id) =>
    console.log id

dartsUi = new DartsUi document.getElementById('darts-ui')
dartsUi.setListener (score, ratio) ->
    console.log score + ', ' + ratio + ' = ' + score * ratio
