import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "car_rental": Icons.car_rental,
  "electric_rickshaw": Icons.electric_rickshaw,
  "lightbulb": Icons.lightbulb,
  "cloud_queue": Icons.cloud_queue,
  "electric_bike": Icons.electric_bike,
  "electric_scooter": Icons.electric_scooter,
  "airplanemode_active_rounded": Icons.airplanemode_active_rounded,
  "electrical_services_sharp": Icons.electrical_services_sharp,
  "tv_outlined": Icons.tv_outlined,
  "house_sharp": Icons.house_sharp,
  "access_alarm": Icons.access_alarm,
  "local_play": Icons.local_play,
  "radio": Icons.radio,
  "videocam": Icons.videocam,
  "cell_wifi": Icons.cell_wifi,
  "door_front": Icons.door_front,
  "build_sharp": Icons.build_sharp,
  "bus_alert": Icons.bus_alert,
  "add_a_photo_rounded": Icons.add_a_photo_rounded,
  "add_call": Icons.add_call,
};

final _iconsTostrings = <IconData, String>{
  Icons.car_rental: "car_rental",
  Icons.electric_rickshaw: "electric_rickshaw",
  Icons.lightbulb: "lightbulb",
  Icons.cloud_queue: "cloud_queue",
  Icons.electric_bike: "electric_bike",
  Icons.electric_scooter: "electric_scooter",
  Icons.airplanemode_active_rounded: "airplanemode_active_rounded",
  Icons.electrical_services_sharp: "electrical_services_sharp",
  Icons.tv_outlined: "tv_outlined",
  Icons.house_sharp: "house_sharp",
  Icons.access_alarm: "access_alarm",
  Icons.local_play: "local_play",
  Icons.radio: "radio",
  Icons.videocam: "videocam",
  Icons.cell_wifi: "cell_wifi",
  Icons.door_front: "door_front",
  Icons.build_sharp: "build_sharp",
  Icons.bus_alert: "bus_alert",
  Icons.add_a_photo_rounded: "add_a_photo_rounded",
  Icons.add_call: "add_call",
};

IconData? getIcon(String nombreIcono) {
  return _icons[nombreIcono];
}

String? getIconToString(IconData icon) {
  return _iconsTostrings[icon];
}
