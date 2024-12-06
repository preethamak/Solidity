// SPDX-License-Identifier: MIT

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
pragma solidity ^0.8.0;

 
 //able to get funds from the user
//able to withdraw that funds that user sent
//set the minimum funding USD

/*interface AggregatorV3Interface{
    function decimals() external view returns(uint8);

    function description() external view returns(string memory);

    function version() external view returns(uint256);

    function getRoundData(uint80 _roundId)
    external 
    view 
    returns(
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    
    );

    function latestRoundData()
    external 
    view 
    returns(
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );
}
*/
contract fundme{

   
    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping(address funders => uint256 amtfunded) public addressToAmtFunded;
    //allow users to send the money. so it should payable
    //also the minimum amount that can be sent
    function fund() public payable {
        require(getconversionRate(msg.value)>=minimumUsd, "not enough");   
           // 0.00001ETH is minimum you can donate
        funders.push(msg.sender);
        addressToAmtFunded[msg.sender] = addressToAmtFunded[msg.sender]+msg.value;
    }
    //allow the script writer to withdraw the money
    //function withdraw(){}
    function getPrice() internal view returns(uint256){
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = pricefeed.latestRoundData();
        return uint256(price*1e10);
    }

    function getconversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();

        uint ethamountinusd = (ethPrice*ethAmount)/1e18;
        return ethamountinusd;
    }

    function getVersion() internal view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
  
}
//1 ETH = 3,590.141268000000000000