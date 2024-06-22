import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_app/data/string_resource.dart';
import 'package:test_app/models/client_data_model.dart';
import 'package:test_app/http/repo.dart';
import 'package:test_app/utils/widget_utils.dart';

class DynamicFormController extends GetxController {
  RxList<RxBool> showDetails = [false.obs, false.obs].obs;
  RxList<String> dropDownValue = <String>[].obs;
  RxBool isDropDownValueUpdated = false.obs;
  RxBool isAgencyUpdated = false.obs;
  RxBool isEditButtonClicked = false.obs;

  TextEditingController sourcedByController = TextEditingController();
  TextEditingController agencyCodeController = TextEditingController();
  final box = GetStorage();

  RxString? selectedAgencyType;

  RxString? selectedAgencyName;

  late ClientDataModel clientDetails;

  String jsonString = '''
    {
      "username": "7820922603",
      "userId": 5503,
      "accessToken": "d3893185-d591-4087-a170-bdcda05692a4",
      "authenticated": true,
      "officeId": 1,
      "officeName": "HO:Head Office",
      "roles": [
        {
          "id": 18,
          "name": "Self User Role",
          "description": "Role for self user",
          "disabled": false,
          "roleBasedLimits": []
        }
      ],
      "permissions": [
        "CREATE_REPORTREQUEST",
        "ROLE_CREATE_REPORTREQUEST",
        "READ_USER",
        "ROLE_READ_USER",
        "READ_CLIENT",
        "ROLE_READ_CLIENT",
        "DOWNLOAD_DOCUMENT",
        "ROLE_DOWNLOAD_DOCUMENT",
        "READ_LOAN",
        "ROLE_READ_LOAN",
        "CREATE_DOCUMENT",
        "ROLE_CREATE_DOCUMENT",
        "CREATE_LOANAPPLICATIONREFERENCE",
        "ROLE_CREATE_LOANAPPLICATIONREFERENCE",
        "READ_DOCUMENT",
        "ROLE_READ_DOCUMENT",
        "ALL_FUNCTIONS_READ",
        "ROLE_ALL_FUNCTIONS_READ",
        "CREATE_CLIENTIDENTIFIER",
        "ROLE_CREATE_CLIENTIDENTIFIER",
        "READ_CLIENTIDENTIFIER",
        "ROLE_READ_CLIENTIDENTIFIER",
        "READ_STAFF",
        "ROLE_READ_STAFF",
        "READ_LOANAPPLICATIONREFERENCE",
        "ROLE_READ_LOANAPPLICATIONREFERENCE"
      ],
      "shouldRenewPassword": false,
      "clientId": 20094
    }
  ''';
  Map<String, dynamic> agencyDetails = {
    "${StringResource.agency} ${StringResource.type}": "DSA",
    "${StringResource.agency} ${StringResource.name}": "Om Financial Solution",
    StringResource.sourcedBy: "Value"
  };
  Map<String, dynamic> userDetails = {
    "username": "7820922603",
    "userId": 5503,
    "accessToken": "d3893185-d591-4087-a170-bdcda05692a4",
    "authenticated": true,
    "officeId": 1,
    "officeName": "HO:Head Office",
    "roles": [
      {
        "id": 18,
        "name": "Self User Role",
        "description": "Role for self user",
        "disabled": false,
        "roleBasedLimits": []
      }
    ],
    "permissions": [
      "CREATE_REPORTREQUEST",
      "ROLE_CREATE_REPORTREQUEST",
      "READ_USER",
      "ROLE_READ_USER",
      "READ_CLIENT",
      "ROLE_READ_CLIENT",
      "DOWNLOAD_DOCUMENT",
      "ROLE_DOWNLOAD_DOCUMENT",
      "READ_LOAN",
      "ROLE_READ_LOAN",
      "CREATE_DOCUMENT",
      "ROLE_CREATE_DOCUMENT",
      "CREATE_LOANAPPLICATIONREFERENCE",
      "ROLE_CREATE_LOANAPPLICATIONREFERENCE",
      "READ_DOCUMENT",
      "ROLE_READ_DOCUMENT",
      "ALL_FUNCTIONS_READ",
      "ROLE_ALL_FUNCTIONS_READ",
      "CREATE_CLIENTIDENTIFIER",
      "ROLE_CREATE_CLIENTIDENTIFIER",
      "READ_CLIENTIDENTIFIER",
      "ROLE_READ_CLIENTIDENTIFIER",
      "READ_STAFF",
      "ROLE_READ_STAFF",
      "READ_LOANAPPLICATIONREFERENCE",
      "ROLE_READ_LOANAPPLICATIONREFERENCE"
    ],
    "shouldRenewPassword": false,
    "clientId": 20094
  };
  Map<String, dynamic> agencyType = {
    "id": 89,
    "name": "agencyType",
    "displayName": "Agency Type",
    "dataType": "Selection",
    "possibleValues": ["DSA", "Connector"],
    "isMandatory": true,
    "isEditable": true,
    "isHidden": false,
    "isAdditionalField": true,
    "displayOrder": 1,
    "length": 0,
    "categoryValue": "Agency Details",
    "category": "Agency Details",
    "defaultSelection": "DSA"
  };
  Map<String, dynamic> agencyName = {
    "id": 90,
    "name": "agencyName",
    "displayName": "Agency Name",
    "dataType": "ConditionalSelection",
    "possibleValuesMap": {
      "dependantFieldName": "agencyType",
      "value": {
        "DSA": [
          "SKY HIGH FINANCESOLUTIONS",
          "Urban Money Private Limited (Square Capital)",
          "Ruloans Distributionservices pvt ltd",
          "Finwizz ManagementConsultants Pvt Ltd",
          "Andromeda Sales &Distribution pvt ltd",
          "OM Financial Services",
          "Fineoteric Consulting Pvt .Ltd (Finkart)",
          "RUPEE BOSS",
          "Royal Finserv Securities",
          "Ratnanidhi Corporation",
          "Book My Loan",
          "Royal Finserv Consultants Pvt Ltd",
          "Opendoors Fintech Private Limited (Namaste Credit)",
          "Cateye Consultancy Services Pvt Ltd",
          "Planut Envestment Solutions Pvt. Ltd.",
          "Anvi Associates",
          "JBJ Associates",
          "My Mudra Fincorp Pvt Ltd",
          "Chase Fly Fincom Pvt Ltd",
          "SBJ BPO SERVICES LIMITED",
          "OSM Advisor",
          "AADiFidelis solutions pvt ltd",
          "DREAM INC.",
          "Jai enterprises",
          "STAR Powerz Digital Techonologies Pvt Ltd",
          "MHP Services",
          "SDV Finconsultant LLP",
          "Niyogin Fintech Limited",
          "RAAJ KHOSLA & CO. PVT. LTD ( My Money Mantra / RKPL)",
          "Nafisa Ansari & Co (cresent)",
          "Trueway Financial services Pvt Ltd",
          "Divyanshi Capital Insurance Marketing Pvt Ltd",
          "A Squarian Consultants Pvt Ltd",
          "Parker's consulting & Ventures Pvt Ltd",
          "Truewin fintech private limited",
          "Eklingi Finance Solutions Pvt Ltd",
          "SIIA advisory Pvt Ltd",
          "Quick Paisa Solution Private limited",
          "Digix Fincap India Pvt Ltd",
          "Vikram Shani Enterprises",
          "Generation Next BPO Services",
          "Arya Consultancy",
          "Prostar Finserve Pvt Ltd",
          "Capital Copia",
          "Pragati Wealth",
          "PPV Advisor LLP",
          "Realturity Business Advisory Private Limited",
          "SAARATHI FINBIZ PVT LTD",
          "HEXAFIN CONSULTANCY PRIVATE LIMITED",
          "ALPANA AGGARWAL",
          "RAHUL",
          "RINKI",
          "USHA DHANANJAY HAJARE",
          "DEEPAK KUMAR SHIVANI",
          "RAHUL KR FIN",
          "THIRD DIMENSION ADVISORY LLP",
          "PAWAN KUMAR",
          "AADI TRADEMART PRIVATE LIMITED",
          "RAJPUT Enterprises",
          "RAVIKASH FINANCIAL SERVICES PRIVATE LIMITED",
          "R.B ENTERPRISES",
          "UNICUS FINTECH SOLUTIONS PRIVATE LIMITED",
          "APEX FINMART SERVICES",
          "Impetus Adcon Private limited",
          "DHAN MOMENTUM ADVISORS PVT.LTD.",
          "LOAN NETWORK TECHNOLOGIES PRIVATE LIMUTED",
          "FUNDTRANDZ INDIA PRIVATE LIMITED"
        ],
        "Connector": [
          "Kumari Puja",
          "Prashant",
          "Rakesh Kumar",
          "Shazeb Ali",
          "Sunil Kumar",
          "Money Matters",
          "Aradhna",
          "Vikram Dewan",
          "Rajesh Kumar",
          "Shailesh Pandey",
          "Sushil G Jadhav",
          "Lala Ram"
        ]
      }
    },
    "isMandatory": true,
    "isEditable": true,
    "isHidden": false,
    "isAdditionalField": true,
    "displayOrder": 2,
    "length": 0,
    "categoryValue": "Agency Details",
    "category": "Agency Details"
  };
  Map<String, dynamic> sourcedByExternal = {
    "id": 91,
    "name": "sourcedByExternal",
    "displayName": "Sourced By (External RM)",
    "dataType": "String",
    "isMandatory": true,
    "isEditable": true,
    "isHidden": false,
    "isAdditionalField": true,
    "displayOrder": 3,
    "length": 0,
    "categoryValue": "Agency Details",
    "category": "Agency Details"
  };
  Map<String, dynamic> agencyCode = {
    "id": 92,
    "name": "agencyCode",
    "displayName": "Agency Code",
    "dataType": "String",
    "isMandatory": true,
    "isEditable": true,
    "isHidden": false,
    "isAdditionalField": true,
    "valueExpression": {
      "SKY HIGH FINANCESOLUTIONS": "CP - 1013",
      "Urban Money Private Limited (Square Capital)": "CP - 1026",
      "Ruloans Distributionservices pvt ltd": "CP - 1079",
      "Finwizz ManagementConsultants Pvt Ltd": "CP - 1094",
      "Andromeda Sales &Distribution pvt ltd": "CP - 1095",
      "OM Financial Services": "CP - 1106",
      "Fineoteric Consulting Pvt .Ltd (Finkart)": "CP - 1110",
      "RUPEE BOSS": "CP - 1160",
      "Royal Finserv Securities": "CP - 1183",
      "Ratnanidhi Corporation": "CP - 1203",
      "Book My Loan": "CP - 1209",
      "Royal Finserv Consultants Pvt Ltd": "CP-1240",
      "Opendoors Fintech Private Limited (Namaste Credit)": "CP-1245",
      "Cateye Consultancy Services Pvt Ltd": "CP-1247",
      "Planut Envestment Solutions Pvt. Ltd.": "CP-1248",
      "Anvi Associates": "CP-1253",
      "JBJ Associates": "CP-1257",
      "My Mudra Fincorp Pvt Ltd": "CP-1265",
      "Chase Fly Fincom Pvt Ltd": "CP-1266",
      "SBJ BPO SERVICES LIMITED": "CP-1268",
      "OSM Advisor": "CP-1271",
      "AADiFidelis solutions pvt ltd": "CP-1272",
      "DREAM INC.": "CP-1296",
      "Jai enterprises": "CP-1304",
      "STAR Powerz Digital Techonologies Pvt Ltd": "CP-1307",
      "MHP Services": "CP-1308",
      "SDV Finconsultant LLP": "CP-1313",
      "Niyogin Fintech Limited": "CP-1315",
      "RAAJ KHOSLA & CO. PVT. LTD ( My Money Mantra / RKPL)": "CP-1318",
      "Nafisa Ansari & Co (cresent)": "CP-1329",
      "Trueway Financial services Pvt Ltd": "CP-1341",
      "Divyanshi Capital Insurance Marketing Pvt Ltd": "CP-1344",
      "A Squarian Consultants Pvt Ltd": "CP-1347",
      "Parker's consulting & Ventures Pvt Ltd": "CP-1362",
      "Truewin fintech private limited": "RP-042",
      "Eklingi Finance Solutions Pvt Ltd": "RP-043",
      "SIIA advisory Pvt Ltd": "RP-044",
      "Quick Paisa Solution Private limited": "CP-1370",
      "Digix Fincap India Pvt Ltd": "RP-045",
      "Vikram Shani Enterprises": "RP-046",
      "Generation Next BPO Services": "RP-047",
      "Arya Consultancy": "CP-1372",
      "Prostar Finserve Pvt Ltd": "CP-1374",
      "Capital Copia": "CP-1375",
      "Pragati Wealth": "RP-048",
      "PPV Advisor LLP": "RP-049",
      "Realturity Business Advisory Private Limited": "RP-050",
      "SAARATHI FINBIZ PVT LTD": "RP-051",
      "HEXAFIN CONSULTANCY PRIVATE LIMITED": "CP-1378",
      "ALPANA AGGARWAL": "CP-1377",
      "RAHUL": "CP-1378",
      "RINKI": "CP-1379",
      "USHA DHANANJAY HAJARE": "CP-1380",
      "DEEPAK KUMAR SHIVANI": "CP-1381",
      "RAHUL KR FIN": "RP-052",
      "THIRD DIMENSION ADVISORY LLP": "CP-1383",
      "PAWAN KUMAR": "CP-1384",
      "AADI TRADEMART PRIVATE LIMITED": "CP-1386",
      "RAJPUT Enterprises": "CP-1387",
      "RAVIKASH FINANCIAL SERVICES PRIVATE LIMITED": "CP-1388",
      "R.B ENTERPRISES": "CP-1389",
      "UNICUS FINTECH SOLUTIONS PRIVATE LIMITED": "CP-1390",
      "APEX FINMART SERVICES": "CP-1391",
      "Impetus Adcon Private limited": "CP-1393",
      "DHAN MOMENTUM ADVISORS PVT.LTD.": "CP-1394",
      "LOAN NETWORK TECHNOLOGIES PRIVATE LIMUTED": "CP-1396",
      " FUNDTRANDZ INDIA PRIVATE LIMITED": "CP-1397"
    }
  };

