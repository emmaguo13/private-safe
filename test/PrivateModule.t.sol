// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "forge-std/Test.sol";

// import {ZkSigModule} from "src/ZkSigModule.sol";
import {PrivateModule} from "src/PrivateModule.sol";
// import {MockSafe} from "src/MockSafe.sol";
// import {Button} from "src/Button.sol";

contract PrivateTest is Test {
    using stdStorage for StdStorage;

    PrivateModule module;
    // MockSafe mockSafe;
    // Button button;

    event sigEmitted();
    event ThresholdEmitted(uint256 threshold);

    function setUp() external {
        /*
         /// @param _owner Address of the  owner
        /// @param _avatar Address of the avatar (e.g. a Safe) basically thing executing the functions (relayer)
        /// @param _target Address of the contract that will call exec function - PASS TRANSACTIONS TO
        /// @param _semaphore Address of the semaphore contract
        /// @param _groupId semaphore groupId
        */
        address owner = 0x0ACBa2baA02F59D8a3d738d97008f909fB92e9FB; 
        // this was the old mock safe 
        // address avatar = 0xbfd0495c60772f42aa70a9be73af67b26678a530; 
        // address of our actual safe 
        address payable avatar = payable(0xC3ACf93b1AAA0c65ffd484d768576F4ce106eB4f);
        address target = 0x45dE2bB45Cac6cdC6a750eCB0Fd57421bC603546;
        address semaphore = 0x5259d32659F1806ccAfcE593ED5a89eBAb85262f;
        uint256 groupId = 11;

        module = new PrivateModule(owner, avatar, target, semaphore, groupId);
    }

    // VM Cheatcodes can be found in ./lib/forge-std/src/Vm.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testWorking() external {
        // slither-disable-next-line reentrancy-events,reentrancy-benign
        uint256 hi = 1;
        assertEq(hi, 1);
    }

    function testThreshold() external {
        uint256 threshold = module.getThreshold();
        assertEq(threshold, 2);
        emit ThresholdEmitted(threshold);
    }

    // function testExecute() external {
    //     zkSig.executeTransaction(
    //         address(button),
    //         0,
    //         abi.encodePacked(bytes4(keccak256("pushButton()"))),
    //         Enum.Operation.Call
    //     );
    // }

}