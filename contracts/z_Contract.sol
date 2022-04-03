// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title JRC_Storage
 * @dev Practice contract for CSE598
 */
contract JRC_Storage {

    uint256 number ;
    mapping (address => uint) public balances;
    mapping(address => mapping(address => uint)) public approvals;

    uint public _totalSupply;
    address private creator;
    string private my_name;
    string private my_symbol;
    uint8 private my_decimals;

    constructor() {
        creator = msg.sender;
        _totalSupply = 0; //this number comes from the spreadsheet
        my_name = "";
        my_symbol = "";
        my_decimals = 0;
        balances[msg.sender] = _totalSupply; 
        emit Transfer(msg.sender, msg.sender, _totalSupply);
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
        return _totalSupply;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success)
    {
      
        require(_value <= balances[msg.sender]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
     
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) 
    {
        return balances[_owner];

    }

    function approve(address _spender, uint256 _value) public returns (bool success)
    {
        approvals[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining)
    {
        return approvals[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
    {   
        require(_value <= balances[_from]);
        require(_value <= approvals[_from][_to]);
        
        approvals[_from][_to] -= _value;
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
//*/
}