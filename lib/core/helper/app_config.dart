abstract class AppConfig {
  String get baseUrl;
}

class StagConfig implements AppConfig {
  @override
  String get baseUrl => "https://stgcadremisapi.dhwaniris.in/";
}

class ProdConfig implements AppConfig {
  @override
  String get baseUrl => "https://stgcadremisapi.dhwaniris.in/";
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  late AppConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  AppConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.staging:
        return StagConfig();
      default:
        return StagConfig();
    }
  }
}
