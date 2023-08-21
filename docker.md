# Docker Commands

## Build Docker Images

```bash
docker build -t local/ping-explorer .
```

## Run Docker Images

Setup chains repository

```bash
mkdir -p local_env/chains/mainnet
mkdir -p local_env/chains/testnet
```

setup chains config

```bash
tee local_env/chains/mainnet/yourchain.json > /dev/null <<EOF
{
  "chainId": "ping-mainnet",
  "lcd": "https://rpc.ping.pub",
  "rpc": "https://rpc.ping.pub",
  "explorer": "https://explorer.ping.pub",
  "bech32Prefix": "ping",
  "asset": "PING",
  "coinLookup": [
    {
      "viewDenom": "uping",
      "chainDenom": "uping",
      "chainToViewConversionFactor": "0.000000001"
    },
    {
      "viewDenom": "ping",
      "chainDenom": "ping",
      "chainToViewConversionFactor": "0.000000001"
    }
  ]
}
EOF
```

change parameters in `yourchain.json` with your own chain parameters.

Run docker image

```bash
docker run -d --name ping-explorer \
 -p 3456:3456 \
 -v $(pwd)/local_env/chains:/usr/src/app/chains \
 local/ping-explorer
```

