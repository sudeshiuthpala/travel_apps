class PlaceModel{
  final String name;
  final String image;
  final String shortdetails;
  final String description;
  PlaceModel({required this.name,required this.image,required this.shortdetails,required this.description});

  factory PlaceModel.fromJson(Map<String,dynamic> json)=> PlaceModel(
    name:json['title'],
    image: json['image'],
    shortdetails:json['shortdetail'],
    description: json['description']
  );
}