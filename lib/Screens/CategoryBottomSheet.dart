import 'package:budget_tracker/Database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categorybottomsheet extends StatefulWidget {
  const Categorybottomsheet({super.key});

  @override
  State<Categorybottomsheet> createState() => _CategorybottomsheetState();
}

class _CategorybottomsheetState extends State<Categorybottomsheet> {
  late List<CategoryItem> category_items;
  late AppDatabase _db;
  @override
  void initState() {
    _db = AppDatabase();
    
    super.initState();
  }

  Future<List<CategoryItem>> _fetchCategory() async{
    return await _db.getAllCategories();
  }
  
  @override
  
  

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CategoryItem>>(
        future: _fetchCategory(),
        builder: (context , snapshots) {
          if(snapshots.hasData){
            return ListView.builder(
              itemCount: snapshots.data?.length,
              itemBuilder: (BuildContext context, int index){               
                
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(snapshots.data?[index].categoryName ?? '',style: Theme.of(context).textTheme.titleLarge,),
                      Image.asset('assets/images/${snapshots.data?[index].emojiName}',width:40)
                    ],
                    
                  ),
                );

              },
              );
          } else{
            return Container();
          }
        },
        )
    );
  }
}