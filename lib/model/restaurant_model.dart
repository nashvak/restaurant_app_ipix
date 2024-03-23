class Usermodel {
  List<Restaurant> restaurants;

  Usermodel({
    required this.restaurants,
  });
}

class Restaurant {
  int id;
  String name;
  Neighborhood neighborhood;
  String photograph;
  String address;
  Latlng latlng;
  String cuisineType;
  OperatingHours operatingHours;
  List<Review> reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.neighborhood,
    required this.photograph,
    required this.address,
    required this.latlng,
    required this.cuisineType,
    required this.operatingHours,
    required this.reviews,
  });
}

class Latlng {
  double lat;
  double lng;

  Latlng({
    required this.lat,
    required this.lng,
  });
}

enum Neighborhood { BROOKLYN, MANHATTAN, QUEENS }

class OperatingHours {
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String sunday;

  OperatingHours({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });
}

class Review {
  String name;
  Date date;
  int rating;
  String comments;

  Review({
    required this.name,
    required this.date,
    required this.rating,
    required this.comments,
  });
}

enum Date { OCTOBER_262016 }
