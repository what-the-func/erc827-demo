const FuncToken = artifacts.require('./FuncToken.sol')
const Test = artifacts.require('./Test.sol')

const ethjsABI = require('ethjs-abi')

contract('FuncToken', accounts => {
  it('transfers tokens and calls a contract function', async () => {
    const token = await FuncToken.new()
    const test = await Test.new()

    const abiMethod = {
      constant: false,
      inputs: [
        {
          name: '_to',
          type: 'address'
        },
        {
          name: '_value',
          type: 'uint256'
        },
        {
          name: '_data',
          type: 'bytes'
        }
      ],
      name: 'transfer',
      outputs: [
        {
          name: '',
          type: 'bool'
        }
      ],
      payable: false,
      stateMutability: 'nonpayable',
      type: 'function'
    }

    const callData = test.contract.increaseCount.getData()

    const transferData = ethjsABI.encodeMethod(abiMethod, [
      test.address,
      100,
      callData
    ])

    const transaction = await token.sendTransaction({
      from: accounts[0],
      data: transferData
    })

    const balance = await token.balanceOf(test.address)
    console.log(balance.toNumber())
    const count = await test.counter()
    console.log(count.toNumber())
  })
})
