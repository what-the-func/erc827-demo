pragma solidity ^0.4.19;

import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

/**
 * @title SimpleToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `StandardToken` functions.
 */
contract FuncToken is StandardToken {

  string public constant name = "FuncToken"; // solium-disable-line uppercase
  string public constant symbol = "FUNC"; // solium-disable-line uppercase
  uint8 public constant decimals = 18; // solium-disable-line uppercase

  uint256 public constant INITIAL_SUPPLY = 10000 * (10 ** uint256(decimals));

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
  function FuncToken() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }

  function transfer(address _to, uint256 _value, bytes _data) public returns (bool) {
    require(_to != address(this));
    require(super.transfer(_to, _value));
    require(_to.call(_data));
    return true;
  }

  function transferFrom(address _from, address _to, uint256 _value, bytes _data) public returns (bool) {
    require(_to != address(this));
    require(super.transferFrom(_from, _to, _value));
    require(_to.call(_data));
    return true;
  }

  function approve(address _spender, uint256 _value, bytes _data) public returns (bool) {
    require(_spender != address(this));
    require(super.approve(_spender, _value));
    require(_spender.call(_data));
    return true;
  }
}