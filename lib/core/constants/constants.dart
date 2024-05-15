abstract final class Constants {
  Map<String, dynamic> geohases = {};

  getHases() {
    geohases["geohases"] = [
      {
        "geohash": "abcd1234",
        "coordinate": {"latitude": 27.7172, "longitude": 85.324},
        "address": {
          "street": "Sample Street",
          "city": "Sample City",
          "country": "Sample Country"
        }
      },
      {
        "geohash": "efgh5678",
        "coordinate": {"latitude": 27.7099, "longitude": 85.3225},
        "address": {
          "street": "Another Street",
          "city": "Another City",
          "country": "Another Country"
        }
      }
    ];
  }
}
