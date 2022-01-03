pragma solidity ^0.8.11;

contract myUpgradable {
    address public myStorageContract;
    constructor (address _myStorageContract) public {
        myStorageContract = _myStorageContract;
    }

    // A sample function that you could implement for buying tokens for 
    // demonstration purposes.
    function buyMyTokens() public {
        // Do your logic for buying tokens for instance, calculating how 
        // many he will get for the msg.value he sent and so on. To later
        // update the storage information.
        // Create the storage contract instance.
        myStorage s = myStorage(myStorageContract);
        s.setMyNumber(10);
    }
}

contract myStorage {
    uint256 public myNumber;
    function setMyNumber(uint256 _myNumber) public {
        myNumber = _myNumber;
    }
}

