## Design Notes ##

our main package will use **library.circulate**

we plan to support only the Flash Player and AIR client<br>
(maybe a redtamarin command line client later)<br>
<br>
we want to be "cross-platform" in the sens that if it can work under Linux<br>
then we will make our best effort to keep it compatible for Linux runtimes<br>
(eg. AIR 2.6, projector with a standalone player 11.2, and Flash Player 11.6 for the browser)<br>
this could involve special "hooks" like conditional compilation etc.<br>
<br>
<br>
We are directly influenced by the design of the RTMFP API<br>
and should be aware of that at all time.<br>
<br>
It should be possible to have more than one Network running in parallel,<br>
but it is not high in the priorities of the API.<br>
<br>
It have to be possible to have numerous Nodes running in parallel.<br>
<br>
We need to define different types of Nodes for specialised uses:<br>
<ul><li>sending/receiving commands<br>
</li><li>sharing files<br>
</li><li>interactive (real-time, no latency) connections<br>
</li><li>broadcast (some latency) connections</li></ul>

We need to define different types of Commands,<br>
and define a default mechanism to transfer those commands<br>
and serialize/deserialize them.<br>
<br>
We want to minimize the use of the term "P2P" in favour of more generic terms;<br>
for ex: favour <code>LocalNetworkArea</code> over <code>P2PLocalNetwork</code>

<h3>General</h3>

A <b>NetworkSystem</b> connect/disconnect to a network.<br>
<br>
A <b>NetworkNode</b> allows to organise groups inside the network.<br>
<br>
A <b>NetworkClient</b> is the user attached to the group.<br>
<br>
A <b>NetworkSystem</b> contains at least one <b>NetworkNode</b> or more.<br>
<br>
A <b>NetworkNode</b> contains at least one <b>NetworkClient</b> or more.<br>
<br>
By default, the <b>NetworkSystem</b> and any <b>NetworkNode</b> always share one local client reference.<br>
<br>
<h3>Command Center</h3>

The <b>Command Center</b> is a special type of <b>NetworkNode</b>.<br>
<br>
As soon as a <b>NetworkSystem</b> creates a <b>NetConnection</b><br>
the system creates by default the <b>CommandCenter</b>.<br>
<br>
When a <b>NetworkSystem</b> disconnects we keep the <b>CommandCenter</b> reference in memory.<br>
<br>
A <b>NetworkClient</b> can not create or destroy the <b>CommandCenter</b>.<br>
<br>
The <b>CommandCenter</b> always use the same <b>NetGroup</b> name and <b>GroupSpecifier</b>.<br>
<br>
We wire all the <b>NetworkCommand</b> trough the <b>CommandCenter</b> (hence the name).<br>
<br>
Even if a <b>NetworkClient</b> is always connected to The <b>CommandCenter</b> it can still be invisible to other clients.<br>
<br>
Only an admin client can broadcast messages to every single connected <b>NetworkClient</b> (invisible or not)<br>
trough the <b>CommandCenter</b>, but it does not mean that an admin can see an invisible client.<br>
<br>
A <b>NetworkSystem</b> is meant to work with the same <b>CommandCenter</b>,<br>
you can not use more than one <b>CommandCenter</b><br>
but for your own need you can rename it to any name you want.<br>
<br>
By default we use this name "library.circulate.commandcenter".<br>
<br>
The <b>CommandCenter</b> is structured in such a way<br>
<ul><li>to work almost like a <b>ChatNode</b> but it is not a <b>ChatNode</b>
</li><li>to send commands as fast as possible<br>
</li><li>to scale up to 1000s of clients<br>
</li><li>to sync/announce/expire/update/etc. all connected clients<br>
</li><li>to sync/announce/expire/update/etc. all existing nodes<br>
</li><li>to serve list of known clients (not invisible client)<br>
</li><li>to serve list of known nodes (not invisible node)<br>
</li><li>to broadcast to all known clients (invisible included)<br>
</li><li>to broadcast to all known nodes (invisible included)<br>
</li><li>etc.</li></ul>

scenario:<br>
when 2 clients want to chat in a private node<br>
the command center allows to connect those 2 clients<br>
even if they are in different nodes and not connected to each other.<br>
In this case, the command center can do the invitation, introduction, sync, etc.<br>
<br>
<br>
we can visualise the command center on a ring<br>
<img src='http://circulate.googlecode.com/svn/gfx/commandcenter_visualisation_test.png' />


<h3>Sharing Files</h3>

<b>scenario:</b> simple file sharing using a Node per file<br>
<br>
using commands <b>AnnounceFile</b>/<b>RequestFile</b>
<ol><li>user A announce he got <code>file_123.mp4</code> (send trough command center)<br>
</li><li>this create a node OneFileNode with the name of the file<br>
</li><li>user A become a seeder on this node<br>
</li><li>user B request <code>file_123.mp4</code> (again trough command center)<br>
</li><li>user B become a leecher on this node</li></ol>

<b>pros:</b>
<ul><li>because the node share only one file<br>it simpler to have <code>chunk[0]</code> containing the metadata of the file<br>and split the file in chunks<br>
</li><li>the file does not necessary need to be loaded in memory<br>it could be pre-sliced on the hard drive<br>
<pre><code>          eg. files/<br>
                |_ file_123.mp4<br>
              shared/<br>
                |_ file_123.mp4/<br>
                       |_ 0<br>
                       |_ 1<br>
                       |_ 2<br>
                       |_ ...<br>
