# Exploring Move-aptos

https://aptosfoundation.org/

aptos 7.6.0

## Move's raison d'être

The Move programming language was originally created by a team of engineers at Facebook for the Diem Payment Network. Move is designed to be a platform-agnostic language to enable common libraries, tooling, and developer communities across diverse blockchains with vastly different data and execution models

## Notes

- Move was designed to prevent entire classes of attacks and bugs such as reentrancy attacks, double spends, and arithmetic overflow. Type safety and compile time checks are at the forefront of the security.

- Runtime verification : The bytecode can be verified at runtime to verify that nothing has gone wrong, providing extra safety and preventing malicious actors.

- Move on Aptos provides a specification language to provide formal verification of contracts. This allows for proving invariants and assists with code auditing.

- Move VM has 100% gas coverage. Gas is charged based upon actual usage in the system (CPU, memory, storage, I/O). In other words, no gas exploits.

- Aptos framework is fully specified and formally verified with the Move Prover. This includes the core contracts involving governance, NFTs, and Tokens.

- Binary Canonical Serialization (BCS) is the serialization format used on the Aptos blockchain. It is a binary canonical non-self-describing serialization format that is used to serialize data structures. BCS is used to serialize all data on-chain, provide binary responses on the REST API, and encode input arguments to transactions. Because BCS is not a self describing format, the reader must know the format of the bytes ahead of time.

- Aptos has a rust-sdk and go-sdk

- NFTs are called DA (Digital Asset) on Aptos. Digital Asset (DA) standard is a modern Non-Fungible Token (NFT) standard for Aptos

- The Confidential Asset Standard (also known as “Confidential Asset” or “CA”) is a privacy-focused protocol for managing Fungible Assets (FA). It allows users to perform transactions with hidden FA amounts while keeping sender and recipient addresses publicly visible. Operations on Confidential Asset balances (confidential balances), require zero-knowledge proofs (ZKPs) to verify transaction correctness without revealing hidden amounts and other sensitive data.

- You can employ the Aptos Name Service at www.aptosnames.com to secure .apt domains for key accounts to make them memorable and unique. Different from other blockchains where accounts and addresses are implicit, accounts on Aptos are explicit and need to be created before they can execute transactions. The account can be created explicitly or implicitly by transferring Aptos tokens (APT) there

- the Move Virtual Machine (MoveVM)




## Bugs

- None of the compiling instructions of the aptos dev documentation are working : https://aptos.dev/en/build/smart-contracts/compiling . 
Fix : pass a hardcoded address to the named-addresses argument.

## Instructions

### With Docker

```bash
git clone https://github.com/Neal-C/exploring_move_aptos.git
```

```bash
cd exploring_move_aptos
```

```bash
docker build -t neal-c-move-aptos:latest .
```

```bash
docker run --name neal-c-move-aptos neal-c-move-aptos:latest
```

### With local install

Aptos cli installation : https://aptos.dev/en/build/cli/install-cli/install-cli-linux

```bash
git clone https://github.com/Neal-C/exploring_move_aptos.git
```

```bash
cd exploring_move_aptos
```

```bash
aptos move compile --named-addresses exploring_move_aptos=0x1cecfef9e239eff12fb1a3d189a121c37f48908d86c0e9c02ec103e0a05ddebb
```

```bash
aptos move test --named-addresses exploring_move_aptos=0x1cecfef9e239eff12fb1a3d189a121c37f48908d86c0e9c02ec103e0a05ddebb
```

## Resources

- https://aptos.dev/
- https://aptosfoundation.org/
- https://aptoslabs.com/
- https://github.com/aptos-labs/aptos-rust-sdk
- https://github.com/aptos-labs/aptos-go-sdk
- https://www.aptosnames.com/