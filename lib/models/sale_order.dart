// To parse this JSON data, do
//
//     final saleOrder = saleOrderFromJson(jsonString);

import 'dart:convert';

import 'package:qg_stock_take_app/models/bank.dart';
import 'package:qg_stock_take_app/models/credit_customer.dart';
import 'package:qg_stock_take_app/models/expense_category.dart';
import 'package:qg_stock_take_app/models/nozzle.dart';
import 'package:qg_stock_take_app/models/station_product.dart';
import 'package:qg_stock_take_app/models/expense_supervisor.dart';
import 'package:qg_stock_take_app/models/station_report.dart';
import 'package:qg_stock_take_app/models/station_warehouse.dart';
import 'package:qg_stock_take_app/models/tank_group.dart';

List<SaleOrder> saleOrderFromJson(String str) =>
    List<SaleOrder>.from(json.decode(str).map((x) => SaleOrder.fromJson(x)));

String saleOrderToJson(List<SaleOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SaleOrder {
  final int? id;
  final String? name;
  final bool? wholesale;
  final bool? interTransfer;
  final bool? locationFeature;
  final bool? imageUpload;
  final double? longitude;
  final double? latitude;
  final double? radius;
  final int? compressImageQuality;
  final bool? densityTemperatureFeature;
  final String? bankPrefix;
  final List<dynamic>? nozzleMeterReset;
  final List<dynamic>? tankDipReset;
  final List<Bank>? bank;
  final List<CreditCustomer>? creditCustomer;
  final List<StationProduct>? stationProduct;
  final List<Nozzle>? nozzle;
  final List<StationWarehouse>? stationWarehouse;
  final List<ExpenseSupervisor>? expenseSupervisor;
  final List<StationReport>? stationReport;
  final List<StationExpenseCategory>? stationExpenseCategory;
  final List<TankGroup>? tankGroup;

  SaleOrder({
    this.id,
    this.name,
    this.wholesale,
    this.interTransfer,
    this.locationFeature,
    this.imageUpload,
    this.longitude,
    this.latitude,
    this.radius,
    this.compressImageQuality,
    this.densityTemperatureFeature,
    this.bankPrefix,
    this.nozzleMeterReset,
    this.tankDipReset,
    this.bank,
    this.creditCustomer,
    this.stationProduct,
    this.nozzle,
    this.stationWarehouse,
    this.expenseSupervisor,
    this.stationReport,
    this.stationExpenseCategory,
    this.tankGroup,
  });

  factory SaleOrder.fromJson(Map<String, dynamic> json) {
    // print the runtime types of all the json values
    return SaleOrder(
      id: json["id"],
      name: json["name"],
      wholesale: json["wholesale"],
      interTransfer: json["inter_transfer"],
      locationFeature: json["location_feature"],
      imageUpload: json["image_upload"],
      longitude: json["longitude"]?.toDouble(),
      latitude: json["latitude"]?.toDouble(),
      radius: json["radius"],
      compressImageQuality: json["compress_image_quality"],
      densityTemperatureFeature: json["density_temperature_feature"],
      bankPrefix: json["bank_prefix"],
      nozzleMeterReset:
          List<dynamic>.from(json["nozzle_meter_reset"].map((x) => x)),
      tankDipReset: List<dynamic>.from(json["tank_dip_reset"].map((x) => x)),
      bank: List<Bank>.from(json["bank"].map((x) => Bank.fromJson(x))),
      creditCustomer: List<CreditCustomer>.from(
          json["credit_customer"].map((x) => CreditCustomer.fromJson(x))),
      stationProduct: List<StationProduct>.from(
          json["station_product"].map((x) => StationProduct.fromJson(x))),
      nozzle: List<Nozzle>.from(json["nozzle"].map((x) => Nozzle.fromJson(x))),
      stationWarehouse: List<StationWarehouse>.from(
          json["station_warehouse"].map((x) => StationWarehouse.fromJson(x))),
      expenseSupervisor: List<ExpenseSupervisor>.from(
          json["expense_supervisor"].map((x) => ExpenseSupervisor.fromJson(x))),
      stationReport: List<StationReport>.from(
          json["station_report"].map((x) => StationReport.fromJson(x))),
      stationExpenseCategory: List<StationExpenseCategory>.from(
          json["station_expense_category"]
              .map((x) => StationExpenseCategory.fromJson(x))),
      tankGroup: List<TankGroup>.from(
          json["tank_group"].map((x) => TankGroup.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "wholesale": wholesale,
        "inter_transfer": interTransfer,
        "location_feature": locationFeature,
        "image_upload": imageUpload,
        "longitude": longitude,
        "latitude": latitude,
        "radius": radius,
        "compress_image_quality": compressImageQuality,
        "density_temperature_feature": densityTemperatureFeature,
        "bank_prefix": bankPrefix,
        "nozzle_meter_reset": nozzleMeterReset == null
            ? []
            : List<dynamic>.from(nozzleMeterReset!.map((x) => x)),
        "tank_dip_reset": tankDipReset == null
            ? []
            : List<dynamic>.from(tankDipReset!.map((x) => x)),
        "bank": bank == null
            ? []
            : List<dynamic>.from(bank!.map((x) => x.toJson())),
        "credit_customer":
            List<dynamic>.from(creditCustomer!.map((x) => x.toJson())),
        "station_product":
            List<dynamic>.from(stationProduct!.map((x) => x.toJson())),
        "nozzle": List<dynamic>.from(nozzle!.map((x) => x.toJson())),
        "station_warehouse":
            List<dynamic>.from(stationWarehouse!.map((x) => x.toJson())),
        "expense_supervisor":
            List<dynamic>.from(expenseSupervisor!.map((x) => x.toJson())),
        "station_report":
            List<dynamic>.from(stationReport!.map((x) => x.toJson())),
        "station_expense_category":
            List<dynamic>.from(stationExpenseCategory!.map((x) => x.toJson())),
        "tank_group": List<dynamic>.from(tankGroup!.map((x) => x.toJson())),
      };
}
