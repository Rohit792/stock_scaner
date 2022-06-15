import 'package:flutter/material.dart';

@immutable
class BaseDropdown {
  final int? id;
  final String? name;
  final String? key;

  const BaseDropdown(this.id, this.name, this.key);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    var otherDD = other as BaseDropdown;
    return id == otherDD.id;
  }
}
