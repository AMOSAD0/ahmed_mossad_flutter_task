import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductLocalDataSource {
  static const _databaseName = 'app_database.db';
  static const _databaseVersion = 1;

  static final ProductLocalDataSource instance =
      ProductLocalDataSource._internal();
  static Database? _database;

  ProductLocalDataSource._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE subcategories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_url TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image_url TEXT,
        price REAL NOT NULL,
        is_discounted INTEGER NOT NULL DEFAULT 0,
        discount REAL DEFAULT 0.0,
        sold_count INTEGER DEFAULT 0,
        category_id INTEGER,
        subcategory_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id),
        FOREIGN KEY (subcategory_id) REFERENCES subcategories (id)
      )
    ''');

    await _insertInitialData(db);
  }

  Future<void> _insertInitialData(Database db) async {
    final categories = ['كل العروض', 'ملابس', 'إكسسوارات', 'الكترونيات'];
    for (var name in categories) {
      await db.insert('categories', {'name': name});
    }

    final subcategories = [
      {'name': 'موضة رجالي', 'image_url': 'assets/png/men.png'},
      {'name': 'ساعات', 'image_url': 'assets/png/watch.png'},
      {'name': 'موبايلات', 'image_url': 'assets/png/phon.png'},
      {'name': 'منتجات تجميل', 'image_url': 'assets/png/mackup.png'},
    ];
    for (var subcategory in subcategories) {
      await db.insert('subcategories', subcategory);
    }

    final products = [
      {
        'name': 'ساعة يد كلاسيك',
        'image_url': 'assets/png/watch.png',
        'price': 450.0,
        'is_discounted': 1,
        'discount': 15.0,
        'sold_count': 120,
        'category_id': 3,
        'subcategory_id': 2,
      },
      {
        'name': 'تيشيرت رجالي',
        'image_url': 'assets/png/jack.png',
        'price': 250.0,
        'is_discounted': 0,
        'discount': 0.0,
        'sold_count': 300,
        'category_id': 2,
        'subcategory_id': 1,
      },
      {
        'name': 'موبايل Galaxy S24',
        'image_url': 'assets/png/phon.png',
        'price': 3500.0,
        'is_discounted': 1,
        'discount': 10.0,
        'sold_count': 75,
        'category_id': 4,
        'subcategory_id': 3,
      },
    ];

    for (var p in products) {
      await db.insert('products', p);
    }
  }

  Future<List<Map<String, dynamic>>> getAllProducts() async {
    final db = await database;
    return await db.query('products');
  }
}
