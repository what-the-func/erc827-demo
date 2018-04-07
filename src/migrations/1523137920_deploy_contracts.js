const FuncToken = artifacts.require('./FuncToken.sol')
const Test = artifacts.require('Test.sol')

module.exports = function(deployer) {
  deployer.deploy(FuncToken)
  deployer.deploy(Test)
}
