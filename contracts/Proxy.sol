// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract Proxy is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor

    address BallotContract;
    address VotingContract;
    address MovieContract;

    struct Miner {
        uint256 amount;
        address minerAddress;
    }

    struct Proposal {
        uint256 tokenId;
        uint256 targetAmount;
        uint256 Deadline;
        uint256 currentFunded;
        address makerAddress;
        Miner[] investorList;
    }

    struct Agenda {
        uint256 proposalId;
        uint256 agendaId;
    }

    mapping(uint256 => mapping(address => Miner)) Investors;

    mapping(uint256 => Proposal) Proposals;

    mapping(uint256 => bool) ProposalLocked;

    mapping(uint256 => string) URIStorage;

    constructor() {
        _disableInitializers();
    }

    function initialize(
        address _ballot,
        address _voting,
        address _movie
    ) public initializer {
        __Ownable_init();
        __UUPSUpgradeable_init();
        BallotContract = _ballot;
        VotingContract = _voting;
        MovieContract = _movie;
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}

    function upgradeContract(
        address _ballot,
        address _voting,
        address _movie
    ) public onlyOwner {
        BallotContract = _ballot;
        VotingContract = _voting;
        MovieContract = _movie;
    }
}
