
 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// ข้อ 1 ระบบบันทึกคะแนนนักศึกษา
contract StudentScoreTracker {

    struct Student {
        string name;
        uint256 score;
    }

    mapping(address => Student) public students;

    function setStudentScore(
        string memory _name,
        uint256 _score
    ) public {
        students[msg.sender] = Student(_name, _score);
    }

    function getStudent(address _studentAddress)
        public
        view
        returns (string memory, uint256)
    {
        Student memory s = students[_studentAddress];
        return (s.name, s.score);
    }
}

// ข้อ 2 ระบบเก็บข้อมูลสินค้า
contract ProductStore {

    struct Product {
        string name;
        uint256 price;
        uint256 stock;
    }

    mapping(uint256 => Product) public products;

    function addProduct(
        uint256 _productId,
        string memory _name,
        uint256 _price,
        uint256 _stock
    ) public {
        products[_productId] = Product(_name, _price, _stock);
    }

    function getProduct(uint256 _productId)
        public
        view
        returns (string memory, uint256, uint256)
    {
        Product memory p = products[_productId];
        return (p.name, p.price, p.stock);
    }
}

// ข้อ 3 ระบบขายตั๋วคอนเสิร์ต
contract ConcertTicketSystem {

    struct Ticket {
        string concertName;
        uint256 price;
        bool isPurchased;
    }

    mapping(address => Ticket) public tickets;

    function buyTicket(
        string memory _concertName,
        uint256 _price
    ) public {
        tickets[msg.sender] = Ticket(
            _concertName,
            _price,
            true
        );
    }

    function checkTicket(address _user)
        public
        view
        returns (string memory, uint256, bool)
    {
        Ticket memory t = tickets[_user];
        return (t.concertName, t.price, t.isPurchased);
    }
}
