// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionSelectorExample {
    // 状态变量，用于存储函数选择器
    bytes4 public storedSelector;

    // 函数：计算输入值的平方
    function square(uint256 x) public pure returns (uint256) {
        return x * x;
    }

    // 函数：计算输入值的两倍
    function double(uint256 x) public pure returns (uint256) {
        return 2 * x;
    }

    // 函数：根据传入的选择器动态调用 square 或 double 函数
    function executeFunction(bytes4 selector, uint256 x)
        public
        returns (uint256)
    {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(selector, x)
        );
        require(success, "Function call failed");
        return abi.decode(data, (uint256));
    }

    // 函数：存储选择器到状态变量 storedSelector 中
    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }

    // 函数：调用存储在 storedSelector 中的函数，并返回结果
    function executeStoredFunction(uint256 x) public returns (uint256) {
        require(storedSelector != bytes4(0), "Selector not set");
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(storedSelector, x)
        );
        require(success, "Function call failed");
        return abi.decode(data, (uint256));
    }

    //获取函数选择器
    function getSquareSelector() external pure returns (bytes4) {
        bytes4 fucSelector = this.square.selector;
        return fucSelector; // 返回函数a的选择器
    }
}
