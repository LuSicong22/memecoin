// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Memecoin} from "contracts/memecoin/Memecoin.sol";
import {MemecoinClaim, ClaimSchedule, ClaimType} from "contracts/claim/MemecoinClaim.sol";

contract MemecoinClaimTest is Test {
    Memecoin memecoin;
    MemecoinClaim memecoinClaim;
    event ClaimTokenDepositedAndClaimStarted(
        uint256 tokenAmount,
        uint256 claimStartDate
    );

    function setUp() public {
        memecoin = new Memecoin("Memecoin", "MEME", 1e24, address(this));
        memecoinClaim = new MemecoinClaim();
        memecoinClaim.initialize(
            address(memecoin),
            address(0),
            address(0),
            address(0)
        );
    }

    function test_SetClaimSchedules() public {
        ClaimType[] memory claimType = _setUpClaimType();
        _setUpClaimSchedule(claimType);

        // Assert correct schedule data for CommunityPresale
        ClaimSchedule memory schedule = memecoinClaim.getClaimSchedule(
            ClaimType.CommunityPresale
        );

        assertEq(schedule.startCycle, 0);
        assertEq(schedule.lockUpBPs[0], 2500);
        assertEq(schedule.lockUpBPs[1], 5000);
        assertEq(schedule.lockUpBPs[2], 7500);
    }

    function test_SetClaimables() public {
        address[] memory prankWallets = new address[](3);
        prankWallets[0] = address(0x1234);
        prankWallets[1] = address(0x5678);
        prankWallets[2] = address(0x9abc);

        uint128[] memory claimables = new uint128[](3);
        claimables[0] = 1000;
        claimables[1] = 2000;
        claimables[2] = 3000;

        ClaimType[] memory claimTypes = new ClaimType[](3);
        claimTypes[0] = ClaimType.CommunityPresale;
        claimTypes[1] = ClaimType.CommunityPresale;
        claimTypes[2] = ClaimType.Contributors;

        memecoinClaim.setClaimables(prankWallets, claimables, claimTypes);

        // Assert that claimable amounts are set correctly for each prank wallet and claim type
        for (uint256 i = 0; i < prankWallets.length; i++) {
            (uint128 claimable, uint128 claimed) = memecoinClaim.usersClaimData(
                prankWallets[i],
                claimTypes[i]
            );
            assertEq(claimed, 0); // Ensure claimed amount is initially 0
            assertEq(claimable, claimables[i]);
        }
    }

    function test_DepositAndStartClaim() public {
        (
            uint256 tokenAmount,
            uint256 claimStartDate
        ) = _setUpDepositClaimTokenAndStartClaim();

        // Assert successful deposit and claim activation
        assertEq(memecoinClaim.claimStartDate(), claimStartDate);
        assertEq(memecoinClaim.claimActive(), true);
        assertEq(memecoinClaim.claimTokenDeposited(), true);
        assertEq(memecoin.balanceOf(address(memecoinClaim)), tokenAmount); // Verify token deposit
    }

    function test_RevertWhen_ClaimBeforeStart() public {
        _claimOnDay(false, 0, 0);
    }

    function test_ClaimOnDay0() public {
        _claimOnDay(true, 0, 250);
    }

    function test_ClaimOnDay1() public {
        _claimOnDay(true, 1, 251);
    }

    function test_ClaimOnDay540() public {
        _claimOnDay(true, 540, 1000);
    }

    function _setUpClaimType()
        private
        pure
        returns (ClaimType[] memory claimType)
    {
        claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;
    }

    function _setUpClaimSchedule(ClaimType[] memory claimType) private {
        ClaimSchedule[] memory schedules = new ClaimSchedule[](1);
        uint256[] memory lockUpBPs = new uint256[](3);
        lockUpBPs[0] = 2500;
        lockUpBPs[1] = 5000;
        lockUpBPs[2] = 7500;

        schedules[0] = ClaimSchedule({
            startCycle: 0, // 0 cycles starting from claim start
            lockUpBPs: lockUpBPs // Lockup percentages for each cycle (25%, 50%, 75%)
        });

        memecoinClaim.setClaimSchedules(claimType, schedules);
    }

    function _setUpDepositClaimTokenAndStartClaim()
        private
        returns (uint256 tokenAmount, uint256 claimStartDate)
    {
        tokenAmount = 1000000; // Example amount
        claimStartDate = block.timestamp;
        memecoin.approve(address(memecoinClaim), 10000000);

        ClaimType[] memory claimType = _setUpClaimType();
        _setUpClaimSchedule(claimType);

        vm.expectEmit();
        emit ClaimTokenDepositedAndClaimStarted(tokenAmount, claimStartDate);

        memecoinClaim.depositClaimTokenAndStartClaim(
            tokenAmount,
            claimStartDate
        );
    }

    function _claimOnDay(
        bool claimAfterStart,
        uint256 daysPassed,
        uint256 expectedClaimed
    ) private {
        _setUpDepositClaimTokenAndStartClaim();

        address[] memory wallets = new address[](1);
        wallets[0] = address(this);

        uint128[] memory claimables = new uint128[](1);
        claimables[0] = 1000;

        ClaimType[] memory claimTypes = new ClaimType[](1);
        claimTypes[0] = ClaimType.CommunityPresale;

        memecoinClaim.setClaimables(wallets, claimables, claimTypes);

        if (claimAfterStart) {
            // Warp to claim start date
            vm.warp(memecoinClaim.claimStartDate() + daysPassed * 1 days);

            // Call claim and assert successful claim
            uint256 initialBalance = memecoin.balanceOf(address(this)); // Assuming test account is claiming
            memecoinClaim.claim(address(0), claimTypes);
            assertEq(
                memecoin.balanceOf(address(this)),
                initialBalance + expectedClaimed
            );
        } else {
            // Warp to a block before claim start
            vm.warp(memecoinClaim.claimStartDate() - 1);

            // Call claim and assert revert
            vm.expectRevert();
            memecoinClaim.claim(address(0), claimTypes);
        }
    }
}
