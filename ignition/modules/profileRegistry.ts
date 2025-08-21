import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const ProfileRegistryModule = buildModule("ProfileRegistryModule", (m) => {
    // This declares a contract deployment. Ignition will handle everything
    const profileRegistry = m.contract("ProfileRegistry");

    // We return the deployed contract so it's available after deployment
    return { profileRegistry };
});

export default ProfileRegistryModule;