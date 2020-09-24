import 'package:flutter_app_redux/models/user.dart';

User userMockData = User.fromJson(json);

var json = {
  "results": [
    {
      "gender": "male",
      "name": {
        "title": "Mr",
        "first": "Andy",
        "last": "Spencer"
      },
      "location": {
        "street": {
          "number": 1820,
          "name": "Sunset St"
        },
        "city": "Anchorage",
        "state": "Louisiana",
        "country": "United States",
        "postcode": 66053,
        "coordinates": {
          "latitude": "81.6570",
          "longitude": "-43.8895"
        },
        "timezone": {
          "offset": "+10:00",
          "description": "Eastern Australia, Guam, Vladivostok"
        }
      },
      "email": "andy.spencer@example.com",
      "login": {
        "uuid": "0df2c059-6f71-4cc3-ad8e-8afe08c16cfa",
        "username": "orangetiger587",
        "password": "starman",
        "salt": "z7DeWXo7",
        "md5": "3dd0c5a3f85e74e913e3f2bb734ed835",
        "sha1": "aa871c612fbb96b0fe130062b3f19812acf8a75e",
        "sha256": "b44d32cd1376dfecb12308b7bfda4a3c67be3468850f8aa08d5c73c9447104a6"
      },
      "dob": {
        "date": "1979-10-15T16:09:32.961Z",
        "age": 41
      },
      "registered": {
        "date": "2018-11-23T07:44:52.684Z",
        "age": 2
      },
      "phone": "(057)-047-9613",
      "cell": "(731)-874-8171",
      "id": {
        "name": "SSN",
        "value": "235-19-4213"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/men/87.jpg",
        "medium": "https://randomuser.me/api/portraits/med/men/87.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/men/87.jpg"
      },
      "nat": "US"
    }
  ],
  "info": {
    "seed": "d26f9a42019b9735",
    "results": 1,
    "page": 1,
    "version": "1.3"
  }
};