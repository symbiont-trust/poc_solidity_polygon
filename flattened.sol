// Sources flattened with hardhat v3.0.0 https://hardhat.org

// SPDX-License-Identifier: MIT

// File contracts/profileRegistry.sol

// Original license: SPDX_License_Identifier: MIT
pragma solidity ^0.8.28;

contract ProfileRegistry {

    struct ProfileRecord {
        string ipnsName;
        uint256 lastUpdated;
    }

    mapping(address => ProfileRecord) public profiles;

    function updateProfile(string calldata ipnsName, uint256 timestamp) external {
        require(timestamp > profiles[msg.sender].lastUpdated, "Stale update");
        profiles[msg.sender] = ProfileRecord(ipnsName, timestamp);
    }
}

