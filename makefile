# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Install the Modules
install :; 
	forge install dapphub/ds-test 
	forge install OpenZeppelin/openzeppelin-contracts

deploy:
	# forge create --rpc-url ${LOCAL_RPC_URL} --constructor-args 10 10000 --private-key ${LOCAL_PRIVATE_KEY} src/CustomNFT.sol:CustomNFT 

abi: 
	cast abi-encode "constructor(uint256,uint256)" 10 10000

verify:
	forge verify-contract --chain-id 4 --num-of-optimizations 200 --constructor-args 0x000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000002710 --compiler-version v0.8.10+commit.fc410830 0x5fbdb2315678afecb367f032d93f642f64180aa3 src/CustomNFT.sol:CustomNFT ${ETHERSCAN_KEY}

verify-check: 
	forge verify-check --chain-id 4 dfxrzgvtfwv8cdgg4cgx21rekrhr3hmfjsu9td8a7kfkamsk99 ${ETHERSCAN_KEY}

setBaseUri: 
	  cast send --rpc-url ${LOCAL_RPC_URL} 0x5fbdb2315678afecb367f032d93f642f64180aa3  "setBaseURI(string)" "https://gateway.pinata.cloud/ipfs/QmfAASejhcLL3MrmSpUwZyhv9DnyBrCsNxASVpbTzTjS3P" --private-key ${LOCAL_PRIVATE_KEY}
	  
setupSaleInfo:
	cast send --rpc-url ${LOCAL_RPC_URL} 0x5fbdb2315678afecb367f032d93f642f64180aa3  "setupSaleInfo(uint64,uint64,uint32)"  145000000000000000 150000000000000000 1649151038 --private-key ${LOCAL_PRIVATE_KEY}

sale: 
	cast call --rpc-url ${LOCAL_RPC_URL} --private-key ${LOCAL_PRIVATE_KEY} 0x5fbdb2315678afecb367f032d93f642f64180aa3 "SALE_OPEN()" 

isPublicSaleOn:
	cast call --rpc-url ${LOCAL_RPC_URL} --private-key ${LOCAL_PRIVATE_KEY} 0x5fbdb2315678afecb367f032d93f642f64180aa3 "SALE_OPEN()" 

saleConfig:
	cast call --rpc-url ${LOCAL_RPC_URL} --private-key ${LOCAL_PRIVATE_KEY} 0x5fbdb2315678afecb367f032d93f642f64180aa3 "saleConfig()(uint32,uint64,uint64)" 

alt:
	cast call --rpc-url ${LOCAL_RPC_URL} --private-key ${LOCAL_PRIVATE_KEY} 0x5fbdb2315678afecb367f032d93f642f64180aa3 "saleConfig" --etherscan-api-key ${ETHERSCAN_KEY} 


setMintPassKey: 
	cast send --rpc-url ${LOCAL_RPC_URL} 0x5fbdb2315678afecb367f032d93f642f64180aa3  "setMintPassKey(uint256)" 7   --private-key ${LOCAL_PRIVATE_KEY}
	
publicSaleMint:
	cast send --rpc-url ${LOCAL_RPC_URL} 0x5fbdb2315678afecb367f032d93f642f64180aa3  "publicSaleMint(uint256,uint256)" 1 7  --private-key ${LOCAL_PRIVATE_KEY}  --value 0.15ether 

tokenId:
	cast call --rpc-url ${LOCAL_RPC_URL} --private-key ${LOCAL_PRIVATE_KEY} 0x5fbdb2315678afecb367f032d93f642f64180aa3 "tokenURI(uint256)(string)" 0

withdrawAll:
	cast send --rpc-url ${LOCAL_RPC_URL} 0x5fbdb2315678afecb367f032d93f642f64180aa3  "withdrawAll()"  --private-key ${LOCAL_PRIVATE_KEY}  

