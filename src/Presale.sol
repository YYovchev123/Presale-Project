// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.20;

import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Presale {
    event TokensPurchased(address indexed _token, address indexed buyer, uint256 amount);
    event TokensClaimed(address indexed _token, address indexed buyer, uint256 amount);
    event EthPricePerTokenUpdated(address indexed _token, uint256 newEthPricePerToken);
    event WhitelistUpdated(uint256 wlBlockNumber, uint256 wlMinBalance, bytes32 wlRoot);
    event TokenHardCapUpdated(address indexed _token, uint256 newTokenHardCap);
    event OperatorTransferred(address indexed previousOperator, address indexed newOperator);
    event VestingDurationUpdated(uint256 newVestingDuration);

    // Modifiers
    modifier onlyOperator(address someAddress) {
        if (someAddress != operator) revert();
        _;
    }

    // Variables
    address public operator;
    string public name;
    IERC20 public immutable token;
    uint256 public immutable decimals;
    uint256 public immutable tokenUnit;
    address public immutable factory;
    uint256 public ethPricePerToken;
    uint256 public tokenHardCap;
    uint256 public minTokenBuy;
    uint256 public maxTokenBuy;
    uint256 public startDate;
    uint256 public endDate;
    uint256 public protocolFee;
    address public protocolFeeAddress;
    uint256 public releaseDelay;
    uint256 public vestingDuration;
    mapping(address => uint256) public purchasedAmount;
    mapping(address => uint256) public claimedAmount;
    uint256 public totalPurchasedAmount;
    uint256 public wlBlockNumber;
    uint256 public wlMinBalance;
    bytes32 public wlRoot;

    // Constructor
    constructor(
        MainLaunchpadInfo memory _info,
        uint256 _protocolFee,
        address _protocolFeeAddress,
        address _operator,
        address _factory
    ) {}

    // Contract functions
    function isStarted() external view returns (bool) {}
    function isEnded() external view returns (bool) {}
    function isClaimable() external view returns (bool) {}
    function transferOperatorOwnership(address newOperator) external {}
    function updateWhitelist(uint256 _wlBlockNumber, uint256 _wlMinBalance, bytes32 _wlRoot) external {}
    function increaseHardCap(uint256 _tokenHardCapIncrement) external {}
    function updateEthPricePerToken(uint256 _ethPricePerToken) external {}
    function ethToToken(uint256 ethAmount) external view returns (uint256) {}
    function buyTokens(bytes32[] calldata proof) external payable {}
    function claimableAmount(address _address) external view returns (uint256) {}
    function claimTokens() external {}
    function withdrawEth() external {}
    function withdrawTokens() external {}
    function setVestingDuration(uint256 _vestingDuration) external {}
    function setName(string memory _name) external {}
    function transferPurchasedOwnership(address _newOwner) external {}
}
