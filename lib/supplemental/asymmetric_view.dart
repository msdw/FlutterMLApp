// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import 'package:shrine_with_square/model/product.dart';
import 'package:shrine_with_square/supplemental/product_columns.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DataRequiredForBuild {
  File image;

  DataRequiredForBuild({
    this.image,
  });
}

class AsymmetricView extends StatefulWidget {

  @override
  _AsymmetricViewState createState() => _AsymmetricViewState();
}

class _AsymmetricViewState extends State<AsymmetricView> {
  File _image;
  Future<DataRequiredForBuild> _dataRequiredForBuild;

  Future<DataRequiredForBuild> _fetchAllData() async {
    return DataRequiredForBuild(
      image: await getImage(),
    );
  }

  @override
  void initState() {
    super.initState();
    // this should not be done in build method
    _dataRequiredForBuild = _fetchAllData();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  

  Container _buildContainer(BuildContext context) {
    
    FloatingActionButton floatingActionButton = FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: FutureBuilder<DataRequiredForBuild>(
          future: _dataRequiredForBuild,
          builder: (context, snapshot) {
            return snapshot.hasData ? Container(child: Image.file(snapshot.data.image))
             : Container(child: Text(
                                  'Select an image to analyse',
                                  style: TextStyle(color: Colors.black)
    ));
          })
    );
    
    return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: floatingActionButton,
        ),
      );
  }

  int _evenCasesIndex(int input) {
    // The operator ~/ is a cool one. It's the truncating division operator. It
    // divides the number and if there's a remainder / decimal, it cuts it off.
    // This is like dividing and then casting the result to int. Also, it's
    // functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    return (totalItems % 3 == 0)
      ? totalItems ~/ 3 * 2
      : (totalItems / 3).ceil() * 2 - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildContainer(context),
    );
  }
}
