import '../models/pet.dart' show Pet;
import 'package:flutter/material.dart';
import "../services/pets_services.dart";

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [
    Pet(
        id: 1,
        name: "Lucifurr",
        image: "https://i.ibb.co/P6VJ4pZ/smile-cat-1.png",
        age: 2,
        gender: "male")
  ];

  void getPet() async {
    var response = await Client.dio.get("/pets");
    var petlist = response.data
        as List; // we cgrap the refrence from joisn response"post man"
    for (int i = 0; i < petlist.length; i++) {
      var petjiosn = petlist[i];
      var pet = Pet(
        // create a pet object from jaison
        id: petjiosn["id"],
        age: petjiosn["age"],
        image: petjiosn["image"],
        gender: petjiosn["gender"],
        name: petjiosn["name"],
      ); //create a pet object
      pets.add(pet); // append the current pet from two pet list
    }
    notifyListeners(); // notify the flutter wedjet to rebuild
  }
}
