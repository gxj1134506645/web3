// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//points[_user] 是标准语法，而 points(_user) 仅在特定场景（调用 public 映射的 getter）下合法
contract PointsSystem {
    mapping(address => uint256) public points;
    address[] public users;

    function addUser(address _user) public {
        require(points[_user] == 0, "User already exists.");
        users.push(_user);
        points[_user] = 100; // 初始化用户积分为100
    }

    function transferPoints(address _to, uint256 _amount) public {
        require(points[msg.sender] >= _amount, "Insufficient points.");
        points[msg.sender] -= _amount;
        points[_to] += _amount;
    }

    function getAllUsers() public view returns (address[] memory) {
        return users;
    }
}