  @override
  void onInit() {
    clientDetails = ClientDataModel.fromJson(jsonString);
    Future.delayed(const Duration(seconds: 1), () {
      dropDownValue.addAll([
        "${StringResource.agency} ${StringResource.details}",
        "${StringResource.agency} ${StringResource.user} ${StringResource.details}",
      ]);
      isDropDownValueUpdated = true.obs;
    });
    super.onInit();
  }

  void dropDownChosen({required int index}) {
    showDetails[index].value = !showDetails[index].value;
  }

  Future<void> getClientData(BuildContext context) async {
    Map<String, dynamic> tokenData = box.read('myMapKey');

    Map<String, dynamic> requestBody = {
      'access_token': tokenData["access_token"]
    };
    try {
      await Repo.getClientDataCall(context, requestBody);
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }

  Future<void> updateFromData(BuildContext context) async {
    List<Map<String, dynamic>> payload = [
      {"id": 89, "name": "agencyType", "value": "DSA"},
      {"id": 90, "name": "agencyName", "value": "OM Financial Services"},
      {"id": 91, "name": "sourcedByExternal", "value": "csdf"},
      {"id": 92, "name": "agencyCode", "value": "CP - 1106"},
      {"id": 93, "name": "sourcedByInternal", "value": "sdvsf"},
      {"id": 94, "name": "agencyEmail", "value": "N/A"},
      {
        "id": 95,
        "name": "agencyAddress",
        "value":
            "Shop No -7, Ground floor, Shiv Kripa Bldg, Block Sector, opp Padmavati Nagar Road, Bhayander (W), thane - 401101"
      },
      {"id": 96, "name": "agencyCreationDate", "value": "06/09/17"},
      {"id": 97, "name": "agencyActive", "value": "TRUE"},
      {"id": 103, "name": "agencyMobileNumber", "value": "8956117488"},
      {"id": 98, "name": "agencyUserName", "value": "scdvsf"},
      {"id": 99, "name": "agencyUserEmail", "value": "cdvf"},
      {"id": 100, "name": "agencyUserLocation", "value": "Mumbai"},
      {"id": 101, "name": "agencyUserCreationDate", "value": "2024-05-21"},
      {"id": 102, "name": "agencyUserActive", "value": "TRUE"}
    ];

    String leadId = "228079";

    Map<String, dynamic> requestBody = {
      "payload": payload,
      "leadId": leadId,
    };

    try {

          await Repo.updateDataCall(context: context, requestBody: requestBody);
    } catch (e) {
      WidgetUtils.snackBar(content: " Error : $e", context: context);
    }
  }
}
