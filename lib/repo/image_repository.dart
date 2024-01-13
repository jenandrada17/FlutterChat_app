
import 'dart:convert';
import 'dart:io';
import '../models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository{
  //TODO: Get Network Images from API
  Future<List<PixelfordImage>> getNetworkImages() async {
    try {
      var endpointUrl = Uri.parse('https://picsum.photos/v2/list');

      final response = await http.get(endpointUrl);
      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;

        final List<PixelfordImage> _imageList = decodedList.map((listItem) {
          return PixelfordImage.fromJson(listItem);
        }).toList();

        return _imageList;
      } else {
        throw Exception('API not successful!');
      }
    } on SocketException {
      throw Exception('No Internet Connection!');
    } on HttpException {
      throw Exception('Couldnt retrieve the images! Sorry!');
    } on FormatException {
      throw Exception('Bad response format!');
    } catch(e){
      print(e);
      throw Exception('Unknown error');
    }
  }
}