String createProductTableQuery =
    "CREATE TABLE IF NOT EXISTS product(name TEXT,station_id INTEGER,product_id INTEGER,no_of_pumps INTEGER);";
String createSaleOrderTableQuery =
    "CREATE TABLE IF NOT EXISTS sale_order(id TEXT PRIMARY KEY,opening_meter REAL,closing_meter REAL,rtt REAL,product_id INTEGER,rtt_authorizer TEXT,meter_sale REAL,comment TEXT,string_date TEXT,pump_pic TEXT,time_taken TEXT,pump_id INTEGER,report_id INTEGER,date LONG,is_valid INTEGER,is_submitted INTEGER);";
String createDamsaTableQuery =
    "CREATE TABLE IF NOT EXISTS damsa(product_id INTEGER,tank_id INTEGER,opening_dip REAL,water_level REAL,new_discharge REAL,closing_dip REAL,date LONG,is_submitted INTEGER,string_date TEXT,report_id INTEGER);";
String createDischargeTableQuery =
    "CREATE TABLE IF NOT EXISTS discharge(id INTEGER PRIMARY KEY,product_id INTEGER,overage REAL,pump_price REAL,invoice_number TEXT,type TEXT,truck_number TEXT,delivery_shortage REAL,date TEXT,temperature REAL,density REAL,invoice_pic TEXT,seal_pic TEXT,new_discharge REAL);";
String createGoodsInTransitTableQuery =
    "CREATE TABLE IF NOT EXISTS table_goods_in_transit(id INTEGER PRIMARY KEY AUTOINCREMENT,product_id INTEGER,pump_price REAL,invoice_number TEXT,type TEXT,truck_number TEXT,date TEXT,invoice_pic TEXT,new_discharge REAL);";
String createCreditSaleTableQuery =
    "CREATE TABLE IF NOT EXISTS credit_sale(id TEXT PRIMARY KEY,tank_id INTEGER,name TEXT,is_submitted INTEGER,type INTEGER,amount REAL,quantity REAL,date LONG,string_date TEXT,customer_id INTEGER,report_id INTEGER,product_id INTEGER);";
String createCustomerTableQuery =
    "CREATE TABLE IF NOT EXISTS customer(customer_name TEXT,customer_id INTEGER);";
String createPumpTableQuery =
    "CREATE TABLE IF NOT EXISTS table_pump(id INTEGER,state INTEGER,tank_group_id INTEGER,name TEXT,product_id INTEGER);";
String createBankTransactionTableQuery =
    "CREATE TABLE IF NOT EXISTS table_bank_transaction(id TEXT PRIMARY KEY,bank_id INTEGER,type INTEGER,deposited_by TEXT,check_bank TEXT,check_number INTEGER,is_submitted INTEGER,date TEXT,transaction_ref TEXT,amount REAL);";
String createExpenseTableQuery =
    "CREATE TABLE IF NOT EXISTS table_expense(id TEXT PRIMARY KEY,supervisor_id INTEGER,is_submitted INTEGER,expense_type_id INTEGER,date TEXT,name TEXT,amount REAL);";
String createBankTableQuery =
    "CREATE TABLE IF NOT EXISTS table_bank(id INTEGER PRIMARY KEY,name TEXT);";
String createAuthorizedByTableQuery =
    "CREATE TABLE IF NOT EXISTS table_authorized_by(id INTEGER PRIMARY KEY,name TEXT);";
String createExpenseReasonsTableQuery =
    "CREATE TABLE IF NOT EXISTS table_expense_reasons(id INTEGER PRIMARY KEY,name TEXT);";
String createWarehouseTableQuery =
    "CREATE TABLE IF NOT EXISTS table_warehouse(id INTEGER PRIMARY KEY,name TEXT);";
String createMasterReportTableQuery =
    "CREATE TABLE IF NOT EXISTS table_master_report(id INTEGER PRIMARY KEY,date TEXT);";
String createTransferTableQuery =
    "CREATE TABLE IF NOT EXISTS transfer(product_id INTEGER,type INTEGER,id TEXT,invoice_number TEXT,quantity TEXT,date TEXT,is_submitted INTEGER,tank_id INTEGER,unit_price REAL,destination TEXT,transporter TEXT,vehicle_number TEXT);";
String createTankGroupTableQuery =
    "CREATE TABLE IF NOT EXISTS table_tank_group(id INTEGER,product_id INTEGER,name TEXT);";
String createTankTableQuery =
    "CREATE TABLE IF NOT EXISTS table_tank(id INTEGER,tank_group_id INTEGER,name TEXT);";
String createTankDischargeTableQuery =
    "CREATE TABLE IF NOT EXISTS table_tank_discharge(discharge_id INTEGER,tank_id INTEGER,quantity REAL);";
String createImageTableQuery =
    "CREATE TABLE IF NOT EXISTS table_image(image TEXT,pump_id INTEGER,time_taken TEXT,date TEXT);";
String createNozzleResetTableQuery =
    "CREATE TABLE IF NOT EXISTS table_nozzle_reset(product_id INTEGER,pump_id INTEGER,opening_meter REAL,date TEXT);";
String createTankResetTableQuery =
    "CREATE TABLE IF NOT EXISTS table_tank_reset(product_id INTEGER,tank_id INTEGER,opening_dip REAL,date TEXT);";
String createDensityTemperatureTableQuery =
    "CREATE TABLE IF NOT EXISTS table_density_temperature(date TEXT,period TEXT,temperature REAL,dip REAL,tank_id INTEGER,density REAL);";
String createRttTableQuery =
    "CREATE TABLE IF NOT EXISTS table_rtt(id TEXT PRIMARY KEY,authorized_by TEXT,quantity REAL,product_id INTEGER);";
String createStockLossTableQuery =
    "CREATE TABLE IF NOT EXISTS table_stock_loss(id TEXT PRIMARY KEY,dehydrated_closing_dips REAL,meter_sales REAL,date TEXT,inventory_at_date_liters REAL,inventory_valuation_liters REAL,inventory_at_date_ghc REAL,inventory_valuation_ghc REAL,is_submitted INTEGER,tank_id INTEGER);";
String createCashCountTableQuery =
    "CREATE TABLE IF NOT EXISTS table_cash_count(unit REAL ,quantity INTEGER,category_id INTEGER,is_coin INTEGER,is_submitted INTEGER,description TEXT);";
String createUnbankedSaleTableQuery =
    "CREATE TABLE IF NOT EXISTS table_unbanked_sale(id TEXT PRIMARY KEY,amount REAL,date TEXT);";
String createLubesTableQuery =
    "CREATE TABLE IF NOT EXISTS table_lubes(id TEXT PRIMARY KEY,product_code TEXT,full INTEGER,quantity INTEGER,total INTEGER,remarks TEXT);";
String createLubeCategoryTableQuery =
    "CREATE TABLE IF NOT EXISTS table_lube_category(product_code TEXT PRIMARY KEY,main_category TEXT,description TEXT,package_size TEXT,quantity_title TEXT,quantity_unit INTEGER);";
