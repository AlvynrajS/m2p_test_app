class APIConstants {
  static String baseUrl = "baseURL";

  static String loginUrl =
      'http://localhost:8080/fineract-provider/api/v1/auth/clientlogin';

  static String accessToken =
      "$baseUrl/fineract-provider/api/oauth/token?client_id=community-app&client_secret=123&grant_type=mobile_otp&token=123455&username=7820922603&otp=123&otpreferenceid=1eca5cad-255a-4777-a198-0e06ec217840";

  static String getClientData =
      "$baseUrl/fineract-provider/api/v1/self/userdetails?access_token=fe02d914-8af4-416f-b904-719ee8e7e6e6";

  static String formTemplate =
      "https://uat-uno.finfluxtrial.io/fineract-provider/api/v3/forms/employment";

  static String getFormData =
      "$baseUrl/fineract-provider/api/v3/forms/clients/225152/dsa-form";

  static String updateFormData =
      "$baseUrl/fineract-provider/api/v3/forms/clients/225152/dsa-form";

  static String postFormData =
      "$baseUrl/fineract-provider/api/v3/forms/clients/225152/dsa-form";
}
