const hre = require("hardhat");

async function main() {
  console.log("Starting deploy...");

  const SoulBoundToken = await hre.ethers.getContractFactory("SoulBoundToken");
  const sbt = await SoulBoundToken.deploy(process.env.NAME, process.env.SYMBOL, process.env.BASE_URI);
  await sbt.deployed();
  
  console.log(`Soul Bound Token deployed to: https://etherscan.io/address/${sbt.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
