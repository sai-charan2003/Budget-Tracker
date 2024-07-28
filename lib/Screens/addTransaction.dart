import 'dart:ffi';
import 'dart:io';

import 'package:budget_tracker/Assets/AppUtils.dart';
import 'package:budget_tracker/Assets/Constants.dart';
import 'package:budget_tracker/Components/PinPad.dart';
import 'package:budget_tracker/Database/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'dart:math';

import 'package:math_expressions/math_expressions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  AddTransaction({super.key, required this.income});
  var income;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late FocusNode _focusNode;
  late TextEditingController amountTextController;
  late TextEditingController titleTextController;
  late List<CategoryItem> category_items;

  CategoryItem? selectedCategoryItem;
  PersistentBottomSheetController? _bottomSheetController;
  ScaffoldFeatureController? _categoryBottomSheetController;
  File? image;

  @override
  void initState() {
    _focusNode = FocusNode();
    amountTextController = TextEditingController();
    titleTextController = TextEditingController();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        showPinPad();
      } else {
        _bottomSheetController?.close();
      }
      setState(() {});
    });
    amountTextController.text = RUPEE;
    super.initState();
  }

  // Future<List<CategoryItem>> _fetchCategory() async {
  //   return await _db.getAllCategories();
  // }

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(AppUtils().getCurrentYear() - 1000),
      lastDate: DateTime(AppUtils().getCurrentYear() + 1000),
    );

    setState(() {
      _selectedDate = picked!;
    });

    _selectTime(context);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _db = Provider.of<AppDatabase>(context);
    
    final String incomeType = widget.income == "EXPENSE" ? 'Expense' : 'Income';
    Parser p = Parser();

    AppUtils appUtils = AppUtils();

    void _addText(String text) {
      amountTextController.text += text;
    }

    void _handleBackButtonPress() {
      FocusScope.of(context).unfocus();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: BackButton(
              onPressed: () {
                _handleBackButtonPress();
              },
            ),
            centerTitle: true,
            title: const Text("Add Transaction"),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: TextField(
                controller: amountTextController,
                maxLines: 1,
                focusNode: _focusNode,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: widget.income == "INCOME"
                        ? Colors.green
                        : Colors.redAccent),
                keyboardType: TextInputType.none,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: colorScheme.onInverseSurface.withOpacity(0.19),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                    gapPadding: 5,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: Text(incomeType + ' Details',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 8, right: 8, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Date",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                AppUtils().formatDateTime(
                                    _selectedDate, _selectedTime),
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onTap: () {
                          showCategorySheet();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 8, right: 8, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Category",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Row(
                                children: [
                                  selectedCategoryItem != null?Image.asset('assets/images/${selectedCategoryItem!.emojiName}',width:20):Container(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      selectedCategoryItem==null?"Select Category":selectedCategoryItem!.categoryName.toString(),
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                            onTap: (){
                              pickImage();
                            },
                        
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 8, right: 8, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Add Attachment",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              image!=null?Image.file(image!,width: 60,):Container()
                              
                            ],
                          ),
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 8, right: 8, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Note",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: TextField(
                                controller: titleTextController,
                                
                                
                                decoration: InputDecoration(
                                  
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: FilledButton(onPressed: () { saveData(_db); Navigator.pop(context);}, child: const Text("Save")),
            ),
          ),
        ],
      ),
    );
  }

  void showPinPad() {
    _bottomSheetController = _scaffoldKey.currentState?.showBottomSheet(
      (BuildContext context) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation);
            return SlideTransition(position: offsetAnimation, child: child);
          },
          child: Pinpad(
            onClick: (value) {
              amountTextController.text += value;
            },
            onBackspace: () {
              if (amountTextController.text.isNotEmpty) {
                if (amountTextController.text != RUPEE) {
                  amountTextController.text = amountTextController.text
                      .substring(0, amountTextController.text.length - 1);
                }
              }
            },
            onClear: () {
              amountTextController.text = RUPEE;
            },
            onEqual: () {
              amountTextController.text =
                  RUPEE + AppUtils().calculate(amountTextController.text);
            },
            onDone: () {
              amountTextController.text =
                  RUPEE + AppUtils().calculate(amountTextController.text);
              _focusNode.unfocus();
            },
          ),
        );
      },
    );
  }

  void showCategorySheet() {
    final _db = Provider.of<AppDatabase>(context);
    showModalBottomSheet<void>(
      useRootNavigator: true,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<List<CategoryItem>>(
          future: _db.getAllCategories(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: snapshots.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          InkWell(
                            customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                            onTap: (){
                              setState(() {
                                selectedCategoryItem = snapshots.data?[index];                                
                              });
                              Navigator.pop(context);
                              
                              
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset('assets/images/${snapshots.data?[index].emojiName}',width:35),
                                  Text(
                                    snapshots.data![index].categoryName ?? "",
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                 
                                ],
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    );
                  },
                ),
              );
            } else if (snapshots.hasError) {
              return Center(
                child: Text(snapshots.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }

  Future<void> pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;     
      
      final imageFile = File(image.path);
      
      setState(() {
        this.image = imageFile;
      });
    } catch(e){
      print(e);
    }

  }

  Future<void> saveData(AppDatabase _db) async{
    
    final imagePath = await saveImage();
    var data = BudgetTrackerItemsCompanion(
      money: drift.Value(AppUtils().removeCurrencySymbol(amountTextController.text)),
      incomeOrExpense: drift.Value(widget.income),
      createdAt: drift.Value(DateTime.now()),
      imageURL: drift.Value(imagePath.toString()),
      title: drift.Value(titleTextController.text),   
    );
    print(data);
    await _db.insertData(data);
    
  }

  Future<File> saveImage() async{
    
    final directory = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final filePath = '${directory.path}/$fileName.png';
      final imageFile = image;
      return  await imageFile!.copy(filePath);
    
  }
}
