// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract AlanToken {
    mapping(address => uint256) private s_balances;

    string public name = "Alan Token";

    // function name() public view returns (string memory) {
    //     return "Alan Token";
    // }

    // function totalSupply() public view returns (uint256) {
    //     return 100 ether;
    // }

    // function decimals() public view returns (uint8) {
    //     return 18;
    // }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to, uint256 ammount) public {
        uint256 previousBalance = s_balances[msg.sender] + s_balances[_to];
        s_balances[msg.sender] -= ammount;
        s_balances[_to] += ammount;
        require(s_balances[msg.sender] + s_balances[_to] == previousBalance);
    }
}
