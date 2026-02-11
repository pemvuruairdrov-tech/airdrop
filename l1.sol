# nama file: generate_l1_chain.py

# Data dasar L1 Chain
chain_name = "MyL1Chain"
symbol = "ML1"
initial_supply = 1000000
owner_address = "0x1234567890abcdef1234567890abcdef12345678"

# Generate smart contract content
contract_content = f"""
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract {chain_name} {{
    string public name = "{chain_name}";
    string public symbol = "{symbol}";
    uint256 public totalSupply = {initial_supply};
    address public owner = {owner_address};

    mapping(address => uint256) public balanceOf;

    constructor() {{
        balanceOf[owner] = totalSupply;
    }}

    function transfer(address to, uint256 amount) public {{
        require(balanceOf[msg.sender] >= amount, "Not enough balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }}
}}
"""

# Tulis ke file .txt
with open("L1ChainOutput.txt", "w") as f:
    f.write(contract_content)

print("File 'L1ChainOutput.txt' berhasil dibuat! Buka Notepad untuk copy.")
