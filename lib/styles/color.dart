import 'package:flutter/material.dart';

 const List<CardColor> myCardColors = const <CardColor>[
    const CardColor(const Color(0xFF565A5C), 'grey'), //good
    const CardColor(const Color(0xFFC6C30),  'red'), //good
    const CardColor(const Color(0xFF00A1DE), 'blue'), //good
    const CardColor(const Color(0xFF62361B), 'Brn'), //good
    const CardColor(const Color(0xFF009B3A), 'G'), //good
    const CardColor(const Color(0xFFF9461C), 'Org'), //Good
    const CardColor(const Color(0xFF522398), 'P'), //good
    const CardColor(const Color(0xFFE27EA6), 'Pink'), //good
    const CardColor(const Color(0xFFF9E300), 'Y'),
 ];


class CardColor {
  const CardColor(this.color, this.name);

  final Color color;
  final String name;
}