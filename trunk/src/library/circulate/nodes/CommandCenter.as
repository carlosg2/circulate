package library.circulate.nodes
{
    import flash.net.GroupSpecifier;
    import flash.net.NetGroupReceiveMode;
    
    import library.circulate.Network;
    import library.circulate.NetworkClient;
    import library.circulate.NetworkCommand;
    import library.circulate.NodeType;
    import library.circulate.commands.JoinNode;
    import library.circulate.commands.LeaveNode;
    
    public class CommandCenter extends BaseNode
    {
        
        public function CommandCenter( network:Network, name:String = "" )
        {
            var specifier:GroupSpecifier = Network.getDefaultGroupSpecifier( name, network.config.IPMulticastAddress );
                specifier.routingEnabled = true;
                specifier.postingEnabled = true;
            
            super( network, name, specifier );
            //super( network, name );
            _type = NodeType.command;
        }
        
        protected override function setReceiveMode():void
        {
            _group.receiveMode = NetGroupReceiveMode.NEAREST;
        }
        
        protected override function onNeighborConnectAction( peerID:String, address:String ):void
        {
            var now:Date = new Date();
            var timestamp:uint = now.valueOf();
            var client:NetworkClient = _network.client;
            var cmd:NetworkCommand = new JoinNode( client.username, client.peerID, timestamp );
            
            //sendToNearest( cmd, address );
            //sendToAllNeighbors( cmd );
            //sendToNeighbor( cmd, NetGroupSendMode.NEXT_INCREASING );
            
//            if( estimatedMemberCount <= FULLMESH )
//            {
//                sendToAllNeighbors( cmd );
//            }
//            else if( estimatedMemberCount > FULLMESH )
//            {
//                sendToNeighbor( cmd, NetGroupSendMode.NEXT_INCREASING );
//            }
            
            //sendToNeighbor( cmd, NetGroupSendMode.NEXT_INCREASING );
            
            
            //var groupAddress:String = _group.convertPeerIDToGroupAddress( peerID );
            //sendToNearest( cmd, groupAddress );
            
//            var newaddress:String = _group.convertPeerIDToGroupAddress( peerID );
//            sendToNearest( cmd, newaddress );
            
            //sendToNearest( cmd, address );
            //sendToNeighbor( cmd, NetGroupSendMode.NEXT_INCREASING );
            
            //sendToAllNeighbors( cmd );
            
            sendTo( peerID, cmd );
        }
        
        protected override function onNeighborDisconnectAction( peerID:String, address:String, username:String ):void
        {
            var now:Date = new Date();
            var timestamp:uint = now.valueOf();
            var cmd:NetworkCommand = new LeaveNode( username, peerID, timestamp );
            cmd.execute( _network, this );
        }
        
    }
}