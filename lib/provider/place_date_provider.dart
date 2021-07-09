import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_apps/models/place_model.dart';

class PlaceDateProvider with ChangeNotifier{
  List<PlaceModel> placeList=[];

  loadPlace(){
    FirebaseFirestore.instance.collection('place').get().then((querySnapshot){
      querySnapshot.docs.forEach((queryDocSnapshot) {
        if(queryDocSnapshot.exists){
          placeList.add(PlaceModel.fromJson(queryDocSnapshot.data()));

        }
      });
      notifyListeners();
    });
  }
}