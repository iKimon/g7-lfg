// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gruppen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gruppen _$GruppenFromJson(Map<String, dynamic> json) =>
    new Gruppen(json['name'] as String, json['member'] as String)
      ..passwort = json['passwort'] as String;

abstract class _$GruppenSerializerMixin {
  String get name;
  String get member;
  String get passwort;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'name': name, 'member': member, 'passwort': passwort};
}
