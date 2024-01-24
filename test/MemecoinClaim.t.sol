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
        ClaimType[] memory claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;

        ClaimSchedule[] memory schedules = new ClaimSchedule[](1);
        uint256[] memory lockUpBPs = new uint256[](3);
        lockUpBPs[0] = 2500;
        lockUpBPs[1] = 5000;
        lockUpBPs[2] = 7500;

        schedules[0] = ClaimSchedule({
            startCycle: 0, // 0 cycles starting from claim start
            lockUpBPs: lockUpBPs // Lockup percentages for each cycle (25%, 50%, 75%)
        });

        memecoinClaim.setClaimSchedules(claimType, schedules); // Note the parentheses

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
        prankWallets[0] = address(0x0002e98993f83FF61bad90294480335F2F6c4980);
        prankWallets[1] = address(0x0008d343091EF8BD3EFA730F6aAE5A26a285C7a2);
        prankWallets[2] = address(0x00440F11DC0F92deAa3A563c6EfBAd3cd6AeFfa9);

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
        uint256 tokenAmount = 1000000; // Example amount
        uint256 claimStartDate = block.timestamp + 1 days; // Start in a day
        memecoin.approve(address(memecoinClaim), 10000000);

        vm.expectEmit();
        emit ClaimTokenDepositedAndClaimStarted(tokenAmount, claimStartDate);

        memecoinClaim.depositClaimTokenAndStartClaim(
            tokenAmount,
            claimStartDate
        );

        // Assert successful deposit and claim activation
        assertEq(memecoinClaim.claimStartDate(), claimStartDate);
        assertEq(memecoinClaim.claimActive(), true);
        assertEq(memecoinClaim.claimTokenDeposited(), true);
        assertEq(memecoin.balanceOf(address(memecoinClaim)), tokenAmount); // Verify token deposit
    }

    function test_ClaimBeforeClaimStart() public {
        // Warp to a block before claim start
        vm.warp(memecoinClaim.claimStartDate() - 1);

        ClaimType[] memory claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;
        // Call claim and assert revert
        vm.expectRevert();
        memecoinClaim.claim(address(0), claimType);
    }

    function test_ClaimOnDay0() public {
        // Warp to claim start date
        vm.warp(memecoinClaim.claimStartDate());

        ClaimType[] memory claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;
        // Call claim and assert successful claim
        uint256 initialBalance = memecoin.balanceOf(address(this)); // Assuming test account is claiming
        memecoinClaim.claim(address(0), claimType);
        assertEq(memecoin.balanceOf(address(this)), initialBalance + 2500);
    }

    function test_ClaimOnDay1() public {
        // Warp to day 1
        vm.warp(memecoinClaim.claimStartDate() + 1 days); // Assuming claim starts on day 0

        ClaimType[] memory claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;
        // Call claim and assert successful claim
        uint256 initialBalance = memecoin.balanceOf(address(this)); // Assuming test account is claiming
        memecoinClaim.claim(address(0), claimType);
        assertEq(memecoin.balanceOf(address(this)), initialBalance + 2500);
    }

    function test_ClaimOnDay540() public {
        // Warp to day 540
        vm.warp(memecoinClaim.claimStartDate() + 540 days);

        ClaimType[] memory claimType = new ClaimType[](1);
        claimType[0] = ClaimType.CommunityPresale;
        // Call claim and assert successful claim
        uint256 initialBalance = memecoin.balanceOf(address(this)); // Assuming test account is claiming
        memecoinClaim.claim(address(0), claimType);
        assertEq(memecoin.balanceOf(address(this)), initialBalance + 2500);
    }
}
