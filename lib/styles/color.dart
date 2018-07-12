import 'package:flutter/material.dart';

 const List<CardColor> myCardColors = const <CardColor>[
    const CardColor(const Color(0xFFC60C30),  'red'),
    const CardColor(const Color(0xFF62361B), 'Brn'),
    const CardColor(const Color(0xFFF9461C), 'Org'),
    const CardColor(const Color(0xFF522398), 'P'),
    const CardColor(const Color(0xFF00A1DE), 'blue'),
    const CardColor(const Color(0xFF009B3A), 'G'),
    const CardColor(const Color(0xFFE27EA6), 'Pink'),
    const CardColor(const Color(0xFFF9E300), 'Y'),
    const CardColor(const Color(0xFF565A5C), 'grey'),
 ];


class CardColor {
  const CardColor(this.color, this.name);

  final Color color;
  final String name;
}

getColor(routeColor){
  for(var c in myCardColors){
    if(routeColor.toString().toLowerCase() == c.name.toString().toLowerCase()) return c.color;
  }
}