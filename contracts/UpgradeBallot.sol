// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract UpgradeBallot is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    event contractChanged(address newAddress);
    address myAddress;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address _owner) public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
        myAddress = _owner;
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}

    function retrieve() public view returns (address) {
        return myAddress;
    }

    function upgradeContract(address newContractAddr) public onlyOwner {
        myAddress = newContractAddr;
        emit contractChanged(newContractAddr);
    }
}
