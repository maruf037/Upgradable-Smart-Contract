pragma solidity 0.8.11;

contract myProxy {
    address public storageAddress;
    address public upgradableAddress;
    address public owner = msg.sender;
    address[] public listStorage; // To keep track of past storage contract.
    address[] public listUpgradable; // To keep track of past upgradable contracts.

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor() public {
        storageAddress = address(new myStorage());
        upgradableAddress = address(new myUpgradable(storageAddress));
        listStorage.push(storageAddress);
        listUpgradable.push(upgradableAddress);
    }

    function() external {
        bool isSuccessful;
        bytes memory message;
        (isSuccessful, message) = upgradableAddress.delegatecall(msg.data);
        require(isSuccessful);
    }

    
}