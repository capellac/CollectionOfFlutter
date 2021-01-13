import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path; //for getting special name
import 'package:path_provider/path_provider.dart'
    as syspaths; //for system directort

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFileResponse = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if(imageFileResponse == null)     return;
    setState(() {
      _storedImage = File(imageFileResponse.path);
    });
    final appDirResponse = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFileResponse.path);
    final savedImageResponse = await
        _storedImage.copy('${appDirResponse.path}/$fileName');
    widget.onSelectImage(savedImageResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken', textAlign: TextAlign.center),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Take Picture'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
