# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# Install the Modules
install :; 
	forge install dapphub/ds-test 
	forge install OpenZeppelin/openzeppelin-contracts

deploy:
	forge create --rpc-url ${RPC_URL} --constructor-args 1 7 --private-key ${PRIVATE_KEY} src/CustomNFT.sol:CustomNFT 

verify:
	forge verify-contract --chain-id 4 --num-of-optimizations 200 --constructor-args 00000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000007 --compiler-version v0.8.10+commit.fc410830 0x98028ebaa468b5fbc7cd25007f6215a35aa43538 src/CustomNFT.sol:CustomNFT ${ETHERSCAN_KEY}

verify-check: 
	forge verify-check --chain-id 4 wu9vblth1gqpjxvjwjwyxtkqkkvlxk12fbaculnshv2s4xrr8i ${ETHERSCAN_KEY}

