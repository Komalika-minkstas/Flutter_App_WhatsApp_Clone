import 'package:flutter/material.dart';

class ChatModel{
  String? name;
  bool? isGroup;
  String? time;
  String? message;
  String? status;
  bool select = false;
  int? id;
  String? avatarUrl;

  ChatModel({this.name, this.isGroup, this.status, this.message, this.time,this.select = false,
    this.id,this.avatarUrl});
}
