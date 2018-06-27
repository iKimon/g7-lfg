import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'gruppen.g.dart';


@JsonSerializable()

class Gruppen extends Object with _$GruppenSerializerMixin{

  Gruppen(this.name, this.member,);

  String name;
  String member;
  String passwort;

  factory Gruppen.fromJson(Map<String,dynamic> json)=> _$GruppenFromJson(json);
 // @JsonKey(name: 'registration_date_millis')
  //final int registrationDateMillis;


}

