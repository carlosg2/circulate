We work mainly on the client part of the API,<br>
but you still need a <b>rendez-vous</b> server if you<br>
want to use the API outside of a LAN, so here the info.<br>
<br>
<h2>Adobe</h2>

<ul><li><a href='http://labs.adobe.com/technologies/stratus/'>Adobe Labs</a> <b>Stratus</b> (not available anymore)<br>
<ul><li>also referred as <b>Adobe Stratus P2P rendezvous service</b>
</li><li>see <a href='http://gamingnotes.com/?p=1881'>Move from Stratus to Adobe Cirrus</a>
</li><li><a href='http://blogs.adobe.com/ktowes/2010/10/introducing-cirrus-the-new-codename-for-stratus.html'>Introducing “Cirrus” (the new codename for Stratus)</a>
</li></ul></li><li>Adobe Media Server 4 (only RTMFP v1, no groups)<br>
</li><li>Adobe Media Server 5 (only RTMFP v1, no groups)<br>
</li><li><a href='http://labs.adobe.com/technologies/cirrus/'>Adobe Labs</a> <b>Cirrus</b> (current)<br>
<ul><li>also referred as <b>Adobe Cirrus</b>
</li><li>also referred as <b>Cirrus 2</b>
</li><li><a href='http://www.adobe.com/cfusion/entitlement/index.cfm?e=cirrus'>Sign up for a Cirrus developer key</a></li></ul></li></ul>

As of today none of the commercial Adobe servers allow to use RTMFP groups<br>
which allow swarming and multicast.<br>
<br>
and somewhere in the FAQ<br>
<pre>
There is no commercial offering today with the new RTMFP Groups technology.<br>
</pre>


Cirrus 2 does allow that<br>
<pre>
Cirrus is a hosted peer introduction service that facilitates establishing communication<br>
between Flash Player clients or Adobe AIR endpoints using RTMFP. Flash Player endpoints<br>
must stay connected to the server during the entire time of communications.<br>
Unlike Flash Media Server, Cirrus does not stream video or support media relay,<br>
shared objects, or scripting. Cirrus is being made available as a beta service through<br>
Adobe Labs to allow our developer community to begin building applications using RTMFP.<br>
</pre>
but with few gotchas<br>
<ul><li>need a developer key<br>
</li><li>can not be used for commercial applications<br>
</li><li>is considered a free beta service<br>
</li><li>if somehow you plan/manage to connect 10.000 or so user you need<br>to communicate with Adobe via the <a href='http://forums.adobe.com/community/labs/cirrus'>Cirrus forum</a></li></ul>

for example (see <a href='http://forums.adobe.com/message/5014530#5014530'>Does Cirrus limit the number of connections ?</a>)<br>
answer:<br>
<pre>
Codename Cirrus currently has no limit to<br>
the number of connections per developer key.<br>
<br>
we ask that you let us know if you'll exceed 10,000 concurrent<br>
connections for purposes of resource & capacity planning.<br>
</pre>





<h2>Open Source</h2>

<ul><li><a href='https://github.com/OpenRTMFP/Cumulus'>Cumulus</a> (C++)<br>CumulusServer is a complete open source and cross-platform RTMFP server extensible by way of scripting.<br>main stable features are:<br>
<ul><li>P2P rendez-vous service<br>
</li><li>Live streaming<br>
</li><li>RPC, pull, push exchanges, indeed all AMF possible exchanges between client and server<br>
</li><li>Scripting engine to create your own application server or extends Cumulus features<br>
</li><li>Scalability and load-balancing solution<br>
</li></ul></li><li><a href='https://github.com/OpenRTMFP/ArcusNode'>ArcusNode</a> (node.js / JavaScript / C++)<br>A RTMFP Rendevouz Server For Peer Assisted Networking With Adobe Flash on NodeJS.<br>covers the following features already:<br>
<ul><li>P2P Rendezvouz service<br>
</li><li>NetGroups<br>
</li><li>Remote Methods / Commands<br>
</li><li>Authentication<br>
</li><li>Plugins<br>
</li></ul></li><li><a href='http://code.google.com/p/rtmplite/source/browse/trunk/rtmfp.py'>rtmfp.py</a> from <a href='http://code.google.com/p/rtmplite/'>RTMPlite</a> (Python)<br>Experimental rendezvous server for RTMFP in pure Python.</li></ul>

TODO<br>
<br>
<h2>Others</h2>

List of RTMP servers (from FlashRealtime - <a href='http://www.flashrealtime.com/list-of-available-rtmp-servers/'>List of available RTMP servers</a> )<br>
<br>
<h3>Adobe</h3>
<ul><li><a href='http://www.adobe.com/products/flashmediaserver/'>Flash Media Server</a>
</li><li><a href='http://www.adobe.com/products/livecycle/dataservices/'>LiveCycle DS</a></li></ul>

<h3>Non-Adobe</h3>
<ul><li>
</li><li><a href='http://osflash.org/red5'>Red5</a> (Java)<br>
</li><li><a href='http://www.wowzamedia.com/'>Wowza</a> (Java)<br>
</li><li><a href='http://www.themidnightcoders.com/products.html'>WebOrb</a> (.NET, Java)<br>
</li><li><a href='http://erlyvideo.org/'>ErlyVideo</a> (Erlang)<br>
</li><li><a href='http://code.google.com/p/rubyizumi/'>RubyIzumi</a> (Ruby)<br>
</li><li><a href='http://www.rtmpd.com/'>RTMPD</a> (C++)<br>
</li><li><a href='http://wiki.gnashdev.org/Cygnal'>Cygnal</a> (C++)<br>
</li><li><a href='http://rtmpy.org/wiki/RTMP'>RTMPy</a> (Python)<br>
</li><li><a href='http://code.google.com/p/rtmplite/'>RTMPlite</a> (Python)<br>
</li><li><a href='http://mammothserver.org/'>MammothServer (OpenFMS)</a> (C++)