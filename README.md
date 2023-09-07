# Soulbound Token (SBT)

## Overview

Implementation of Soul Bound Token concept, introduced by Vitalik Buterin in the paper https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763. As in it's nature, SBTs are non-transferable ERC721s, the propsed implementation extends the widely known ERC721 contract, by overriding all methods related to transfers. Several additional functions are added for issuing and revoking SBTs, using the respective modifiers.

### Installation

```console
$ yarn
```

### Compile

```console
$ yarn compile
```

This task will compile all smart contracts in the `contracts` directory.
ABI files will be automatically exported in `artifacts` directory.

### Testing

```console
$ yarn test
```

### Code coverage

```console
$ yarn coverage
```

The report will be printed in the console and a static website containing full report will be generated in `coverage` directory.

### Code style

```console
$ yarn prettier
```

### Verify & Publish contract source code

```console
$ npx hardhat  verify --network mainnet $CONTRACT_ADDRESS $CONSTRUCTOR_ARGUMENTS
```
