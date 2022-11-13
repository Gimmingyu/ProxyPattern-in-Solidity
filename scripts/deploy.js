const { upgrades, ethers } = require("hardhat");
const hre = require("hardhat");

async function main() {
  const Ballot = await hre.ethers.getContractFactory("Ballot");
  console.log("Deploying Ballot contracts ... ");

  const ballot = await upgrades.deployProxy(Ballot, ["0xF1a1cA499560b659146d0eAdca8068133a7aEb28"])
  await ballot.deployed();
  console.log("Ballot deployed successfully", ballot.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
