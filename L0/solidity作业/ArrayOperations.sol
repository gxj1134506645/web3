contract ArrayOperations {
    uint256[] public dynamicArray;

    function addElement(uint256 _element) public {
        dynamicArray.push(_element); // 向数组添加元素
    }

    function removeLastElement() public {
        dynamicArray.pop(); // 删除数组最后一个元素
    }

    function getLength() public view returns (uint256) {
        return dynamicArray.length; // 获取数组长度
    }
}
