import 'package:flutter_app_redux/models/user.dart';

User userMockData = User.fromJson(json);

var json = {
  "results": [
    {
      "gender": "female",
      "name": {
        "title": "Ms",
        "first": "Louanne",
        "last": "Durand"
      },
      "location": {
        "street": {
          "number": 9953,
          "name": "Rue Duguesclin"
        },
        "city": "Saint-Pierre",
        "state": "Loire",
        "country": "France",
        "postcode": 95367,
        "coordinates": {
          "latitude": "-3.9163",
          "longitude": "121.1641"
        },
        "timezone": {
          "offset": "+5:00",
          "description": "Ekaterinburg, Islamabad, Karachi, Tashkent"
        }
      },
      "email": "louanne.durand@example.com",
      "login": {
        "uuid": "94cafdd8-ff16-409a-ae80-2fb26f225cf4",
        "username": "angrydog997",
        "password": "krystal",
        "salt": "7fxbJNA5",
        "md5": "a4b9a942e2836f7cd3966161bc2935b5",
        "sha1": "74f7da3782e2a21ce73e5d1c4b3373c72502e2b4",
        "sha256": "992971f225f6f072aacee4810fd7e2a14bd60c7a20a9ec2f90cbeb99c300c28d"
      },
      "dob": {
        "date": "1982-11-03T04:21:33.963Z",
        "age": 38
      },
      "registered": {
        "date": "2004-10-12T06:42:06.308Z",
        "age": 16
      },
      "phone": "05-11-37-92-73",
      "cell": "06-34-49-21-65",
      "id": {
        "name": "INSEE",
        "value": "2NNaN74483933 01"
      },
      "picture": {
        "large": "https://randomuser.me/api/portraits/women/37.jpg",
        "medium": "https://randomuser.me/api/portraits/med/women/37.jpg",
        "thumbnail": "https://randomuser.me/api/portraits/thumb/women/37.jpg"
      },
      "nat": "FR"
    }
  ],
  "info": {
    "seed": "7dad8b264152d913",
    "results": 1,
    "page": 1,
    "version": "1.3"
  }
};