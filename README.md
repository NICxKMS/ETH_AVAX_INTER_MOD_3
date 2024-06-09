# GameToken Smart Contract

## Simple Overview
This project implements a custom ERC20 token called `GameToken` using the OpenZeppelin library. The smart contract includes functionalities to mint new tokens, burn existing tokens, and transfer tokens, all while enforcing ownership rules.

## Description
GameToken is an ERC20-compliant smart contract developed in Solidity. It leverages OpenZeppelin's robust libraries to ensure security and reliability. The contract features public functions for minting (`recharge`), burning (`redeem`), and transferring tokens, with specific permissions enforced by the `onlyOwner` modifier.

### Key Features
- **ERC20 Compliance**: Inherits standard ERC20 functionality from OpenZeppelin.
- **Ownership Management**: Utilizes OpenZeppelin's `Ownable` contract to manage contract ownership.
- **Decimal Customization**: Overrides the `decimals` function to set the token decimals to zero.
- **Minting and Burning**: Allows the owner to mint (`recharge`) new tokens and any holder to burn (`redeem`) their tokens.
- **Custom Transfer Function**: Overrides `transferFrom` to use the inherited function from OpenZeppelin.

### Key Functions and Statements
- **`require`**: Ensures conditions are met before executing certain functions, reverting the transaction if conditions are not met.
- **`onlyOwner`**: A modifier that restricts certain functions to be called only by the contract owner.

## Getting Started

### Installing
1. **Download the Project**
   - Clone the repository from GitHub:
     ```sh
     git clone https://github.com/NICxKMS/ETH_AVX_INTER_MOD_3.git
     ```
   - Navigate to the project directory:
     ```sh
     cd ETH_AVX_INTER_MOD_3
     ```

2. **Open Remix IDE**
   - Go to [Remix IDE](https://remix.ethereum.org/).
   - In the file explorer, create a new file named `GameToken.sol`.

3. **Copy and Paste the Smart Contract Code**
   - Copy the following code and paste it into `GameToken.sol`:
     ```solidity
     // SPDX-License-Identifier: MIT
     pragma solidity ^0.8.20;

     import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
     import "@openzeppelin/contracts/access/Ownable.sol";

      // Author : Nikhil
     
     contract GameToken is ERC20, Ownable {

         constructor()
             ERC20("Nikhil", "NK")
         {
             transferOwnership(msg.sender);
         }

         function decimals() public view virtual override returns (uint8) {
             return 0;
         }

         function recharge(address to, uint256 amount) public onlyOwner {
             _mint(to, amount);
         }

         function redeem(address from, uint256 amount) public {
             require(amount <= balanceOf(from), "Insufficient balance to redeem");
             _burn(from, amount);
         }

         function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
             return super.transferFrom(from, to, amount);
         }
     }
     ```

### Executing Program

#### How to Run the Program in Remix
1. **Compile the Smart Contract**
   - Select the `Solidity Compiler` tab.
   - Ensure the compiler version is set to `0.8.20`.
   - Click `Compile GameToken.sol`.

2. **Deploy the Contract**
   - Go to the `Deploy & Run Transactions` tab.
   - Select the appropriate environment (e.g., JavaScript VM).
   - Click `Deploy`.

3. **Interact with the Contract**
   - After deploying, the contract will appear under `Deployed Contracts`.
   - To recharge tokens:
     - Input the address and the amount of tokens to mint.
     - Click the `recharge` button.
   - To redeem tokens:
     - Input the address and the amount of tokens to burn.
     - Click the `redeem` button.
   - To transfer tokens:
     - Input the sender's address, receiver's address, and the amount of tokens to transfer.
     - Click the `transferFrom` button.

## Help

### Common Issues
- **Compilation Errors**: Ensure the Solidity version specified matches the version set in the Remix compiler.
- **Deployment Errors**: Make sure the selected environment is correct and the contract is compiled without errors.
- **Interaction Errors**: Ensure the address and value inputs are valid and that sufficient balance exists for redeeming tokens.

For detailed debugging and assistance, refer to the Remix documentation or community forums.

## Authors
- **Nikhil Kumar**
  - GitHub: [NICxKMS](https://github.com/NICxKMS)
  - Twitter: [@Nikhil](https://twitter.com/yourusername)  <!-- Update with your actual Twitter handle if available -->

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
