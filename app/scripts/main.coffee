peer = new Peer 'server', {host: 'localhost', port: 9999}
conn = peer.connect 'device'

conn.on 'open', =>
    conn.send 'Conneced.'

conn.on 'data', (id) =>
    console.log id
