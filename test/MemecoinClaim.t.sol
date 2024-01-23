pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Memecoin} from "contracts/memecoin/Memecoin.sol";
import {MemecoinClaim} from "contracts/claim/MemecoinClaim.sol";

contract MemecoinClaimTest is Test {
    Memecoin memecoin;
    MemecoinClaim memecoinClaim;

    function setUp() public {
        memecoin = new Memecoin("Memecoin", "MEME", 1e24, address(this));
        memecoinClaim = new MemecoinClaim();
        memecoinClaim.initialize(address(memecoin), address(0), address(0), address(0));
    }
}
