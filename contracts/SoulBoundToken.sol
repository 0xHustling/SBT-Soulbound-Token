// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @dev Implementation of Soul Bound Token concept, introduced by Vitalik Buterin in the paper
 * https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4105763. As in it's nature, SBTs are non-transferable
 * ERC721s, the propsed implementation extends the widely known ERC721 contract, by overriding all methods related
 * to transfers. Several additional functions are added for issuing and revoking SBTs, using the respective modifiers.
 */
contract SoulBoundToken is ERC721 {
    address public creator;
    string public baseURI;

    event MintSoulBoundToken(address to, uint256 tokenId);
    event RevokeSoulBoundToken(address revoker, uint256 tokenId);
    event RenounceSoulBoundToken(address renouncer, uint256 tokenId);

    modifier onlySBTCreator() {
        require(_msgSender() == creator, "SoulBound Token: Only SBT Creator Can Issue Tokens");
        _;
    }

    constructor(string memory name_, string memory symbol_, string memory baseURI_) ERC721(name_, symbol_) {
        creator = _msgSender();
        baseURI = baseURI_;
    }

    /**
     * @dev Mint To Soul for minting not-transferable Soul Bound Token
     * Only the contract creator can mint SBTs
     */
    function mintToSoul(address to, uint256 tokenId) public virtual onlySBTCreator {
        _mint(to, tokenId);
        emit MintSoulBoundToken(to, tokenId);
    }

    /**
     * @dev Revoke Soul Bound Token for revoking and burning the SBT
     * Only the SBT owner can revoke owned SBT
     */
    function revokeSoulBoundToken(uint256 tokenId) public virtual onlySBTCreator {
        _burn(tokenId);
        emit RevokeSoulBoundToken(_msgSender(), tokenId);
    }

    /**
     * @dev Renouncing Soul Bound Token and burning the SBT
     * Only the token owner can renounce their SBT
     */
    function renounceSoulBoundToken(uint256 tokenId) public virtual {
        require(ownerOf(tokenId) == _msgSender(), "SoulBound Token: Only owner can revoke");
        _burn(tokenId);
        emit RenounceSoulBoundToken(_msgSender(), tokenId);
    }

    /**
     * @dev Base URI for computing {tokenURI}. If set, the resulting URI for each
     * token will be the concatenation of the `baseURI` and the `tokenId`. Empty
     * by default, can be overriden in child contracts.
     */
    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    /**
     * @dev Override with empty implementation,  as SBTs are not transferable
     */
    function approve(address to, uint256 tokenId) public override {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation,  as SBTs are not transferable
     */
    function getApproved(uint256 tokenId) public view override returns (address) {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation,  as SBTs are not transferable
     */
    function setApprovalForAll(address operator, bool approved) public override {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation,  as SBTs are not transferable
     */
    function isApprovedForAll(address owner, address operator) public view override returns (bool) {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation, as SBTs are not transferable
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) public override {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation,  as SBTs are not transferable
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override {
        revert("SoulBound Token: Operation not supported");
    }

    /**
     * @dev Override with empty implementation, as SBTs are not transferable
     */
    function transferFrom(address from, address to, uint256 tokenId) public override {
        revert("SoulBound Token: Operation not supported");
    }
}
