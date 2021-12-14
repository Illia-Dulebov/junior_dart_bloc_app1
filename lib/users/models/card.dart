enum PaySystem{
  visa,
  masterCard
} 

class Card {
  String number;
  String owner;
  PaySystem paySystem;

  Card({required this.number, required this.owner, required this.paySystem,});
  
}