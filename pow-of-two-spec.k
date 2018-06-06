requires "pow-verification.k"

module POW-OF-TWO-SPEC
  imports ETHEREUM-SIMULATION
  imports VERIFICATION

  //powOfTwo
  rule <k> #execute ... </k>
       <mode> NORMAL </mode>
       <schedule> DEFAULT </schedule>
       <callStack> .List </callStack>
       <memoryUsed> 0 </memoryUsed>
       <localMem> .Map </localMem>
       <previousGas>  _ => _ </previousGas>
       <program> powOfTwo(N) </program>

       <pc>        0 => 56                           </pc>
       <wordStack> WS => 0 : 2 ^Int N : WS           </wordStack>
       <gas>       G  => _  </gas>

       requires N >=Int 0
       andBool  N <=Int 340282366920938463463374607431768211455
       andBool  #sizeWordStack(WS) <Int 1021

  rule <k> #execute ... </k>
       <mode> NORMAL </mode>
       <schedule> DEFAULT </schedule>
       <callStack> .List </callStack>
       <memoryUsed> 0 </memoryUsed>
       <localMem> .Map </localMem>
       <previousGas>  _ => _ </previousGas>
       <program> powOfTwo(N) </program>

       <pc>        35 => 56                           </pc>
       <gas>       G  => _   </gas>
       <wordStack> I : S         : WS
                => 0 : S +Int S  : WS                 </wordStack>

       requires I >=Int 0
       andBool  S >=Int 0
       andBool  S +Int S ==Int 2 ^Int I
       andBool  S +Int S <=Int pow256
       andBool  #sizeWordStack(WS) <Int 1021
endmodule
