// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

/**
 * @title JRC_Storage
 * @dev Practice contract for CSE598
 */

 /*
    Graded Task 1 - name() :            765F7A38	
    Graded Task 2 - symbol():           C5B8E007	
    Graded Task 3 - decimals():         18	
    Graded Task 4 - totalSupply():      21000000	
    Graded Task 5 - transfer():         0x4DA59FE6c21b33D153dc799EaBCF10076d9F769f	
    Graded Task 6 - balanceOf() - How much to send:     318392	
    Graded Task 6 - balanceOf() - Address to send to:   0x9709df3B12d0B3A0A27716F598dDD2C119F37582	
    Non-Graded Task 7 - approve() - Amount to approve:  91845	
    Non-Graded Task 7 - approve() - Address to approve:	0xC38be03FEe1404c155002b6D6160e7aac4C6C0e0	
    Graded Task 8 - allowance():                        91845
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