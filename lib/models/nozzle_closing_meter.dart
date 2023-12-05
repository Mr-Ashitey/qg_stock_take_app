class NozzleClosingMeterPair {
  final int? nozzleId;
  final String? nozzleName;
  final int? nozzleProdId;
  final bool? nozzleActiveState;
  final int? nozzleTankGroupId;
  String? nozzleTankGroupName;
  final double? closingMeter;

  NozzleClosingMeterPair({
    this.nozzleId,
    this.closingMeter,
    this.nozzleName,
    this.nozzleProdId,
    this.nozzleActiveState,
    this.nozzleTankGroupId,
    this.nozzleTankGroupName,
  });

  factory NozzleClosingMeterPair.fromJson(Map<String, dynamic> json) {
    return NozzleClosingMeterPair(
      nozzleId: json['nozzle_id'],
      nozzleName: json['nozzle_name'],
      nozzleProdId: json['nozzle_prod_id'],
      nozzleActiveState: json['nozzle_active_state'],
      nozzleTankGroupId: json['nozzle_tank_group_id'],
      nozzleTankGroupName: json['nozzle_tank_group_name'],
      closingMeter: json['closing_meter'],
    );
  }

  Map<String, dynamic> toJson() => {
        'nozzle_id': nozzleId,
        'closing_meter': closingMeter,
      };
}
