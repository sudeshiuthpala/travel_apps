import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/models/place_model.dart';
import 'package:travel_apps/provider/place_date_provider.dart';
import 'package:travel_apps/screens/place_description_screen.dart';

class TravelListScreen extends StatefulWidget{
  @override
  _TravelListScreenState createState() => _TravelListScreenState();

}
class _TravelListScreenState extends State<TravelListScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final mdl=Provider.of<PlaceDateProvider>(context,listen:false);
    mdl.loadPlace();
  }


  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDateProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Travelling Places'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(24),
        itemCount: mdl.placeList.length,
          itemBuilder: (context,index){
            PlaceModel place= mdl.placeList[index];
            child: Hero(
              tag: "image$index",
              child: Image(
                height :200,
                width: 500,
                // decoration: BoxDecoration(
                //     image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
                // ),
                image:NetworkImage(place.image) ,
                fit: BoxFit.cover,
              ),
            );
            return TravelViewCard(
                name : place.name,
                shortdetail: place.shortdetails,
                image: place.image,
                );
          }),
    );
  }
}

class TravelViewCard extends StatelessWidget{
  final String image;
  final String name;
  final String shortdetail;


  TravelViewCard({required this.shortdetail,required this.name,required this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>PlaceDescriptionScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height :200,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover)
              ),
            ),
            SizedBox(height: 20.0,),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
            SizedBox(height: 10.0,),
            Text(shortdetail,style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

}