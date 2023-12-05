import 'package:qg_stock_take_app/models/models_export.dart';
import 'package:qg_stock_take_app/models/nozzle_closing_meter.dart';

class JsonUtil {
  static List<NozzleClosingMeterPair> nozzleClosingMeterPair(
      List<Nozzle> nozzles,
      List<LastClosingMeter> lastClosingMeter,
      List<TankGroup> tankGroup) {
    List<NozzleClosingMeterPair> nozzleClosingMeterPairs = [];
    for (var nozzle in nozzles) {
      for (var lastClosingMeterItem in lastClosingMeter) {
        if (nozzle.id == lastClosingMeterItem.nozzleId) {
          NozzleClosingMeterPair nozzleClosingMeterPair =
              NozzleClosingMeterPair(
            nozzleId: nozzle.id,
            nozzleName: nozzle.name,
            nozzleProdId: nozzle.productId,
            nozzleActiveState: nozzle.activeState,
            nozzleTankGroupId: nozzle.tankGroupId,
            closingMeter: lastClosingMeterItem.closingMeter,
          );
          nozzleClosingMeterPairs.add(nozzleClosingMeterPair);
        }
      }
    }

    for (var element in nozzleClosingMeterPairs) {
      for (var tankGroupItem in tankGroup) {
        if (element.nozzleTankGroupId == tankGroupItem.id) {
          element.nozzleTankGroupName = tankGroupItem.name;
        }
      }
    }

    return nozzleClosingMeterPairs;
  }

  // static void getExpenseCategories(Map<String, dynamic> json) {
  //   ArrayList generalModels = ArrayList();
  //   int length = json.length();
  //   for (int i = 0; i < length; i++) {
  //     JSONObject c = json.getJSONObject(i).getJSONObject("expense_category");
  //     GeneralModel generalModel = GeneralModel();
  //     generalModel.setId(c.getInt("id"));
  //     generalModel.setName(c.getString(DatabaseInfo.DatabaseVariables.NAME));
  //     generalModels.add(generalModel);
  //   }
  //   DatabaseOperations dbo = DatabaseOperations(context);
  //   dbo.setExpenseTypes(dbo, generalModels);
  // }

  // static void getStationDetails(Map<String, dynamic> json) {
  //   // int length = json.length;
  //   // List<CustomerModel> customers = [];
  //   // List<NozzleModel> nozzles = [];
  //   List<ProductModel> products = [];
  //   List<TankGroupModel> tankGroups = [];
  //   List<GeneralModel> expenseSupervisors = [];

  //   PrefsManager prefsManager = PrefsManager();
  //   // DatabaseOperations dbo = DatabaseOperations(context);

  //   String stationName = json['name'];
  //   prefsManager.setStationName(stationName);
  //   prefsManager.setTransfer(json['inter_transfer']);
  //   prefsManager.setHasWholesale(json['wholesale']);
  //   prefsManager.sethasLocationFeature(json["location_feature"]);
  //   prefsManager.setUploadImage(json["image_upload"]);
  //   prefsManager
  //       .setDensityTemperatureFeature(json["density_temperature_feature"]);
  //   prefsManager.setDepositRef(json['bank_prefix']);
  //   prefsManager.setCompressImageQuality(json["compress_image_quality"]);
  //   if (prefsManager.hasLocationFeature()) {
  //     prefsManager.setStationLongitude(json["longitude"]);
  //     prefsManager.setStationLatitude(json["latitude"]);
  //     prefsManager.setRadius(json["radius"]);
  //   }

  //   // TANK GROUPS
  //   List<dynamic> tankGroupArray = json['tank_group'];

  //   for (int tg = 0; tg < tankGroupArray.length; tg++) {
  //     Map<String, dynamic> tankGroupObject = tankGroupArray[tg];
  //     TankGroupModel tankGroup = TankGroupModel(
  //       id: tankGroupObject['id'],
  //       productId: tankGroupObject['product_id'],
  //       name: tankGroupObject['name'],
  //     );

  //     List<TankModel> tanks = [];
  //     List<dynamic> tankArray = tankGroupObject['tank'];
  //     for (int tnk = 0; tnk < tankArray.length; tnk++) {
  //       Map<String, dynamic> tankObject = tankArray[tnk];
  //       TankModel tank = TankModel(
  //         tankGroupId: tankGroup.id,
  //         id: tankObject['id'],
  //         name: tankObject['name'],
  //       );

  //       if (tankObject['active_state']) {
  //         tanks.add(tank);
  //       }
  //     }

  //     tankGroup.setTanks(tanks);
  //     tankGroups.add(tankGroup);
  //   }

  //   DatabaseOperations().setTankGroups(tankGroups);

  //   // STATION PRODUCT
  //   List<dynamic> productArray = json["station_product"];
  //   for (int prod = 0; prod < productArray.length; prod++) {
  //     Map<String, dynamic> productObject = productArray[prod];
  //     ProductModel product = ProductModel(
  //       productId: productObject['product_id']['product_id'],
  //       name: productObject['product_id']['name'],
  //       stationId: prefsManager.getStationId(),
  //       noOfPumps: 0,
  //     );

  //     products.add(product);
  //   }
  //   DatabaseOperations().setProducts(products);

  //   // EXPENSE SUPERVISOR
  //   List<dynamic> expenseSupervisorArray = json["expense_supervisor"];
  //   for (int exp = 0; exp < expenseSupervisorArray.length; exp++) {
  //     Map<String, dynamic> expenseSupervisorObject =
  //         expenseSupervisorArray[exp];
  //     GeneralModel expense = GeneralModel(
  //       id: expenseSupervisorObject['id'],
  //       name: expenseSupervisorObject['name'],
  //     );

  //     if (expenseSupervisorObject['active_state']) {
  //       expenseSupervisors.add(expense);
  //     }
  //   }

  //   // Additional processing...
  // }

  // ProductModel createProduct(ProductModel product) {
  //   product.noOfPumps = Constants.damsa;
  //   product.name = "${"DAMSA(${product.name}"})";
  //   return product;
  // }
}
