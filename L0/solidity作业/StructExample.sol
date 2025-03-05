// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructExample {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 stock;
    }
    mapping(uint256 => Product) public products;
    uint256 public productCount;

    //字符串是数组，引用类型，需指定存储位置，这里用memory，可能因为是参数传递。但可能用户需要更详细的解释，比如为什么用memory而不是storage，但原问题中的代码是参数声明，所以memory是正确的
    function addProduct(
        string memory _name,
        uint256 _price,
        uint256 _stock
    ) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _price, _stock);
    }

    function updateProductStock(uint256 _productId, uint256 _newStock) public {
        Product storage product = products[_productId];
        product.stock = _newStock;
    }

    function getProduct(uint256 _productId)
        public
        view
        returns (
            string memory,
            uint256,
            uint256
        )
    {
        Product storage product = products[_productId];
        return (product.name, product.price, product.stock);
    }
}
