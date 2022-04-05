# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Install the Modules
install :; 
	forge install dapphub/ds-test 
	forge install OpenZeppelin/openzeppelin-contracts

deploy:
	forge create --rpc-url ${RPC_URL} --constructor-args 10 10000 --private-key ${PRIVATE_KEY} src/CustomNFT.sol:CustomNFT 

abi: 
	cast abi-encode "constructor(uint256,uint256)" 10 10000

verify:
	forge verify-contract --chain-id 4 --num-of-optimizations 200 --constructor-args 0x000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000002710 --compiler-version v0.8.10+commit.fc410830 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe src/CustomNFT.sol:CustomNFT ${ETHERSCAN_KEY}

verify-check: 
	forge verify-check --chain-id 4 dfxrzgvtfwv8cdgg4cgx21rekrhr3hmfjsu9td8a7kfkamsk99 ${ETHERSCAN_KEY}

setBaseUri: 
	  cast send --rpc-url ${RPC_URL} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe  "setBaseURI(string)" "https://gateway.pinata.cloud/ipfs/QmfAASejhcLL3MrmSpUwZyhv9DnyBrCsNxASVpbTzTjS3P" --private-key ${PRIVATE_KEY}
	  
setupSaleInfo:
	cast send --rpc-url ${RPC_URL} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe  "setupSaleInfo(uint64,uint64,uint32)"  145000000000000000 150000000000000000 1649151038 --private-key ${PRIVATE_KEY}

sale: 
	cast call --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe "SALE_OPEN()" 

isPublicSaleOn:
	cast call --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe "SALE_OPEN()" 

saleConfig:
	cast call --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe "saleConfig()(uint32,uint64,uint64)" 

alt:
	cast call --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe "saleConfig" --etherscan-api-key ${ETHERSCAN_KEY} 


setMintPassKey: 
	cast send --rpc-url ${RPC_URL} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe  "setMintPassKey(uint256)" 7   --private-key ${PRIVATE_KEY}
	
publicSaleMint:
	cast send --rpc-url ${RPC_URL} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe  "publicSaleMint(uint256,uint256)" 1 7  --private-key ${PRIVATE_KEY}  --value 0.15ether 

tokenId:
	cast call --rpc-url ${RPC_URL} --private-key ${PRIVATE_KEY} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe "tokenURI(uint256)(string)" 0

withdrawAll:
	cast send --rpc-url ${RPC_URL} 0x37e63844f0b79fd98cfb70b3d8054a2b39b8bffe  "withdrawAll()"  --private-key ${PRIVATE_KEY}  






