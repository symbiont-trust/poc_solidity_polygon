# POC - Example of deploying a solidity contract to Polygon

## Overview

This project demonstrates deploying and interacting with a Solidity smart contract on the Polygon Amoy testnet. It serves as a proof-of-concept (PoC) for decentralized profile management and contract interaction using Polygon.



## Features

* Smart contract written in Solidity

* Deployment to Polygon Amoy testnet

* Verified contract on Polygonscan

* Interaction with contract (read and write functions) through Polygonscan UI

* Environment variables for secure key management



## Tech Stack

* **Blockchain**: Polygon (Amoy Testnet)
* **Smart Contracts**: Solidity, Hardhat 3
* **Node.js**: v22+



## Setup Instructions

### Prerequisites

* Node.js (v22 or later)
* npm or yarn
* Hardhat
* MetaMask wallet configured for Polygon Amoy Testnet(more on this below)


### Installation

```bash
# Clone the repository
git clone https://github.com/symbiont-trust/poc_solidity_polygon.git
cd poc_solidity_polygon


# Install dependencies
npm install

# Compile smart contract
npx hardhat compile

```


### Environment Variables

Create a `.env` file in the project root:

```bash
PRIVATE_KEY=<your-wallet-private-key>
POLYGON_AMOY_RPC_URL=<amoy-rpc-url>
POLYGONSCAN_API_KEY=<your-polygonscan-api-key>
```


### Deploy contract to Polygon Amoy Testnet

```bash
npx hardhat ignition deploy --network amoy  ./ignition/modules/profileRegistry.ts 
```
You will see the address that the contract has been deployed to, copy it.


## Contract Verification

After deployment, verify the contract so that you may be able to interact with the contract via Polygonscan:

```bash
npx hardhat verify --network amoy <contract-address>
```


### Manual Contract Verification
If the above automated method doesn't work for whatever reason, you could manually verify the smart contract in polygonscan.Do this: 

1. **flatten the source code so that everything is in a single file for easy verification.**

For this do: 
```bash
npx hardhat flatten contracts/profileRegistry.sol > flattened.sol  
```

2. **Go to: https://amoy.polygonscan.com/verifyContract .**

* Contract address -> The address you copied after deployment.
* Compiler type -> Solidity (Single file).
* Compiler version -> Choose the one with v0.8.28.
* Licence type -> MIT.
* After you hit continue, you will be asked to paste the solidity code of your contract.
Do not paste the original code of the profileRegistry.sol, rather, copy the code in the flattened.sol and paste it in the textbox.


### Adding Polygon Amoy Testnet to MetaMask

To interact with your contract via MetaMask, you need to add the Amoy testnet manually:

**Open MetaMask → Networks → Add Network → Add a network manually.**

Enter the following details:

**Network Name:** Polygon Amoy

**New RPC URL:** https://rpc-amoy.polygon.technology/

**Chain ID:** 80002

**Currency Symbol:** POL

**Block Explorer URL:** https://amoy.polygonscan.com/

Save the network.


### Getting Test POL (Amoy Faucet)

You need test POL tokens to interact with contracts on Amoy:

**Visit: https://faucet.stakepool.dev.br/amoy .**

Connect your MetaMask wallet.

POL will be sent to your wallet in a few seconds.



## Usage
1. Head over to https://amoy.polygonscan.com/  
2. Create an account and login
3. in the search bar, paste in the cocntract address of the smart contract and search for the contract. If     the   contract is verified, a UI with the contract address and fields to interact with the contract will appear.
1. Connect your MetaMask wallet.
3. Interact with the contract through Polygonscan

Example:
![Contract Interaction on Polygonscan](/images/polygonscan-interaction.png)



## License

This project is licensed under the MIT License.
