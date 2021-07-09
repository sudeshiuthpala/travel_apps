import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_apps/models/place_model.dart';
import 'package:travel_apps/provider/place_date_provider.dart';
import 'package:travel_apps/provider/place_des_provider.dart';

class PlaceDescriptionScreen extends StatefulWidget{
  @override
  _PlaceDescriptionScreenState createState() => _PlaceDescriptionScreenState();

}
class _PlaceDescriptionScreenState extends State<PlaceDescriptionScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final mdl=Provider.of<PlaceDesProvider>(context,listen:false);
    mdl.desPlace();
  }

  @override
  Widget build(BuildContext context) {
    final mdl=Provider.of<PlaceDesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(24),
          itemCount: mdl.placedes.length,
          itemBuilder: (context,index){
            PlaceModel place= mdl.placedes[index];
            return PlaceView(
              name : place.name,
              image: place.image,
              description: place.description,
            );
          }),
    );
  }
}

class PlaceView extends StatelessWidget{
  final String image;
  final String name;
  final String description;

  PlaceView({required this.name,required this.image,required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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
            Text(description,style: TextStyle(color: Colors.black),),
          ],
        ),
      );
  }

}