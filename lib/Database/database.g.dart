// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BudgetTrackerItemsTable extends BudgetTrackerItems
    with TableInfo<$BudgetTrackerItemsTable, BudgetTrackerItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetTrackerItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<String> money = GeneratedColumn<String>(
      'money', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _incomeOrExpenseMeta =
      const VerificationMeta('incomeOrExpense');
  @override
  late final GeneratedColumn<String> incomeOrExpense = GeneratedColumn<String>(
      'income_or_expense', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _imageURLMeta =
      const VerificationMeta('imageURL');
  @override
  late final GeneratedColumn<String> imageURL = GeneratedColumn<String>(
      'image_u_r_l', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isBooleanMeta =
      const VerificationMeta('isBoolean');
  @override
  late final GeneratedColumn<bool> isBoolean = GeneratedColumn<bool>(
      'is_boolean', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_boolean" IN (0, 1))'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        money,
        incomeOrExpense,
        createdAt,
        imageURL,
        title,
        isBoolean,
        description
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_tracker_items';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetTrackerItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    }
    if (data.containsKey('income_or_expense')) {
      context.handle(
          _incomeOrExpenseMeta,
          incomeOrExpense.isAcceptableOrUnknown(
              data['income_or_expense']!, _incomeOrExpenseMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('image_u_r_l')) {
      context.handle(_imageURLMeta,
          imageURL.isAcceptableOrUnknown(data['image_u_r_l']!, _imageURLMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('is_boolean')) {
      context.handle(_isBooleanMeta,
          isBoolean.isAcceptableOrUnknown(data['is_boolean']!, _isBooleanMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetTrackerItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetTrackerItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}money']),
      incomeOrExpense: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}income_or_expense']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
      imageURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_u_r_l']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      isBoolean: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_boolean']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $BudgetTrackerItemsTable createAlias(String alias) {
    return $BudgetTrackerItemsTable(attachedDatabase, alias);
  }
}

class BudgetTrackerItem extends DataClass
    implements Insertable<BudgetTrackerItem> {
  final int id;
  final String? money;
  final String? incomeOrExpense;
  final DateTime? createdAt;
  final String? imageURL;
  final String? title;
  final bool? isBoolean;
  final String? description;
  const BudgetTrackerItem(
      {required this.id,
      this.money,
      this.incomeOrExpense,
      this.createdAt,
      this.imageURL,
      this.title,
      this.isBoolean,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || money != null) {
      map['money'] = Variable<String>(money);
    }
    if (!nullToAbsent || incomeOrExpense != null) {
      map['income_or_expense'] = Variable<String>(incomeOrExpense);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || imageURL != null) {
      map['image_u_r_l'] = Variable<String>(imageURL);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || isBoolean != null) {
      map['is_boolean'] = Variable<bool>(isBoolean);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  BudgetTrackerItemsCompanion toCompanion(bool nullToAbsent) {
    return BudgetTrackerItemsCompanion(
      id: Value(id),
      money:
          money == null && nullToAbsent ? const Value.absent() : Value(money),
      incomeOrExpense: incomeOrExpense == null && nullToAbsent
          ? const Value.absent()
          : Value(incomeOrExpense),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      imageURL: imageURL == null && nullToAbsent
          ? const Value.absent()
          : Value(imageURL),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      isBoolean: isBoolean == null && nullToAbsent
          ? const Value.absent()
          : Value(isBoolean),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory BudgetTrackerItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetTrackerItem(
      id: serializer.fromJson<int>(json['id']),
      money: serializer.fromJson<String?>(json['money']),
      incomeOrExpense: serializer.fromJson<String?>(json['incomeOrExpense']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
      imageURL: serializer.fromJson<String?>(json['imageURL']),
      title: serializer.fromJson<String?>(json['title']),
      isBoolean: serializer.fromJson<bool?>(json['isBoolean']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'money': serializer.toJson<String?>(money),
      'incomeOrExpense': serializer.toJson<String?>(incomeOrExpense),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
      'imageURL': serializer.toJson<String?>(imageURL),
      'title': serializer.toJson<String?>(title),
      'isBoolean': serializer.toJson<bool?>(isBoolean),
      'description': serializer.toJson<String?>(description),
    };
  }

  BudgetTrackerItem copyWith(
          {int? id,
          Value<String?> money = const Value.absent(),
          Value<String?> incomeOrExpense = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent(),
          Value<String?> imageURL = const Value.absent(),
          Value<String?> title = const Value.absent(),
          Value<bool?> isBoolean = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      BudgetTrackerItem(
        id: id ?? this.id,
        money: money.present ? money.value : this.money,
        incomeOrExpense: incomeOrExpense.present
            ? incomeOrExpense.value
            : this.incomeOrExpense,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        imageURL: imageURL.present ? imageURL.value : this.imageURL,
        title: title.present ? title.value : this.title,
        isBoolean: isBoolean.present ? isBoolean.value : this.isBoolean,
        description: description.present ? description.value : this.description,
      );
  @override
  String toString() {
    return (StringBuffer('BudgetTrackerItem(')
          ..write('id: $id, ')
          ..write('money: $money, ')
          ..write('incomeOrExpense: $incomeOrExpense, ')
          ..write('createdAt: $createdAt, ')
          ..write('imageURL: $imageURL, ')
          ..write('title: $title, ')
          ..write('isBoolean: $isBoolean, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, money, incomeOrExpense, createdAt,
      imageURL, title, isBoolean, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetTrackerItem &&
          other.id == this.id &&
          other.money == this.money &&
          other.incomeOrExpense == this.incomeOrExpense &&
          other.createdAt == this.createdAt &&
          other.imageURL == this.imageURL &&
          other.title == this.title &&
          other.isBoolean == this.isBoolean &&
          other.description == this.description);
}

class BudgetTrackerItemsCompanion extends UpdateCompanion<BudgetTrackerItem> {
  final Value<int> id;
  final Value<String?> money;
  final Value<String?> incomeOrExpense;
  final Value<DateTime?> createdAt;
  final Value<String?> imageURL;
  final Value<String?> title;
  final Value<bool?> isBoolean;
  final Value<String?> description;
  const BudgetTrackerItemsCompanion({
    this.id = const Value.absent(),
    this.money = const Value.absent(),
    this.incomeOrExpense = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.imageURL = const Value.absent(),
    this.title = const Value.absent(),
    this.isBoolean = const Value.absent(),
    this.description = const Value.absent(),
  });
  BudgetTrackerItemsCompanion.insert({
    this.id = const Value.absent(),
    this.money = const Value.absent(),
    this.incomeOrExpense = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.imageURL = const Value.absent(),
    this.title = const Value.absent(),
    this.isBoolean = const Value.absent(),
    this.description = const Value.absent(),
  });
  static Insertable<BudgetTrackerItem> custom({
    Expression<int>? id,
    Expression<String>? money,
    Expression<String>? incomeOrExpense,
    Expression<DateTime>? createdAt,
    Expression<String>? imageURL,
    Expression<String>? title,
    Expression<bool>? isBoolean,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (money != null) 'money': money,
      if (incomeOrExpense != null) 'income_or_expense': incomeOrExpense,
      if (createdAt != null) 'created_at': createdAt,
      if (imageURL != null) 'image_u_r_l': imageURL,
      if (title != null) 'title': title,
      if (isBoolean != null) 'is_boolean': isBoolean,
      if (description != null) 'description': description,
    });
  }

  BudgetTrackerItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? money,
      Value<String?>? incomeOrExpense,
      Value<DateTime?>? createdAt,
      Value<String?>? imageURL,
      Value<String?>? title,
      Value<bool?>? isBoolean,
      Value<String?>? description}) {
    return BudgetTrackerItemsCompanion(
      id: id ?? this.id,
      money: money ?? this.money,
      incomeOrExpense: incomeOrExpense ?? this.incomeOrExpense,
      createdAt: createdAt ?? this.createdAt,
      imageURL: imageURL ?? this.imageURL,
      title: title ?? this.title,
      isBoolean: isBoolean ?? this.isBoolean,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (money.present) {
      map['money'] = Variable<String>(money.value);
    }
    if (incomeOrExpense.present) {
      map['income_or_expense'] = Variable<String>(incomeOrExpense.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (imageURL.present) {
      map['image_u_r_l'] = Variable<String>(imageURL.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isBoolean.present) {
      map['is_boolean'] = Variable<bool>(isBoolean.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetTrackerItemsCompanion(')
          ..write('id: $id, ')
          ..write('money: $money, ')
          ..write('incomeOrExpense: $incomeOrExpense, ')
          ..write('createdAt: $createdAt, ')
          ..write('imageURL: $imageURL, ')
          ..write('title: $title, ')
          ..write('isBoolean: $isBoolean, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CategoryItemsTable extends CategoryItems
    with TableInfo<$CategoryItemsTable, CategoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emojiNameMeta =
      const VerificationMeta('emojiName');
  @override
  late final GeneratedColumn<String> emojiName = GeneratedColumn<String>(
      'emoji_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, categoryName, emojiName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_items';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    }
    if (data.containsKey('emoji_name')) {
      context.handle(_emojiNameMeta,
          emojiName.isAcceptableOrUnknown(data['emoji_name']!, _emojiNameMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
      emojiName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}emoji_name']),
    );
  }

  @override
  $CategoryItemsTable createAlias(String alias) {
    return $CategoryItemsTable(attachedDatabase, alias);
  }
}

class CategoryItem extends DataClass implements Insertable<CategoryItem> {
  final int id;
  final String? categoryName;
  final String? emojiName;
  const CategoryItem({required this.id, this.categoryName, this.emojiName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    if (!nullToAbsent || emojiName != null) {
      map['emoji_name'] = Variable<String>(emojiName);
    }
    return map;
  }

  CategoryItemsCompanion toCompanion(bool nullToAbsent) {
    return CategoryItemsCompanion(
      id: Value(id),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
      emojiName: emojiName == null && nullToAbsent
          ? const Value.absent()
          : Value(emojiName),
    );
  }

  factory CategoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryItem(
      id: serializer.fromJson<int>(json['id']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
      emojiName: serializer.fromJson<String?>(json['emojiName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryName': serializer.toJson<String?>(categoryName),
      'emojiName': serializer.toJson<String?>(emojiName),
    };
  }

  CategoryItem copyWith(
          {int? id,
          Value<String?> categoryName = const Value.absent(),
          Value<String?> emojiName = const Value.absent()}) =>
      CategoryItem(
        id: id ?? this.id,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
        emojiName: emojiName.present ? emojiName.value : this.emojiName,
      );
  @override
  String toString() {
    return (StringBuffer('CategoryItem(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName, ')
          ..write('emojiName: $emojiName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryName, emojiName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryItem &&
          other.id == this.id &&
          other.categoryName == this.categoryName &&
          other.emojiName == this.emojiName);
}

class CategoryItemsCompanion extends UpdateCompanion<CategoryItem> {
  final Value<int> id;
  final Value<String?> categoryName;
  final Value<String?> emojiName;
  const CategoryItemsCompanion({
    this.id = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.emojiName = const Value.absent(),
  });
  CategoryItemsCompanion.insert({
    this.id = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.emojiName = const Value.absent(),
  });
  static Insertable<CategoryItem> custom({
    Expression<int>? id,
    Expression<String>? categoryName,
    Expression<String>? emojiName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryName != null) 'category_name': categoryName,
      if (emojiName != null) 'emoji_name': emojiName,
    });
  }

  CategoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? categoryName,
      Value<String?>? emojiName}) {
    return CategoryItemsCompanion(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      emojiName: emojiName ?? this.emojiName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (emojiName.present) {
      map['emoji_name'] = Variable<String>(emojiName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('categoryName: $categoryName, ')
          ..write('emojiName: $emojiName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $BudgetTrackerItemsTable budgetTrackerItems =
      $BudgetTrackerItemsTable(this);
  late final $CategoryItemsTable categoryItems = $CategoryItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [budgetTrackerItems, categoryItems];
}

typedef $$BudgetTrackerItemsTableInsertCompanionBuilder
    = BudgetTrackerItemsCompanion Function({
  Value<int> id,
  Value<String?> money,
  Value<String?> incomeOrExpense,
  Value<DateTime?> createdAt,
  Value<String?> imageURL,
  Value<String?> title,
  Value<bool?> isBoolean,
  Value<String?> description,
});
typedef $$BudgetTrackerItemsTableUpdateCompanionBuilder
    = BudgetTrackerItemsCompanion Function({
  Value<int> id,
  Value<String?> money,
  Value<String?> incomeOrExpense,
  Value<DateTime?> createdAt,
  Value<String?> imageURL,
  Value<String?> title,
  Value<bool?> isBoolean,
  Value<String?> description,
});

class $$BudgetTrackerItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetTrackerItemsTable,
    BudgetTrackerItem,
    $$BudgetTrackerItemsTableFilterComposer,
    $$BudgetTrackerItemsTableOrderingComposer,
    $$BudgetTrackerItemsTableProcessedTableManager,
    $$BudgetTrackerItemsTableInsertCompanionBuilder,
    $$BudgetTrackerItemsTableUpdateCompanionBuilder> {
  $$BudgetTrackerItemsTableTableManager(
      _$AppDatabase db, $BudgetTrackerItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$BudgetTrackerItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$BudgetTrackerItemsTableOrderingComposer(
              ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$BudgetTrackerItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> money = const Value.absent(),
            Value<String?> incomeOrExpense = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<String?> imageURL = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<bool?> isBoolean = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              BudgetTrackerItemsCompanion(
            id: id,
            money: money,
            incomeOrExpense: incomeOrExpense,
            createdAt: createdAt,
            imageURL: imageURL,
            title: title,
            isBoolean: isBoolean,
            description: description,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> money = const Value.absent(),
            Value<String?> incomeOrExpense = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
            Value<String?> imageURL = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<bool?> isBoolean = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              BudgetTrackerItemsCompanion.insert(
            id: id,
            money: money,
            incomeOrExpense: incomeOrExpense,
            createdAt: createdAt,
            imageURL: imageURL,
            title: title,
            isBoolean: isBoolean,
            description: description,
          ),
        ));
}

class $$BudgetTrackerItemsTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $BudgetTrackerItemsTable,
        BudgetTrackerItem,
        $$BudgetTrackerItemsTableFilterComposer,
        $$BudgetTrackerItemsTableOrderingComposer,
        $$BudgetTrackerItemsTableProcessedTableManager,
        $$BudgetTrackerItemsTableInsertCompanionBuilder,
        $$BudgetTrackerItemsTableUpdateCompanionBuilder> {
  $$BudgetTrackerItemsTableProcessedTableManager(super.$state);
}

class $$BudgetTrackerItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $BudgetTrackerItemsTable> {
  $$BudgetTrackerItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get incomeOrExpense => $state.composableBuilder(
      column: $state.table.incomeOrExpense,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageURL => $state.composableBuilder(
      column: $state.table.imageURL,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isBoolean => $state.composableBuilder(
      column: $state.table.isBoolean,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$BudgetTrackerItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $BudgetTrackerItemsTable> {
  $$BudgetTrackerItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get money => $state.composableBuilder(
      column: $state.table.money,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get incomeOrExpense => $state.composableBuilder(
      column: $state.table.incomeOrExpense,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageURL => $state.composableBuilder(
      column: $state.table.imageURL,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isBoolean => $state.composableBuilder(
      column: $state.table.isBoolean,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CategoryItemsTableInsertCompanionBuilder = CategoryItemsCompanion
    Function({
  Value<int> id,
  Value<String?> categoryName,
  Value<String?> emojiName,
});
typedef $$CategoryItemsTableUpdateCompanionBuilder = CategoryItemsCompanion
    Function({
  Value<int> id,
  Value<String?> categoryName,
  Value<String?> emojiName,
});

class $$CategoryItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryItemsTable,
    CategoryItem,
    $$CategoryItemsTableFilterComposer,
    $$CategoryItemsTableOrderingComposer,
    $$CategoryItemsTableProcessedTableManager,
    $$CategoryItemsTableInsertCompanionBuilder,
    $$CategoryItemsTableUpdateCompanionBuilder> {
  $$CategoryItemsTableTableManager(_$AppDatabase db, $CategoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$CategoryItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            Value<String?> emojiName = const Value.absent(),
          }) =>
              CategoryItemsCompanion(
            id: id,
            categoryName: categoryName,
            emojiName: emojiName,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> categoryName = const Value.absent(),
            Value<String?> emojiName = const Value.absent(),
          }) =>
              CategoryItemsCompanion.insert(
            id: id,
            categoryName: categoryName,
            emojiName: emojiName,
          ),
        ));
}

class $$CategoryItemsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $CategoryItemsTable,
    CategoryItem,
    $$CategoryItemsTableFilterComposer,
    $$CategoryItemsTableOrderingComposer,
    $$CategoryItemsTableProcessedTableManager,
    $$CategoryItemsTableInsertCompanionBuilder,
    $$CategoryItemsTableUpdateCompanionBuilder> {
  $$CategoryItemsTableProcessedTableManager(super.$state);
}

class $$CategoryItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $CategoryItemsTable> {
  $$CategoryItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get emojiName => $state.composableBuilder(
      column: $state.table.emojiName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CategoryItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $CategoryItemsTable> {
  $$CategoryItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categoryName => $state.composableBuilder(
      column: $state.table.categoryName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get emojiName => $state.composableBuilder(
      column: $state.table.emojiName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$BudgetTrackerItemsTableTableManager get budgetTrackerItems =>
      $$BudgetTrackerItemsTableTableManager(_db, _db.budgetTrackerItems);
  $$CategoryItemsTableTableManager get categoryItems =>
      $$CategoryItemsTableTableManager(_db, _db.categoryItems);
}
