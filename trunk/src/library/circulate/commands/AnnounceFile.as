package library.circulate.commands
{
    import library.circulate.NetworkCommand;
    import library.circulate.NetworkNode;
    import library.circulate.NetworkSystem;
    
    /* note:
       tell other you havestarted sharing a file
    */
    public class AnnounceFile implements NetworkCommand
    {
        public function AnnounceFile()
        {
        }
        
        public function get name():String
        {
            return null;
        }
        
        public function get destination():String
        {
            return null;
        }
        
        public function set destination(value:String):void
        {
        }
        
        public function get isRouted():Boolean
        {
            return false;
        }
        
        public function execute(network:NetworkSystem, node:NetworkNode):void
        {
        }
    }
}