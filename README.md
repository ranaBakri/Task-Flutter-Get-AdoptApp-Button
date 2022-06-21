# Pets Adoption App 🦄

![Ipets](https://user-images.githubusercontent.com/84308096/167295237-ac5ea80c-cb66-4975-9a93-c844dbfc6b37.png)

## Instructions

- Fork and clone [this repository](https://github.com/JoinCODED/Task-Flutter-Get-AdoptApp-Button) to your `Development` folder.
- Endpoints:

```
Get pets, type: Get, https://coded-pets-api-crud.herokuapp.com/pets
Create a new pet, type: Post, https://coded-pets-api-crud.herokuapp.com/pets
Update a pet, type: Put, https://coded-pets-api-crud.herokuapp.com/pets/{petId}
Delete a pet, type: Delete, https://coded-pets-api-crud.herokuapp.com/pets/{petId}
Adopt a pet, type: Post, https://coded-pets-api-crud.herokuapp.com/pets/adopt/{petId}
```

### Part 1: Get Data

1. Install `dio` into your project:

```shell
flutter pub add dio
```

2. Create a folder named `services`, inside it create a file called `pets_services.dart`.
3. Import `dio` package in `pets_services.dart`.

```dart
import "package:dio/dio.dart";
```

4. Create a new `DioClient` class and initialize a new dio instance.
6. Create a function to get the list of pets and name it `getPets`.
7. Our endpoint is:

```
Get, https://coded-pets-api-crud.herokuapp.com/pets
```
8. Dont forget to ass async and await
9. Store the response of the request in a `Response` object.
10. In your `PetsProvider`, create a new function that calls `getPets` .
11. Make the button in the home_page call the provider function.
12. Print the response in the debug console. 


### Part 2: Use the data

11. Add the following packages `flutter pub add json_serializable , build_runner`
12. Go to the pets model and add this code before the class
``` dart 
import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';
@JsonSerializable()
```
13. Run this in terminal `flutter pub run build_runner build`
14. Add the following code in the pet model
```dart 
factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
  Map<String, dynamic> toJson() => _$PetToJson(this);
```

15. In `pets_services.dart` save the response in a list of pets and convert from Json to pet `List<Pet> pets =(res.data as List).map((pet) => Pet.fromJson(pet)).toList();`
16. Add try and catch in case of Dio Error try{...}on DioError catch(error){...}
17. Change return type to List<Pet>, fix the function so that it returns a future list of pets
18. Finally fix the provider as well by adding async and await
  
