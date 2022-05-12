class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photos;
  int numberOfKitchens;
  int numberOfBedrooms;
  int numberOfCupboards;
  String thumbnail;

  Space({
    this.city,
    this.country,
    this.name,
    this.price,
    this.id,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.thumbnail,
  });

  // Space.fromJson(json) {
  //   id = json['id'];
  //   name = json['name'];
  //   city = json['city'];
  //   country = json['country'];
  //   imageUrl = json['image_url'];
  //   price = json['price'];
  //   rating = json['rating'];
  //   address = json['address'];
  //   phone = json['phone'];
  //   mapUrl = json['map_url'];
  //   photos = json['photos'];
  //   numberOfBedrooms = json['number_of_bedrooms'];
  //   numberOfCupboards = json['number_of_cupboards'];
  //   numberOfKitchens = json['number_of_kitchens'];
  // }

  factory Space.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return Space(
      id: json['id'],
      name: json['name'],
      city: json['city'],
      country: json['country'],
      imageUrl: json['image_url'],
      price: json['price'],
      rating: json['rating'],
      address: json['address'],
      phone: json['phone'],
      mapUrl: json['map_url'],
      photos: json['photos'],
      numberOfBedrooms: json['number_of_bedrooms'],
      numberOfCupboards: json['number_of_cupboards'],
      numberOfKitchens: json['number_of_kitchens'],
      thumbnail: json['image_url'] ?? json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        country: 'country',
        imageUrl: 'image_url',
        address: 'address',
        phone: 'phone',
        mapUrl: 'map_url',
      };

  static List<Space> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Space.fromJson(item)).toList();
  }

  @override
  operator ==(object) =>
      this.name.toLowerCase().contains(object.toLowerCase()) ||
      this.price.toString().contains(object);

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
