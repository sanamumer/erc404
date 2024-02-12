// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;
import "src/erc404.sol";
import {Script, console} from "lib/forge-std/src/Script.sol";
contract Deploy is Script {
    modifier broadcast(address deployer) {
        vm.startBroadcast(deployer);
        _;
        vm.stopBroadcast();
    }

    function run() external {
        deploy(<your deployer Address>);
    }

    function deploy(address deployer) public broadcast(deployer) {
        new SampleERC404("SampleToken","SMP", 18, 10000, deployer);
    }
}
