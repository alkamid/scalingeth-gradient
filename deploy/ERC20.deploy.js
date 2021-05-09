// Just a standard hardhat-deploy deployment definition file!
const func = async (hre) => {
  const { deployments, getNamedAccounts } = hre
  const { deploy } = deployments
  const { deployer } = await getNamedAccounts()

  const initialSupply = 1000000
  const name = 'My Optimistic Token'

  const dai = await deploy('ERC20', {
    from: deployer,
    args: [ initialSupply, name ],
    log: true
  })

  const daiAddress = dai.address;

  await deploy('GradientDao', {
    from: deployer,
    args: [ daiAddress ],
    log: true
  })
}

func.tags = [ 'ERC20' , 'GradientDao']
module.exports = func
