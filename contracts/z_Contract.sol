// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title JRC_Storage
 * @dev Store & retrieve value in a variable
 */
contract JRC_Storage {

    uint256 number ;
    mapping (address => uint) public balances;

    address private creator;
    string private my_name = "";
    string private my_symbol = "";
    uint8 private my_decimals = 18;

    constructor() {
        creator = msg.sender;
        balances[msg.sender] = 100; //this number comes from the spreadsheet
    }

    function name() public view returns (string memory)
    {
        return my_name;
    }

    function getCreator() public view returns (address)
    {
        return creator;
    }
    
    function symbol() public view returns (string memory)
    {
        return my_symbol;
    }

    function decimals() public view returns (uint8)
    {
        return my_decimals;
    }

    function totalSupply() public view returns (uint256)
    {
        return balances[msg.sender];
    }

    function transfer(address _to, uint256 _value) public returns (bool success)
    {
        success = false;
        
        if (_value <= balances[msg.sender])
            balances[msg.sender] -= _value;
            balances[_to] += _value;

            //emit Transfer(msg.sender, _to, _value);

            success = true;
        
        return success;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];

    }
/*
    function approve(address _spender, uint256 _value) public returns (bool success)

    function allowance(address _owner, address _spender) public view returns (uint256 remaining)

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)

    event Transfer(address indexed _from, address indexed _to, uint256 _value)

    event Approval(address indexed _owner, address indexed _spender, uint256 _value)
*/
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}