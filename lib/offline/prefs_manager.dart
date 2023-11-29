import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static final PrefsManager _instance = PrefsManager.internal();

  factory PrefsManager() => _instance;

  static SharedPreferences? _prefs;

  PrefsManager.internal();

  static const String PREF_NAME = "PREF_NAME";
  static const String IS_LOGIN = "IS_LOGIN";
  static const String IS_FIRST_LOGIN = "IS_FIRST_LOGIN";
  static const String UID = "UID";
  static const String URL = "url";
  static const String STATION_ID = "station_id";
  static const String NAME = "name";
  static const String SUPPORT_NUMBER = "SUPPORT_NUMBER";
  static const String TOKEN = "TOKEN";
  static const String STATION_NAME = "STATION_NAME";
  static const String STATION_CODE = "STATION_CODE";
  static const String PHONE = "PHONE";
  static const String SALE_ERROR = "SALE_ERROR";
  static const String THEME = "THEME";
  static const String CREATED_TIME = "CREATED_TIME";
  static const String HAS_WHOLESALE = "HAS_WHOLESALE";
  static const String HAS_TRANSFER = "HAS_TRANSFER";
  static const String LATITUDE = "LATITUDE";
  static const String LONGITUDE = "LONGITUDE";
  static const String ICON = "ICON";
  static const String LOCATION_FEATURE = "LOCATION_FEATURE";
  static const String RADIUS = "RADIUS";
  static const String DOWNLOAD_LINK = "DOWNLOAD_LINK";
  static const String STATION_LATITUDE = "STATION_LATITUDE";
  static const String STATION_LONGITUDE = "STATION_LONGITUDE";
  static const String CURRENT_VERSION = "CURRENT_VERSION";
  static const String UPLOAD_URL = "UPLOAD_URL";
  static const String UPLOAD_IMAGE = "UPLOAD_IMAGE";
  static const String IMAGE_QUALITY = "IMAGE_QUALITY";
  static const String DEPOSIT_REF = "DEPOSIT_REF";
  static const String DENSITY_TEMPERATURE_FEATURE =
      "DENSITY_TEMPERATURE_FEATURE";
  static const String DENSITY_TEMPERATURE_REPORT_ID =
      "DENSITY_TEMPERATURE_REPORT_ID";
  static const String DENSITY_TEMPERATURE_REPORT_DATE =
      "DENSITY_TEMPERATURE_REPORT_DATE";
  static const String SUBMITTED_SIGNED_DOCUMENT = "SUBMITTED_SIGNED_DOCUMENT";
  static const String SIGNED_DOCUMENT_PICTURE = "SIGNED_DOCUMENT_PICTURE";

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  bool isLoggedIn() {
    return _prefs?.getBool(IS_LOGIN) ?? false;
  }

  String getName() {
    return _prefs?.getString(NAME) ?? "";
  }

  Future<void> setName(String status) async {
    await _prefs?.setString(NAME, status);
  }

  int getUid() {
    return _prefs?.getInt(UID) ?? 0;
  }

  Future<void> setUid(int uid) async {
    await _prefs?.setInt(UID, uid);
  }

  int getStationId() {
    return _prefs?.getInt(STATION_ID) ?? 0;
  }

  Future<void> setStationId(int stationId) async {
    await _prefs?.setInt(STATION_ID, stationId);
  }

  String getSupportNumber() {
    return _prefs?.getString(SUPPORT_NUMBER) ?? "";
  }

  Future<void> setSupportNumber(String supportNumber) async {
    await _prefs?.setString(SUPPORT_NUMBER, supportNumber);
  }

  String getUrl() {
    return "Constants.APP_URL"; // Replace with the actual value of Constants.APP_URL
  }

  Future<void> setUrl(String url) async {
    await _prefs?.setString(URL, url);
  }

  String getToken() {
    return _prefs?.getString(TOKEN) ?? "";
  }

  Future<void> setToken(String token) async {
    await _prefs?.setString(TOKEN, token);
  }

  String getStationName() {
    return _prefs?.getString(STATION_NAME) ?? "";
  }

  Future<void> setStationName(String token) async {
    await _prefs?.setString(STATION_NAME, token);
  }

  String getStationCode() {
    return _prefs?.getString(STATION_CODE) ?? "";
  }

  Future<void> setStationCode(String token) async {
    await _prefs?.setString(STATION_CODE, token);
  }

  String getPhone() {
    return _prefs?.getString(PHONE) ?? "";
  }

  Future<void> setPhone(String token) async {
    await _prefs?.setString(PHONE, token);
  }

  String getSaleError() {
    return _prefs?.getString(SALE_ERROR) ?? "";
  }

  Future<void> setSaleError(String token) async {
    await _prefs?.setString(SALE_ERROR, token);
  }

  int getIcon() {
    return _prefs?.getInt(ICON) ?? 0;
  }

  Future<void> setIcon(int icon) async {
    await _prefs?.setInt(ICON, icon);
  }

  String getRadius() {
    return _prefs?.getString(RADIUS) ?? "";
  }

  Future<void> setRadius(String radius) async {
    await _prefs?.setString(RADIUS, radius);
  }

  String getStationLatitude() {
    return _prefs?.getString(STATION_LATITUDE) ?? "";
  }

  Future<void> setStationLatitude(String latitude) async {
    await _prefs?.setString(STATION_LATITUDE, latitude);
  }

  String getDownloadLink() {
    return _prefs?.getString(DOWNLOAD_LINK) ?? "";
  }

  Future<void> setDownloadLink(String downloadLink) async {
    await _prefs?.setString(DOWNLOAD_LINK, downloadLink);
  }

  String getStationLongitude() {
    return _prefs?.getString(STATION_LONGITUDE) ?? "";
  }

  Future<void> setStationLongitude(String longitude) async {
    await _prefs?.setString(STATION_LONGITUDE, longitude);
  }

  String getCurrentVersion() {
    return _prefs?.getString(CURRENT_VERSION) ?? "";
  }

  Future<void> setCurrentVersion(String currentVersion) async {
    await _prefs?.setString(CURRENT_VERSION, currentVersion);
  }

  String getUploadUrl() {
    return _prefs?.getString(UPLOAD_URL) ?? "";
  }

  Future<void> setUploadUrl(String uploadUrl) async {
    await _prefs?.setString(UPLOAD_URL, uploadUrl);
  }

  int getCompressImageQuality() {
    return _prefs?.getInt(IMAGE_QUALITY) ?? 75;
  }

  Future<void> setCompressImageQuality(int compressImageQuality) async {
    await _prefs?.setInt(IMAGE_QUALITY, compressImageQuality);
  }

  String getDepositRef() {
    return _prefs?.getString(DEPOSIT_REF) ?? "";
  }

  Future<void> setDepositRef(String depositRef) async {
    await _prefs?.setString(DEPOSIT_REF, depositRef);
  }

  String getDensityTemperatureReportId() {
    return _prefs?.getString(DENSITY_TEMPERATURE_REPORT_ID) ?? "";
  }

  Future<void> setDensityTemperatureReportId(String id) async {
    await _prefs?.setString(DENSITY_TEMPERATURE_REPORT_ID, id);
  }

  String getDensityTemperatureReportDate() {
    return _prefs?.getString(DENSITY_TEMPERATURE_REPORT_DATE) ?? "";
  }

  Future<void> setDensityTemperatureReportDate(String date) async {
    await _prefs?.setString(DENSITY_TEMPERATURE_REPORT_DATE, date);
  }

  bool getDensityTemperatureFeature() {
    return _prefs?.getBool(DENSITY_TEMPERATURE_FEATURE) ?? false;
  }

  Future<void> setDensityTemperatureFeature(
      bool densityTemperatureFeature) async {
    await _prefs?.setBool(
        DENSITY_TEMPERATURE_FEATURE, densityTemperatureFeature);
  }

  bool getHasSubmittedSignedDocument() {
    return _prefs?.getBool(SUBMITTED_SIGNED_DOCUMENT) ?? false;
  }

  Future<void> clearPrefs() async {
    await _prefs?.clear();
  }

  // OWN CUSTOM PREFS
}
