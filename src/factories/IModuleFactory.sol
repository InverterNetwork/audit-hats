// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

// External Interfaces
import {IBeacon} from "@oz/proxy/beacon/IBeacon.sol";

// Internal Interfaces
import {IModule, IOrchestrator} from "src/modules/base/IModule.sol";

interface IModuleFactory {
    //--------------------------------------------------------------------------
    // Errors

    /// @notice Given metadata invalid.
    error ModuleFactory__InvalidMetadata();

    /// @notice Given beacon invalid.
    error ModuleFactory__InvalidBeacon();

    /// @notice Given metadata unregistered.
    error ModuleFactory__UnregisteredMetadata();

    /// @notice Given metadata already registered.
    error ModuleFactory__MetadataAlreadyRegistered();

    //--------------------------------------------------------------------------
    // Events

    /// @notice Event emitted when new beacon registered for metadata.
    event MetadataRegistered(
        IModule.Metadata indexed metadata, IBeacon indexed beacon
    );

    /// @notice Event emitted when new module created for a orchestrator.
    event ModuleCreated(
        address indexed orchestrator, address indexed module, string moduleTitle
    );

    //--------------------------------------------------------------------------
    // Functions

    /// @notice Creates a module instance identified by given metadata.
    /// @param metadata The module's metadata.
    /// @param orchestrator The orchestrator's instance of the module.
    /// @param configData The configData of the module
    function createModule(
        IModule.Metadata memory metadata,
        IOrchestrator orchestrator,
        bytes memory configData
    ) external returns (address);

    /// @notice Returns the {IBeacon} instance registered and the id for given
    ///         metadata.
    /// @param metadata The module's metadata.
    /// @return The module's {IBeacon} instance registered.
    /// @return The metadata's id.
    function getBeaconAndId(IModule.Metadata memory metadata)
        external
        view
        returns (IBeacon, bytes32);

    /// @notice Registers metadata `metadata` with {IBeacon} implementation
    ///         `beacon`.
    /// @dev Only callable by owner.
    /// @param metadata The module's metadata.
    /// @param beacon The module's {IBeacon} instance.
    function registerMetadata(IModule.Metadata memory metadata, IBeacon beacon)
        external;
}
