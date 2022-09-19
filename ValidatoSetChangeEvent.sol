pragma solidity ^0.8.12;

contract StakingContractEvent {

    struct Validator {
        address ecdsaAddress;
        bytes blsPublicKey;
    }

    Validator validator1;
    Validator validator2;
    Validator validator3;
    Validator validator4;

    Validator[] internal newValidators;


    event ValidatorSetChange(
        uint256 indexed index,
        Validator[] validators,
        int8 indexed changeType
    );

    event shouldntTrackerResponse();

    function getValidatorSet(int8 _id) public payable {    
      validator1 = Validator(0x060fbA22C208E6392934563ABE631b4A47cF3688, "0x6162636400000000000000000000000000000000000000000000000000000000");
      validator2 = Validator(0x2102B7e5c28553716558a4aDE5180fDDe76C646A, "0x6162636400000000000000000000000000000000000000000000000000000000");
      validator3 = Validator(0xC316F5deF6abb2BBFB6C5c412FD04de5AEE8Bc38, "0x6162636400000000000000000000000000000000000000000000000000000000");
      validator4 = Validator(0x5Dd68153c143BEb1E25858Db32424AEE543769C2, "0x6162636400000000000000000000000000000000000000000000000000000000");
      
      if (_id == 1) {
            delete newValidators;
            newValidators.push(validator1);
            newValidators.push(validator2);
            newValidators.push(validator3);
            newValidators.push(validator4);
            emit ValidatorSetChange(1, newValidators, 3);
      }  

      
      if (_id == 2) {
            emit shouldntTrackerResponse();
      }  
      
   }
}