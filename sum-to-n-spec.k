requires "verification.k"

module SUM-TO-N-SPEC
  imports ETHEREUM-SIMULATION
  imports VERIFICATION

  //sumToN
  rule <k> #execute ... </k>
       <mode> NORMAL </mode>
       <schedule> DEFAULT </schedule>
       <callStack> .List </callStack>
       <memoryUsed> 0   </memoryUsed>
       <localMem> .Map </localMem>
       <previousGas> _ => _ </previousGas>
       <program> sumTo(N) </program>

       <pc>        0  => 53                                </pc>
       <wordStack> WS => 0 : N *Int (N +Int 1) /Int 2 : WS </wordStack>
       <gas>       G  => G -Int (52 *Int N +Int 27)        </gas>

  requires N >=Int 0
  andBool N <=Int 340282366920938463463374607431768211455
  andBool #sizeWordStack(WS) <Int 1021
  andBool G >=Int 52 *Int N +Int 27


  rule <k> #execute ... </k>
           <mode> NORMAL </mode>
           <schedule> DEFAULT </schedule>
           <callStack> .List </callStack>
           <memoryUsed> 0   </memoryUsed>
           <localMem> .Map </localMem>
           <previousGas> _ => _ </previousGas>
           <program> sumTo(N) </program>

           <pc> 35 => 53                         </pc>
     <gas> G => G -Int (52 *Int I +Int 21) </gas>

     <wordStack> I : S                               : WS
              => 0 : S +Int I *Int (I +Int 1) /Int 2 : WS </wordStack>

  requires I >=Int 0
   andBool S >=Int 0
   andBool S +Int I *Int (I +Int 1) /Int 2 <Int pow256
   andBool #sizeWordStack(WS) <Int 1021
   andBool G >=Int 52 *Int I +Int 21
endmodule
