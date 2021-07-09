import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_apps/models/place_model.dart';

class PlaceDesProvider with ChangeNotifier{
  List<PlaceModel> placedes=[];
  desPlace(){
    FirebaseFirestore.instance.collection('place').get().then((querySnapshot){
      querySnapshot.docs.forEach((queryDocSnapshot) {
        if(queryDocSnapshot.exists){
          placedes.add(PlaceModel.fromJson(queryDocSnapshot.data()));
        }
      });
      notifyListeners();
    });
  }
}