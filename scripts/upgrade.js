const { upgrades, ethers } = require("hardhat");
const hre = require("hardhat");

async function main() {
	const NewBallot = await hre.ethers.getContractFactory("UpgradeBallot");
	console.log("Upgrading Ballot contracts ... ");
	await upgrades.upgradeProxy('0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512', NewBallot)
	console.log("UpgradeBallot deployed successfully");
}

main().catch((error) => {
	console.error(error);
	process.exitCode = 1;
});
