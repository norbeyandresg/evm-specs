requires "edsl.k"
requires "../lemmas.k"

module VERIFICATION
  imports EDSL
  imports LEMMAS

  syntax Map ::= "powOfTwo" "(" Int ")"   [function]
  //----------------------------------------------------

  rule powOfTwo(N)
    => #asMapOpCodes( PUSH(1,1); PUSH(32, N)                  // y = 1, x = N
                    ; JUMPDEST                                // label:loop
                    ; DUP(1); ISZERO; PUSH(1,55); JUMPI       // if n == 0, jump to end
                    ; SWAP(1); PUSH(1,1); SWAP(1); SUB        // x = x - 1
                    ; SWAP(1); SWAP(5); DUP(1); ADD           // y = y + y
                    ; SWAP(1); SWAP(3); PUSH(1,35); JUMP      // jump to loop
                    ; JUMPDEST                                // label:end
                    ; .OpCodes
                    ) [macro]
endmodule
