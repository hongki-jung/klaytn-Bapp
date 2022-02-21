
pragma solidity 0.4.24;


contract AddtionGame {

    address public owner;

    constructor() public {
        owner = msg.sender; // 현재 이 컨트렉트를 호출하고 있는 사람 , 배포에 쓰이는 계정
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
    
    function deposit() public payable {
        require(msg.sender == owner); // 유효성 체크
    }


    function transfer(uint _value) public returns (bool){
        require(getBalance() >= _value);
        msg.sender.transfer(_value);
        return true;
    }
}