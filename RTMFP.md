## Introduction ##

from [wikipedia](.md)
```
The *Secure Real-Time Media Flow Protocol* (RTMFP) is
a proprietary protocol suite developed by Adobe Systems
for encrypted, efficient multimedia delivery through both
client-server and peer-to-peer models over the Internet.
```

from [RTFMP FAQ](http://www.adobe.com/products/adobe-media-server-extended/rtmfp-faq.html)
```
The Real-Time Media Flow Protocol (RTMFP) is a communication protocol from Adobe
that enables direct end user to end user peering communication between multiple
instances of the Adobe® Flash® Player client and applications built using the Adobe AIR® framework
for the delivery of rich, live, real-time communication.
```

from [Flash Media Server 3.5 docs](http://help.adobe.com/en_US/flashmediaserver/devguide/WSa4cb07693d123884520b86f312a354ba36d-7fff.html)
```
RTMFP is built on User Datagram Protocol (UDP).
RTMP is built on Transmission Control Protocol (TCP).
UDP provides lower latency than TCP.
It also enables end-to-end peering—that is, direct data transmission between two clients.
```
```
Although RTMFP is often used for peer-assisted networking applications,
you can use RTMFP in unicast, broadcast, and multi-point publishing applications as well.
```

## Features ##
  * **NAT/firewall traversal**
  * **Congestion control and prioritization**
  * **Rapid connection restore:** Connections are reestablished quickly after brief outages, for example, when a wireless network connection experiences a dropout. After reconnection, the connection has full capabilities instantly.
  * **IP address mobility:** Active network sessions are maintained even if a client changes to a new IP address. For example, when a laptop on a wireless network is plugged into a wired connection, the connection will not be interrupted. This is a critical requirement for communication or live solutions.

## Security ##

from [Flash Media Server 3.5 docs](http://help.adobe.com/en_US/flashmediaserver/devguide/WSa4cb07693d123884520b86f312a354ba36d-7fff.html)
```
RTMFP network traffic is encrypted with a 128-bit cipher.
To play a stream over RTMFP, a client must know the name of the stream and know the peer ID of the publisher.
The peer ID is a 256-bit value associated with the publisher's identity.
The publisher must accept a peer request before a connection is made.
```



## History ##

TODO

**MFP**: Media Flow Protocol

## Ressources ##

**links:**
  * [RTMFP FAQ](http://www.adobe.com/products/adobe-media-server-extended/rtmfp-faq.html) (Adobe)
  * [Adobe's Secure Real-Time Media Flow Protocol (Internet-Draft) ](http://tools.ietf.org/html/draft-thornburgh-adobe-rtmfp) (Adobe, IETF)
  * video [P2P on the Flash Platform with RTMFP](http://tv.adobe.com/watch/max-2009-develop/p2p-on-the-flash-platform-with-rtmfp/) by Matthew Kaufman (Adobe MAX 2009)
  * video [Advanced P2P with RTMFP: Tips and Tricks](http://tv.adobe.com/watch/max-2011-develop/advanced-p2p-with-rtmfp-tips-and-tricks/) by Michael Thornburgh (Adobe MAX 2011)

**documents:**
  * (PDF) [P2P on the Flash Platform with RTMFP](http://circulate.googlecode.com/files/P2P%20on%20the%20Flash%20Platform%20with%20RTMFP.pdf) by Matthew Kaufman (Adobe MAX 2009)
  * (PDF) [Advanced P2P with RTMFP: Tips and Tricks](http://circulate.googlecode.com/files/Advanced%20P2P%20with%20RTMFP%20-%20Tips%20and%20Tricks.pdf) by Michael Thornburgh (Adobe MAX 2011)<br>(ZIP) <a href='http://circulate.googlecode.com/files/S4600_Thornburgh-AdvancedP2P_Assets.zip'>demo source code</a>
<ul><li>(PDF) <a href='http://circulate.googlecode.com/files/Go%20Multi-User%20With%20Peer-to-Peer%20in%20Flash%20Player.pdf'>Go Multi-User With Peer-to-Peer in Flash Player</a> by Tom Krcha (Adobe)<br>
</li><li>(PDF) <a href='http://circulate.googlecode.com/files/RTMFP%20Overview%20for%20IETF77%20TSV%20AREA.pdf'>RTMFP Overview for IETF77 TSV AREA</a> by Matthew Kaufman (Adobe)<br>
</li><li>(PDF) <a href='http://flashrealtime.com/download/P2P-Or-How-To-Kill-CDNs.pdf'>P2P or How to kill CDNs?</a> by Tom Krcha (Adobe)</li></ul>

<b>tutorials:</b>
<ul><li><a href='http://gamingnotes.com/?p=492'>Basics of P2P in Flash</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1526'>Multicast Explained in Flash 10.1 P2P</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1463'>Directed Routing Explained in Flash 10.1 P2P</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1434'>P2P GroupSpecifier Class Explained In Details Part 1</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1266'>Simple chat with P2P NetGroup in FP 10.1</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1854'>The most simple P2P Object Replication Example</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1727'>Video-on-Demand over P2P in Flash Player 10.1 with Object Replication</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1646'>File Sharing over P2P in Flash Player 10.1 with Object Replication</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1803'>Local Flash Peer-to-Peer Communication over LAN (without Cirrus/Stratus)</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=2032'>P2P Gaming Libs from my MAX 2010 session</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=2042'>MAX Racer Remote Device Controller in AIR for Android</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=2312'>Videotutorial: Controlling the desktop with your mobile device via P2P</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://gamingnotes.com/?p=1956'>Resolving "NetGroup.Connect.Rejected" or when your Flash P2P apps stop working</a> by Tom Krcha (Adobe)<br>
</li><li><a href='http://help.adobe.com/en_US/FlashMediaServer/4.0_Dev/WSa4cb07693d123884520b86f312a354ba36d-8000.html'>Building peer-assisted networking applications</a> Flash Media Server  4.0 Developer’s Guide (Adobe)