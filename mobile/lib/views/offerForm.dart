import 'dart:io';
import 'dart:ui';

//Included widgets
import 'package:image_picker/image_picker.dart';
import 'package:mobile/components/categoryListItem.dart';
import 'package:mobile/models/appUser.dart';
import 'package:mobile/models/category.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/services/database.dart';
import 'package:mobile/services/storage.dart';
import 'package:mobile/views/personalDataForm.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../inc/nav.dart';
import '../inc/navigationDrawer.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/components/cartProductCard.dart';
import 'package:searchfield/searchfield.dart';

class OfferForm extends StatefulWidget {
  late num? updatedProductId;
  late String? updatedProductName;
  late String? updatedProductDescription;
  late double? updatedProductPrice;
  // Discount is always 0 for edit, discount can be made via discount button only
  // Auth id from form
  late List<num>? updatedProductCategories;
  late int? updatedProductQuantity;
  late String? updatedProductState;


  OfferForm();

  OfferForm.update({
      this.updatedProductId,
      this.updatedProductName,
      this.updatedProductDescription,
      this.updatedProductPrice,
      this.updatedProductCategories,
      this.updatedProductQuantity,
      this.updatedProductState
  });

  @override
  _OfferFormState createState() => _OfferFormState();
}

class _OfferFormState extends State<OfferForm> {
  final _formKey = GlobalKey<FormState>();

  // database.updateProductData(
  // (products.last.id + 1).toInt(),
  // name,
  // description,
  // price.toDouble(),
  // 0,
  // auth.uid,
  // categories,
  // quantity,
  // state);

  XFile? imageFile;
  String name = '';
  String description = '';
  int quantity = 0;
  num price = 0.0;
  String state = '';
  List<num> categories = [];
  String error = '';
  String imgPath = '';


