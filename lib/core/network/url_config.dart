enum UrlEnvironment { development, production }

class UrlConfig {
  static UrlEnvironment _environment = UrlEnvironment.development;
  static UrlEnvironment get environment => _environment;
  static void setEnvironment(UrlEnvironment env) => _environment = env;

  static String get baseUrl => "/api/v1/";

  static get _baseUrl {
    switch (_environment) {
      case UrlEnvironment.development:
        return 'https://dev.example.com';
      case UrlEnvironment.production:
        return 'https://prod.example.com';
    }
  }
}

