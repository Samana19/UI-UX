class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:3000/";
  //for your andriod phone
  // static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String uploadImage = "/auth/uploadImage";
  static const String logout = "/auth/logout";
  static const String getUser = "/auth/getuser";

  // ====================== News Routes ======================
  static const String getAllNews = "/api/news/";
  // static const String getNewsById = "/api/news/:newsid";
  // static const String postNews = "/api/news/";
  // static const String updateNews = "/api/news/:newsid";
  // static const String deleteNews = "/api/news/:newsid";

  // ====================== Comment Routes ======================
  static const String getAllComments = "/api/comment/";
  static const String postComment = "/api/comment/:newsid";
  static const String updateComment = "/api/comment/:commentid";
  static const String deleteComment = "/api/comment/:commentid";
  // static String getComments(String newsid) => "/api/comment/$newsid";
  // static String deleteComment(String commentid) => "/api/comment/$commentid";
}
