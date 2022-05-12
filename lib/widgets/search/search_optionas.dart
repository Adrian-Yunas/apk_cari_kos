class SearchOptions {
//   String location;
//   String sort;
//   String order;
//   double count;
//   List<int> categories = [];
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
//
  SearchOptions({
//     this.location,
//     this.sort,
//     this.order,
//     this.count,
    this.city,
    this.country,
    this.id,
    this.imageUrl,
    this.name,
    this.price,
    this.rating,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchens,
    this.phone,
    this.photos,
    this.thumbnail,
  });
//
  Map<String, dynamic> toJson() => {
//     'entity_type': location,
//     'sort': sort,
//     'count': count,
//     'order': order,
//     'category': categories.join(',')
        //id: 'id',
        name: 'name',
        city: 'city',
        country: 'country',
        imageUrl: 'image_url',
        //price : 'price',
        //rating :'rating',
        address: 'address',
        phone: 'phone',
        mapUrl: 'map_url',
        //photos: 'photos',
        //numberOfBedrooms : 'number_of_bedrooms',
        //numberOfCupboards: 'number_of_cupboards',
        //numberOfKitchens : 'number_of_kitchens',
        thumbnail: 'image_url' ?? 'image_url',
      };
}

// class SearchOption {
//   final int id;
//   final String name;
//   final int price;
//
//   SearchOption({this.id, this.name, this.price});
// }