  /// Get from gallery
  _getFromGallery() async {
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it you
      //can now select photo.
      PickedFile? photo = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (photo != null) {
        imageFile = XFile(photo.path);
      }
      setState(() {
        imgPath = photo!.path;
      });
    }
  }

  /// Get from camera
  _getFromCamera() async {
    if (await Permission.camera.request().isGranted) {
      XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickedFile != null) {
        imageFile = XFile(pickedFile.path);
      }
      setState(() {
        imgPath = pickedFile!.path;
      });
    }
  }

  _removeItemFromCategoryList(num id) {
    setState(() {
      categories.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AppUser>(context);
    final DatabaseService database = DatabaseService(uid: auth.uid);
    final products = Provider.of<List<Product>>(context);
    final categoriesList = Provider.of<List<OurCategory>>(context);
    final storage = Storage();
    final users = Provider.of<List<OurUser>>(context);

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Nav(),
        ),
        drawer: NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: const Color(0xfff5f5f5)),
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(children: [
                    Text(
                      'Create Offer',
                      style: TextStyle(
                          fontSize: 25, fontFamily: 'Times New Roman'),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      margin: EdgeInsets.only(top: 15),
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (this.imageFile == null)
                                GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Add Photo',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: 'Times New Roman'),
                                    ))
                            ],
                          ),
                          Expanded(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (this.imageFile == null)
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                this._getFromCamera();
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.camera,
                                                size: 70,
                                              ),
                                            ),
                                            Text(
                                              'Camera',
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Times New Roman'),
                                            )
                                          ],
                                        )),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                this._getFromGallery();
                                              },
                                              child: Icon(
                                                FontAwesomeIcons.file,
                                                size: 70,
                                              ),
                                            ),
                                            Text('Get from gallery',
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Times New Roman'))
                                          ],
                                        )),
                                  ],
                                ))
                              else
                                Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Image.file(File(imageFile!.path)))
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'General Information',
                            style: TextStyle(
                                fontSize: 25, fontFamily: 'Times New Roman'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Item Name',
                            style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              validator: (val) =>
                                  val!.length < 1 ? 'Enter name' : null,
                              onChanged: (val) {
                                setState(() {
                                  name = val;
                                });
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: TextFormField(
                              validator: (val) =>
                                  val!.length < 1 ? 'Enter description' : null,
                              onChanged: (val) {
                                setState(() {
                                  description = val;
                                });
                              },
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantity',
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        child: TextFormField(
                                          validator: (val) => val!.length < 1 ||
                                                  int.parse(val) < 1
                                              ? 'Enter quantity'
                                              : null,
                                          onChanged: (val) {
                                            setState(() {
                                              quantity = int.parse(val);
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        child: TextFormField(
                                          validator: (val) => val!.length < 1 ||
                                                  num.parse(val) < 0
                                              ? 'Enter price'
                                              : null,
                                          onChanged: (val) {
                                            setState(() {
                                              price = num.parse(val);
                                            });
                                          },
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  flex: 3,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 1,
                                  ),
                                  flex: 1,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'State',
                                        style: TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        textAlign: TextAlign.start,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  Size.fromHeight(10)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 25)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xff303744)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            state = 'New';
                                            error = '';
                                          });
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'NEW',
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  Size.fromHeight(10)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 25)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xff303744)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            state = 'Used';
                                            error = '';
                                          });
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'USED',
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all(
                                                  Size.fromHeight(10)),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 25)),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xff303744)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            state = 'Dmg';
                                            error = '';
                                          });
                                        },
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                            'DMG',
                                            style: TextStyle(
                                                color: const Color(0xffffffff),
                                                fontSize: 20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  flex: 3,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 1,
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(error,
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 14.0))
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child:
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Provide product categories',
                                    style: TextStyle(
                                        fontFamily: 'Times New Roman',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: SearchField<OurCategory>(
                                        suggestions: categoriesList
                                            .map(
                                              (e) => SearchFieldListItem<OurCategory>(
                                            e.name,
                                            item: e,
                                          ),
                                        ).toList(),
                                        validator: (x) {
                                          // Implement Validation
                                        },
                                        onSuggestionTap: (val) => {
                                          if (!categories.contains(val.item!.id.toInt())) {
                                            categories.add(val.item!.id),
                                          }
                                        },
                                        onSubmit: (String val) => {
                                          if (categoriesList.where((element) => element.name == val).isNotEmpty) {
                                            if (!categories.contains(categoriesList.firstWhere((element) => element.name == val).id))
                                            categories.add(categoriesList.firstWhere((element) => element.name == val).id),
                                          }
                                         // Same as above but after confirmation from keyboard
                                        }
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          if (categories.length > 0)
                            SizedBox(
                              height: 200,
                              child: GridView.builder(
                                physics: ScrollPhysics(),
                                  itemCount: categories.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 12.0 / 4.0,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return CategoryListItem(
                                        categoriesList.firstWhere((element) => element.id == categories[index]).id,
                                        categoriesList.firstWhere((element) => element.id == categories[index]).name,
                                        _removeItemFromCategoryList);
                                  }
                              ),
                            ),
                          TextButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size.fromHeight(10)),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xffcf4e6c)),
                            ),
                            onPressed: () async {
                              var thisUserDetails = users.firstWhere(
                                  (element) => element.uid == auth.uid);
                              if (thisUserDetails.postalCode != '' &&
                                  thisUserDetails.address != '' &&
                                  thisUserDetails.country != '' &&
                                  thisUserDetails.phone != 0 &&
                                  thisUserDetails.age != 0 &&
                                  thisUserDetails.surname != '' &&
                                  thisUserDetails.city != '' &&
                                  thisUserDetails.name != '') {
                                if (_formKey.currentState!.validate()) {
                                  if (state != '') {
                                    if (imgPath != '') {
                                      products
                                          .sort((a, b) => a.id.compareTo(b.id));
                                      storage.uploadFile((products.last.id + 1),
                                          imgPath, '0_' + name);

                                      database.updateProductData(
                                          (products.last.id + 1).toInt(),
                                          name,
                                          description,
                                          price.toDouble(),
                                          0,
                                          auth.uid,
                                          categories,
                                          quantity,
                                          state);
                                      setState(() {
                                        error = 'Successfully added product';
                                      });
                                    } else {
                                      setState(() {
                                        error = 'Add Photo';
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      error = 'Choose state';
                                    });
                                  }
                                }
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text("Update Personal Data"),
                                        content: const Text(
                                            "To add offer you need to specify your personal data first."),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, 'Cancel');
                                              },
                                              child: const Text('Back')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PersonalDataForm()));
                                              },
                                              child:
                                                  const Text('Personal Data'))
                                        ],
                                      );
                                    });
                              }
                            },
                            child: Text(
                              'Create offer',
                              style: TextStyle(
                                  color: const Color(0xffffffff), fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )
                  ]))
                ],
              ),
            ),
          ),
        ));
  }
}
