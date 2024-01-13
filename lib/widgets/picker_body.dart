import 'package:chat_app/repo/image_repository.dart';
import  'package:flutter/material.dart';
import '../models/image_model.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelected;
  NetworkImagePickerBody({super.key, required this.onImageSelected});

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    //TODO: Make the picker body rounded
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24))
      ),
      child: FutureBuilder<List<PixelfordImage>>(
          future: _imageRepo.getNetworkImages(),
          builder: (BuildContext context,
              AsyncSnapshot<List<PixelfordImage>> snapshot){
            if(snapshot.hasData){
              return GridView.builder(
                  // itemCount: snapshot.data!.length,
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: () {
                        onImageSelected(snapshot.data![index].download_url);
                      },
                        child: Image.network(snapshot.data![index].download_url));
                  },
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5
                  )
              );
            } else if (snapshot.hasError){
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text('This is the error: ${snapshot.error}'),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
