import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "car_rental"       : Icons.car_rental,
  "food_bank_outlined"       : Icons.food_bank_outlined,
  "lightbulb"       : Icons.lightbulb,
  "clean_hands"       : Icons.clean_hands,
  "cloud_queue"       : Icons.cloud_queue,
  "add_shopping_cart_sharp"       : Icons.add_shopping_cart_sharp,
  "airplanemode_active_rounded"       : Icons.airplanemode_active_rounded,
  "bolt"       : Icons.bolt,
  "call_end_rounded"       : Icons.call_end_rounded,
  "house_sharp"       : Icons.house_sharp,
  "wine_bar"       : Icons.wine_bar,
  "wc"       : Icons.wc,
  "volunteer_activism"       : Icons.volunteer_activism,
  "videocam"       : Icons.videocam,
  "cake_rounded"       : Icons.cake_rounded,
  "face_retouching_natural"       : Icons.face_retouching_natural,
  "build_sharp"       : Icons.build_sharp,
  "bus_alert"       : Icons.bus_alert,
  "add_a_photo_rounded"       : Icons.add_a_photo_rounded,
  "add_call"       : Icons.add_call,
};

final _iconsTostrings = <IconData, String>{
  Icons.car_rental: "car_rental",
  Icons.food_bank_outlined: "food_bank_outlined",
  Icons.lightbulb: "lightbulb",
  Icons.clean_hands: "clean_hands",
  Icons.cloud_queue: "cloud_queue",
  Icons.add_shopping_cart_sharp: "add_shopping_cart_sharp",
  Icons.airplanemode_active_rounded: "airplanemode_active_rounded",
  Icons.bolt: "bolt",
  Icons.call_end_rounded: "call_end_rounded",
  Icons.house_sharp: "house_sharp",
  Icons.wine_bar: "wine_bar",
  Icons.wc: "wc",
  Icons.volunteer_activism: "volunteer_activism",
  Icons.videocam: "videocam",
  Icons.cake_rounded: "cake_rounded",
  Icons.face_retouching_natural: "face_retouching_natural",
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
