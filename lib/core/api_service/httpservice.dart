abstract class BaseService {
  //BasePath
  static String get basePath => "";

  //Get Request
  Future<dynamic> getRequest(path);

  //Post Request
  Future<dynamic> postRequest(path);

  //Put Request
  Future<dynamic> putRequest(path);

  //Delete Request
  Future<dynamic> deleteRequest(path);
}
