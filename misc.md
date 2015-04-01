## found in cirrus FAQ ##

```
Developers will need to provide a mechanism for exchanging peer identities
between instances of application through their own intermediary
(e.g., using HTTP web services, XML sockets to a presence server, etc.).
```

even if RTMFP provide a lot of things, there is no mechanism to remember<br>
for ex a user name and associate it with a peerID, it would be nice to provide that.<br>
<br>
<h2>found in forums etc.</h2>

<pre><code>&gt; Cirrus will only bootstrap 16 groups per NetConnection.<br>
</code></pre>
so max 16 active groups per network ?<br>
<br>
<pre><code>&gt; Codename Cirrus currently has no limit to the number of connections per developer key.<br>
&gt; we ask that you let us know if you'll exceed 10,000 concurrent connections for purposes<br>
&gt; of resource &amp; capacity planning.<br>
</code></pre>
would be good to know what is the hardware/bandwidth spec of this server<br>
<br>
<pre><code>&gt; there should be an event eventually, after a 90-ish second timeout.<br>
&gt; if you enter a completely invalid peer ID (not composed entirely of hex digits,<br>
&gt; not an even number of digits), you'll get an error event almost immediately. <br>
&gt; if the peer ID isn't exactly 64 hex digits long, it won't work, because peer IDs<br>
&gt; are currently always 64 digits (256 bits) long.  however, it still tries,<br>
&gt; so you'll get the error event after the timeout.<br>
</code></pre>

<pre><code>&gt; sendToAllNeighbors can send any AMF serializable object, including ByteArray<br>
&gt; (or Object, with ByteArray properties, if you want). <br>
&gt; so can (NetGroup.) sendToNearest, sendToNeighbor, post, writeRequestedObject, and NetStream.send.<br>
&gt; you might need to set the NetConnection's defaultObjectEncoding to AMF3 (flash.net.ObjectEncoding.AMF3)<br>
&gt; to be able to use ByteArray (since that doesn't exist in AMF0).<br>
</code></pre>

<pre><code>&gt; object replication is designed and tuned for fully reliable and reasonably<br>
&gt; fair diffusion of large amounts of data.  it is not tuned for real-time distribution.<br>
&gt; the "recompute which neighbors have what data" timer fires every 10 seconds,<br>
&gt; which is what you're observing.<br>
&gt; the 10 second timer duration is compiled into RTMFP and can't be changed from ActionScript.<br>
&gt; if you require full reliability but you also want timely delivery,<br>
&gt; and only one peer is sending data, you could do a hybrid of P2P multicast<br>
&gt; (with NetStream.send()) and object replication. you could do a removeWantObjects()<br>
&gt; on receiving the data over multicast, and maybe delay doing an addHaveObjects()<br>
&gt; of the new sequence numbers for at least the multicast window duration + relay margin<br>
&gt; duration to try to avoid duplicating data on the network.<br>
</code></pre>

<pre><code>&gt; if you're using a NetGroup posting and/or multicast,<br>
&gt; you can set a password for using those functions.<br>
&gt; you then have two groupspecs:<br>
&gt; the groupspecWithAuthorizations, which you give to the "master peer"<br>
&gt; and which allows it to use those functions,<br>
&gt; and the groupspecWithoutAuthorizations,<br>
&gt; which you give to all non-master peers<br>
&gt; and which allows them to receive postings and/or multicasts<br>
&gt; but not send/publish.<br>
</code></pre>
allow to create chat room with an <b>op</b> who can kick/ban, create shared files protected by passwords etc.<br>
<br>
Now we need to be able to pass this password around in a secure way (encryption),<br>
see if we can reuse the nonce of a specific connection<br>
<br>
<br>
<pre><code>&gt; peer IDs are cryptographically pseudorandom and are evenly distributed<br>
&gt; between 0000000000000000000000000000000000000000000000000000000000000000<br>
&gt;      and ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff.<br>
</code></pre>

so this is the range of peerID<br>
<br>
<pre><code>&gt; the NetConnection.farID is the ID of the RTMFP server to which you're connected. <br>
&gt; the NetStream.farID of the subscribing/playing peer should match<br>
&gt; the NetConnection.nearID of the publishing peer.<br>
&gt; on the publishing end, the publishing NetStream has a property "peerStreams",<br>
&gt; which contains a separate NetStream for each connected subscribing peer.<br>
&gt; a member of that array will have a farID that matches the nearID of the subscribing peer.<br>
</code></pre>

so what happen when we connect serverless ? no farID for the netconnection ?<br>
<br>
and for netstream, if we keep a list of "known peerID", we should be able to know<br>
who is connected to which streams<br>
<br>
<pre><code>&gt; the maximum number of DIRECT_CONNECTIONS NetStreams in one NetConnection<br>
&gt; is controlled by NetConnection.maxPeerConnections.<br>
&gt; the default is 8, but you can change it to anything.<br>
</code></pre>

this can influence the way we build "supergroup",<br>
for ex: a "command center" type of group would need to not rely at all on DIRECT_CONNECTIONS NetStreams<br>
and that's easy to solve, just use the NetGroup to communicate "command"s and that way no peer limits;<br>
but in the case of "using one group to share one file", there it would have a huge influence<br>
if we use NetStream then maxPeerConnections would be the limit of people who can leech/seed this file.<br>
<br>
<br>
<pre><code>P2P permission dialog<br>
  - Groups can use upload bandwidth for other members’ traffic<br>
  - Must be accepted before groups will function<br>
</code></pre>

only happen with a SWF hosted with the Flash Player plugin (or from a standalone player)<br>
when in an AIR application, no permission dialog popup<br>
<br>
<br>
<h2>other</h2>

let's emit the theory that we could have server with unlimited possibility<br>
and could connect any amount of users with rendez-vous server<br>
<br>
how many Peer ID could be deal with ?<br>
<br>
so a peer ID is <a href='http://en.wikipedia.org/wiki/256-bit'>256 bit</a>, that means <code>2^256</code><br>
from wikipedia<br>
<br>
<pre>
Already 2^128 (128-bit) would greatly exceed the total data stored on Earth as of 2010,<br>
which has been estimated to be around 1.2 zettabytes (over 2^70 bytes)<br>
</pre>

We could also use the IP address as an example<br>
eg. <code>255.255.255.255</code> (which translate to 0xFFFFFFFF) in IPv4 is only <b>32 bits</b><br>
and can deal with all servers,clients,etc. internet connection as of 2012.<br>
<br>
<br>
<h2>performance</h2>

A bit stupid, but if you use network/node/client etc. using protected override or hook functions<br>
you can test only with 5/6 instances of the client locally.<br>
<br>
If you use Events to reroute/dispatch NetStatusEvent, then you can instantiate 20+ clients<br>
and everything react faster etc.<br>
<br>
<br>
<h2>visuals</h2>

Our main logic is to use a <b>CommandCenter</b> that connect all clients all the time<br>
and because each clients has a unique <b>Peer ID</b> even in different groups<br>
we can then map all those clients on a ring based on their unique Peer ID address.<br>
<br>
<br>
