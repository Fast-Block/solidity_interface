pragma solidity ^0.4.25;

contract ParallelConfigPrecompiled
{
    function registerConflictForSingleFunctionInternal(address, string, uint256[], bytes32[]) public returns (int);
    function registerConflictForMutipleFunctionsInternal(address, string, uint256[], bytes32, string, uint256[], bytes32) public returns (int);
    function begin_atomic_internal(bytes32);
    function end_atomic_internal(bytes32);
        
}

contract ParallelContract
{
    ParallelConfigPrecompiled precompiledForHTM = ParallelConfigPrecompiled(0x1006);
    ParallelConfigPrecompiled precompiledForConflict = ParallelConfigPrecompiled(0x1007);

    function begin_atomic(bytes32 atomic_section_ID)
    {
        precompiledForHTM.begin_atomic_internal(atomic_section_ID);
    }

    function end_atomic(bytes32 atomic_section_ID)
    {
        precompiledForHTM.end_atomic_internal(atomic_section_ID);
    }
    
    function registerConflictForSingleFunction(string functionName, uint256[] conflictParam, bytes32[] conflictAtomicSectionID) public 
    {
        precompiledForConflict.registerConflictForSingleFunctionInternal(address(this), functionName, conflictParam, conflictAtomicSectionID);
    }

    function registerConflictForMutipleFunctions(string firstFunctionName, uint256[] firstConflictParam, bytes32 firstConflictAtomicSectionID, string secondFunctionName, uint256 secondConflictParam, bytes32 secondConflictAtomicSectionID) public 
    {
        precompiledForConflict.registerConflictForMutipleFunctionsInternal(address(this), firstFunctionName, firstConflictParam, firstConflictAtomicSectionID, secondFunctionName, secondConflictParam, secondConflictAtomicSectionID);
    }

    function registerConflictInfo() {}

}