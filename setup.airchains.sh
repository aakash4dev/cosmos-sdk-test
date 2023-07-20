make build

rm -rf ./private/.simapp

./build/simd init demo \
    --home ./private/.simapp \
    --chain-id learning-chain-1

cat ./private/.simapp/config/genesis.json

# ./build/simd keys list \
#     --home ./private/.simapp \
#     --keyring-backend test

./build/simd keys add alice \
    --home ./private/.simapp \
    --keyring-backend test

# ! SAMPLE RESPONSE
# - name: alice
#   type: local
#   address: cosmos1a38z9tn655rxyu6hgkmnptxvzedkc9gzt8wssk
#   pubkey: '{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"Akan0MiQkOiqI4OA5JoiaJ6tIfe+TpDnoOW/R8tK5zJ4"}'
#   mnemonic: ""
# 
# 
# **Important** write this mnemonic phrase in a safe place.
# It is the only way to recover your account if you ever forget your password.
# 
# true ancient december pioneer situate mango pull quarter tumble afford teach element repair evil attract bracket blue resist atom license famous pony diesel country

grep bond_denom ./private/.simapp/config/genesis.json

./build/simd add-genesis-account alice 100000000stake \
    --home ./private/.simapp \
    --keyring-backend test

grep -A 10 balances ./private/.simapp/config/genesis.json

./build/simd gentx alice 70000000stake \
    --home ./private/.simapp \
    --keyring-backend test \
    --chain-id learning-chain-1


./build/simd collect-gentxs \
    --home ./private/.simapp

./build/simd start \
    --home ./private/.simapp
