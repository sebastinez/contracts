const { expect } = require("chai");
const { provider } = waffle;

describe("Material Token", function () {
  const [wallet] = provider.getWallets();

  it("Should return the owner of the newly created item", async function () {
    const Material = await ethers.getContractFactory("Material");
    const material = await Material.deploy();

    await material.deployed();
    await material.createItem(wallet.address, "http://google.com");

    expect(await material.checkOwner("1")).to.equal(wallet.address);
  });

  it("Should return the quantity of items a address has",async function() {
    const Material = await ethers.getContractFactory("Material");
    const material = await Material.deploy();

    await material.deployed();
    await material.createItem(wallet.address, "http://google.com");
    
    expect(await material.ownerBalance(wallet.address)).to.equal(1);
  })

});
