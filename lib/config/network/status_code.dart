class ApiStatusCode {
  // HTTP Status Codes
  static const int httpUnAuthorized = 401;
  static const int httpForbidden = 403;
  static const int httpBadRequest = 400;
  static const int httpNotFound = 404;
  static const int httpInternalServerError = 500;
  static const int httpServiceUnavailable = 503;
  static const int httpGatewayTimeout = 504;
  static const int httpBadGateway = 502;
  static const int httpInternetConnection = 0;

  static Map<int, String> statusCodes = {
    httpUnAuthorized: 'Unauthorized',
    httpForbidden: 'Forbidden access',
    httpBadRequest: 'Bad request',
    httpNotFound: 'Resource not found',
    httpInternalServerError: 'Internal server error',
    httpServiceUnavailable: 'Service unavailable',
    httpGatewayTimeout: 'Gateway timeout',
    httpBadGateway: 'Bad gateway',
  };

}


