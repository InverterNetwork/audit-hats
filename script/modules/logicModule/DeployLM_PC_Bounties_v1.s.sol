pragma solidity ^0.8.0;

import "forge-std/Script.sol";

import {LM_PC_Bounties_v1} from "@lm/LM_PC_Bounties_v1.sol";

/**
 * @title LM_PC_Bounties_v1 Deployment Script
 *
 * @dev Script to deploy a new LM_PC_Bounties_v1.
 *
 *
 * @author Inverter Network
 */
contract DeployLM_PC_Bounties_v1 is Script {
    // ------------------------------------------------------------------------
    // Fetch Environment Variables
    uint deployerPrivateKey = vm.envUint("ORCHESTRATOR_OWNER_PRIVATE_KEY");
    address deployer = vm.addr(deployerPrivateKey);

    LM_PC_Bounties_v1 bountyManager;

    function run() external returns (address) {
        vm.startBroadcast(deployerPrivateKey);
        {
            // Deploy the LM_PC_Bounties_v1.

            bountyManager = new LM_PC_Bounties_v1();
        }

        vm.stopBroadcast();

        // Log the deployed LM_PC_Bounties_v1 contract address.
        console2.log(
            "Deployment of LM_PC_Bounties_v1 Implementation at address",
            address(bountyManager)
        );

        return address(bountyManager);
    }
}
