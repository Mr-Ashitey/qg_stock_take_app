// To parse this JSON data, do
//
//     final lastClosingMeter = lastClosingMeterFromJson(jsonString);

import 'dart:convert';

List<LastClosingMeter> lastClosingMeterFromJson(String str) =>
    List<LastClosingMeter>.from(
        json.decode(str).map((x) => LastClosingMeter.fromJson(x)));

String lastClosingMeterToJson(List<LastClosingMeter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LastClosingMeter {
  double? closingMeter;
  int? nozzleId;
  int? productId;

  LastClosingMeter({
    this.closingMeter,
    this.nozzleId,
    this.productId,
  });

  factory LastClosingMeter.fromJson(Map<String, dynamic> json) =>
      LastClosingMeter(
        closingMeter: json["closing_meter"]?.toDouble(),
        nozzleId: json["nozzle_id"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "closing_meter": closingMeter,
        "nozzle_id": nozzleId,
        "product_id": productId,
      };
}