</code></pre>
</li><li>we can also have the option to contains the file data in memory<br>this depends on the memory of the client<br>eg. for desktop no problem to share few gigs<br>for mobile not an option</li></ul>

<b>cons:</b>
<ul><li>we need one node per file<br>going trough an adobe cirrus server<br>it could limit the max number of file shared<br>
</li><li>it share only one file<br>so we need a file manager on the side to manage list of files</li></ul>


<b>misc:</b><br>
on top of <b>AnnounceFile</b>/<b>RequestFile</b><br>
we could also use <b>HaveFile</b> and <b>FileList</b> commands<br>

<b>HaveFile</b> would be to announce a file we have on the hard drive<br>
but already shared in a node<br>
if someone request the file then we can then Announce the file<br>
and start to share it<br>

<b>FileList</b> would allow to share list of files we can share<br>
without creating any node in the first place<br>

the difference is<br>
<b>AnnounceFile</b> is for telling others we have a file ready to share<br>
eg. either pre-sliced on the HDD or loaded in memory<br>
in both case the node sharingthe file is already created<br>
and wait for others (user using RequestFile) to connect to the node<br>
while<br>
<b>HaveFile</b> is for telling others that we have the file available<br>
but it is not ready to share as the node to share the file is not created yet<br>
and by extension we didn't already pre-sliced or loaded the file in memory<br>

see it like that<br>
<br>
<b>HaveFile</b> and <b>FileList</b> are for transferring big number of files<br>
without overloading the memory or the hard drive<br>
it's for archive<br>
eg. I let you know that all this is available if you need it<br>

<b>AnnounceFile</b> and <b>RequestFile</b> are for transferring a pre-known number<br>
of files right away, eg. ready to connect and to share<br>
it's for real time update right now<br>
best example is for the updating the assets of an application<br>

example:<br>
multiplayer game with 50 different character animation<br>
by default you embed in the app only 1 generic character (eg. 50MB limit on mobile)<br>
if you're solo on the network you downloading the others 49 characters from a server<br>
when others join the network you cna share with them all or some of the already downloaded<br>
characters, on a local network it would speed up a LOT the download process<br>
in general it would put less load on your server or simply not use a server at all.<br>
<br>
<br>
<br>

<h2>Dependencies</h2>

<b>NetConnection</b>:<br>
creates a two-way connection between a client and a server.<br>
<br>
<b>NetGroup</b>:<br>
represents membership in an RTMFP group.<br>
<br>
<b>NetStream</b>:<br>
<blockquote>opens a one-way streaming channel over a NetConnection.</blockquote>

<b>GroupSpecifier</b>:<br>
<blockquote>is used to construct the opaque <code>groupspec</code> strings<br>
that can be passed to NetStream and NetGroup constructors</blockquote>


<br>
<br>

<h2>Vocabulary</h2>

<b>Network</b>:<br>
is responsible for creating, connecting and managing Nodes and Clients.<br>
Can be associated with only one NetConnection.<br>


<b>Node</b>:<br>
act as a super NetGroup (or a "super group")<br>
but contains different objects and references.<br>
The Node is responsible to make all those different<br>
objects work with each other: NetGroup, GroupSpecifier, Clients, etc.<br>
Can be associated with only one Network.<br>
Can be associated with only one NetGroup or one NetStream.<br>

<b>Client</b>:<br>
lets you handle each user, or client, connection to a RTMFP Network.<br>
The Network automatically creates a Client object when a user connects to it.<br>
<br>
<b>Peer ID</b>:<br>
Each Client has a peer ID, and the peer ID space is server-specific.<br>
The peer ID is the SHA256 of the client's Diffie-Hellman public key.<br>

<b>Command</b>:<br>
Network Commands are used as "control protocol" over the Network.<br>

<b>Packet</b>:<br>
A low-level message transfered over the network<br>
which allows to transport a Command in such a way<br>
it can be automatically serialized/deserialized ( using AMF and ByteArray).<br>
<br>
<b>Message</b>:<br>
ActionScript message serialized in AMF.<br>
The message can be one of the following types: an Object, an int, a Number, or a String.<br>
The message cannot be a MovieClip.<br>
<br>
<br>
<br>
<b>Ring</b>: (see <a href='http://en.wikipedia.org/wiki/Network_topology#Ring'>wikipedia</a>)<br>
<pre>
A network topology that is set up in a circular fashion in which data travels around the<br>
ring in one direction and each device on the right acts as a repeater to keep the signal<br>
strong as it travels. Each device incorporates a receiver for the incoming signal and a<br>
transmitter to send the data on to the next device in the ring. The network is dependent<br>
on the ability of the signal to travel around the ring. When a device sends data, it must<br>
travel through each device on the ring until it reaches its destination. Every node is a<br>
critical link.<br>
</pre>

<b>Node ring</b>:<br>
Visual representing the Node as a circle.<br>
<br>
<b>Ring Position</b>:<br>
In our case, the ring topology is applied to the Clients connected to a particular Node;<br>
so the ring position would be then the position of a client "address" on a circle representing the Node (the Node ring).<br>
<br>
<br>
<b>Command Center</b>:<br>
Special Node responsible for receiving and dispatching network commands.