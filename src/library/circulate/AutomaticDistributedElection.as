package library.circulate
{

    public class AutomaticDistributedElection
    {
        public static function isInRingSpan( target:String, rangeFrom:String, rangeTo:String ):Boolean
        {
            target    = target.toLowerCase();
            rangeFrom = rangeFrom.toLowerCase();
            rangeTo   = rangeTo.toLowerCase();
            
            if( rangeTo < rangeFrom )
            {
            	return isInRingSpan( target, rangeFrom,             RingPosition.addressF )
            	    || isInRingSpan( target, RingPosition.address0, rangeTo );
            }
            
            return (target >= rangeFrom) && (target <= rangeTo);
        }
        
        /*
                           
                              0000
                               |
                         ******|******
                      *********************
                   ******             *******
                *******                 ********
               *****                      ********
              *****                           *****
              *****                           *****
             ******                           ****** 
              *****                           *****
              *****                           *****
               *****                       *******
                *******                 ********
                   /*****             *******\
           2/3 aaaa   *********************   5555 1/3
                         *************
                            *******
        */
        public static function triangulate( rangeFrom:String, rangeTo:String ):Boolean
        {
            return ( isInRingSpan( RingPosition.address0, rangeFrom, rangeTo)
				  || isInRingSpan( RingPosition.address5, rangeFrom, rangeTo)
				  || isInRingSpan( RingPosition.addressA, rangeFrom, rangeTo) );
        }
        
        public static function getRingSpanCorrectionAngle( address:String ):int
        {
            var hex:String = address.charAt( 0 );
            
            var cangle:int = 0;
            
            switch( hex )
            {
                case "0":
                cangle -= 8;
                break;
                
                case "1":
                cangle -= 7;
                break;
                
                case "2":
                cangle -= 6;
                break;
                
                case "3":
                cangle -= 5;
                break;
                
                case "4":
                cangle -= 4;
                break;
                
                case "5":
                cangle -= 3;
                break;
                
                case "6":
                cangle -= 2;
                break;
                
                case "7":
                cangle -= 1;
                break;
                
                case "8":
                cangle -= 1;
                break;
                
                case "9":
                cangle += 2;
                break;
                
                case "a":
                cangle += 3;
                break;
                
                case "b":
                cangle += 4;
                break;
                
                case "c":
                cangle += 5;
                break;
                
                case "d":
                cangle += 6;
                break;
                
                case "e":
                cangle += 7;
                break;
                
                case "f":
                cangle += 8;
                break;
            }
            
            return cangle;
        }
        
        public static function getRingSpan( address:String ):String
        {
            if( isInRingSpan( address, RingPosition.address0, RingPosition.address1 ) )
            {
                return RingSpan.span_0_1;
            }
            else if( isInRingSpan( address, RingPosition.address1, RingPosition.address2  ) )
            {
                return RingSpan.span_1_2;
            }
            else if( isInRingSpan( address, RingPosition.address2, RingPosition.address3  ) )
            {
                return RingSpan.span_2_3;
            }
            else if( isInRingSpan( address, RingPosition.address3, RingPosition.address4  ) )
            {
                return RingSpan.span_3_4;
            }
            else if( isInRingSpan( address, RingPosition.address4, RingPosition.address5  ) )
            {
                return RingSpan.span_4_5;
            }
            else if( isInRingSpan( address, RingPosition.address5, RingPosition.address6  ) )
            {
                return RingSpan.span_5_6;
            }
            else if( isInRingSpan( address, RingPosition.address6, RingPosition.address7  ) )
            {
                return RingSpan.span_6_7;
            }
            else if( isInRingSpan( address, RingPosition.address7, RingPosition.address8  ) )
            {
                return RingSpan.span_7_8;
            }
            else if( isInRingSpan( address, RingPosition.address8, RingPosition.address9  ) )
            {
                return RingSpan.span_8_9;
            }
            else if( isInRingSpan( address, RingPosition.address9, RingPosition.addressA  ) )
            {
                return RingSpan.span_9_A;
            }
            else if( isInRingSpan( address, RingPosition.addressA, RingPosition.addressB  ) )
            {
                return RingSpan.span_A_B;
            }
            else if( isInRingSpan( address, RingPosition.addressB, RingPosition.addressC  ) )
            {
                return RingSpan.span_B_C;
            }
            else if( isInRingSpan( address, RingPosition.addressC, RingPosition.addressD  ) )
            {
                return RingSpan.span_C_D;
            }
            else if( isInRingSpan( address, RingPosition.addressD, RingPosition.addressE  ) )
            {
                return RingSpan.span_D_E;
            }
            else if( isInRingSpan( address, RingPosition.addressE, RingPosition.addressF  ) )
            {
                return RingSpan.span_E_F;
            }

            return RingSpan.span_0_1;
        }
        
        public function AutomaticDistributedElection()
        {
        }
        
    }
}