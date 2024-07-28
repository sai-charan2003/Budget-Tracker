import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:async' as async;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:budget_tracker/Assets/Constants.dart' as Constants;
import 'package:path/path.dart' as path;
part 'database.g.dart';

class BudgetTrackerItems extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get money => text().nullable()();
  TextColumn get incomeOrExpense => text().nullable()();
  DateTimeColumn get createdAt => dateTime().nullable()();
  TextColumn get imageURL => text().nullable()();
  TextColumn get title => text().nullable()();
  BoolColumn get isBoolean => boolean().nullable()();
  TextColumn get description => text().nullable()();
}

class CategoryItems extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryName => text().nullable()();
  TextColumn get emojiName => text().nullable()();
}



@DriftDatabase(tables : [BudgetTrackerItems,CategoryItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m ) async{
      await m.createTable(budgetTrackerItems);
          await m.createTable(categoryItems);
          await prePopulateCategoryData();
    },
    onUpgrade: (Migrator m , int from , int to) async{
      if(from < 2){
        await m.createTable(categoryItems);
      }
    },
  );

Stream<List<BudgetTrackerItem>> getAllData() {
  return  (select(budgetTrackerItems)).watch();
 
}
  Future<int> insertData(BudgetTrackerItemsCompanion entity) async{
    return await into(budgetTrackerItems).insert(entity);
  }

  Future<List<CategoryItem>> getAllCategories() async{
    return await select(categoryItems).get();
  }

  Future<int> insertCategoryList(CategoryItemsCompanion entity) async{
    return await into(categoryItems).insert(entity);
  }

  Stream<List<BudgetTrackerItem>> getIncomeMoney() {
    final query = select(budgetTrackerItems)..where((filter) => filter.incomeOrExpense.equals(Constants.INCOME));
  return query.watch();
  }
  Stream<List<BudgetTrackerItem>> getExpenseMoney() {
    final query = select(budgetTrackerItems)..where((filter) => filter.incomeOrExpense.equals(Constants.EXPENSE));
    return query.watch();
  }

  Future<void> prePopulateCategoryData() async{
    final prePopulateCategoryData = [
      const CategoryItemsCompanion(
        categoryName: Value('Salary'),
        emojiName: Value('salary.png')
      ),
      const CategoryItemsCompanion(
        categoryName: Value('Food'),
        emojiName: Value('food.png')
      ),
      const CategoryItemsCompanion(
        categoryName: Value('Gift'),
        emojiName: Value('gift.png')
      ),
      const CategoryItemsCompanion(
        categoryName: Value('Travel'),
        emojiName: Value('travel.png')
      )
    ];
    for(var category in prePopulateCategoryData){
      await insertCategoryList(category);
    }

  }

}

LazyDatabase _openConnection() {

  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'budgetTracker.sqlite'));
    if (Platform.isAndroid){
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    return NativeDatabase(file);


  });
  

}