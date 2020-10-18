##The interfaces for marking atomic sections

`ParallelContract` is a system smart contract, which extends the solidity to to include a set of the code-level interfaces for marking the atomic sections and the conflict rules between them.

The interface `begin_atomic()` and `end_atomic()` in ParallelContract are used to mark the start and end of atomic section in smart contract, respectively. 
The `registerConflictForSingleFunction()` and `registerConflictForMutipleFunctions()` provide interfaces to register the conflict rule in single function or multiple function.