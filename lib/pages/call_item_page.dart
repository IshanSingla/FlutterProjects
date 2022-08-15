import 'package:flutter/material.dart';
class CallItemModel {
  final String name;
  final String time;
  final String avatarUrl;
  final Color colorItem;
  CallItemModel({required this.name, required this.time, required this.avatarUrl, required this.colorItem});
}

List<CallItemModel> callItemData = [
  CallItemModel(
      name: "Yashika Sharma",
      time: "April 12, 12:30 AM",
      avatarUrl:
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fengineering.unl.edu%2Fimages%2Fstaff%2FKayla-Person.jpg&f=1&nofb=1",
      colorItem: Colors.red),
  CallItemModel(
      name: "Yajat Kumar",
      time: "March 12, 5:30 AM",
      avatarUrl:
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg.huffingtonpost.com%2Fasset%2F5bf5138f2000009f0602952c.jpeg%3Fcache%3Drlokchwj6u%26ops%3D1910_1000&f=1&nofb=1",
      colorItem: Colors.green),
  CallItemModel(
      name: "Vatsal Singh",
      time: "March 10, 1:30 PM",
      avatarUrl:
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Firec4u.com%2Fblog%2Fwp-content%2Fuploads%2F2020%2F09%2Fconfident-person.jpeg&f=1&nofb=1",
      colorItem: Colors.red),
  CallItemModel(
      name: "Yaadwinder",
      time: "March 8, 8:30 PM",
      avatarUrl:
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.8Xj9CyAn1wTXOq-hlelEyQHaFm%26pid%3DApi&f=1",
      colorItem: Colors.green),

  CallItemModel(
      name: "Vrinda Sharma",
      time: "February 28, 4:30 PM",
      avatarUrl:
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.powerofpositivity.com%2Fwp-content%2Fuploads%2F2020%2F01%2F10-Signs-Your-Child-May-Be-A-Highly-Sensitive-Person1-1600x900.jpg&f=1&nofb=1",
      colorItem: Colors.green),
];
