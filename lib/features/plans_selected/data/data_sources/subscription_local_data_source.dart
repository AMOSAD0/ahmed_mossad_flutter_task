import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/subscription_package_model.dart';

class SubscriptionLocalDataSource {
  static final SubscriptionLocalDataSource _instance =
      SubscriptionLocalDataSource._internal();
  factory SubscriptionLocalDataSource() => _instance;

  SubscriptionLocalDataSource._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    final path = join(await getDatabasesPath(), 'subscription.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
         CREATE TABLE subscription_packages (
        id TEXT PRIMARY KEY,
        name TEXT,
        price INTEGER,
        currency TEXT,
        validityDays INTEGER,
        subscribersCount INTEGER,
        features TEXT,
        badge TEXT
      )
        ''');

        await _insertMockData(db);
      },
    );
    return _database!;
  }

  Future<void> _insertMockData(Database db) async {
    final mockPackages = _getMockPackages();

    for (final package in mockPackages) {
      final model = SubscriptionPackageModel(
        id: package.id,
        name: package.name,
        price: package.price,
        currency: package.currency,
        validityDays: package.validityDays,
        subscribersCount: package.subscribersCount,
        features: package.features,
        badge: package.badge,
      );
      await db.insert(
        'subscription_packages',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<SubscriptionPackageModel>> getAllPackages() async {
    final db = await database;
    final maps = await db.query('subscription_packages');
    return maps.map((m) => SubscriptionPackageModel.fromMap(m)).toList();
  }

  Future<void> clearPackages() async {
    final db = await database;
    await db.delete('subscription_packages');
  }

  List<SubscriptionPackageModel> _getMockPackages() {
    return [
      SubscriptionPackageModel(
        id: '1',
        name: 'أساسية',
        price: 3000,
        currency: 'ج.م',
        validityDays: 30,
        subscribersCount: 0,
        features: ['صلاحية الأعلان 30 يوم'],
      ),
      SubscriptionPackageModel(
        id: '2',
        name: 'أكسترا',
        price: 3000,
        currency: 'ج.م',
        validityDays: 30,
        subscribersCount: 7,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 3 أيام',
          'تثبيت فى مقاول صحى خلال ال48 ساعة القادمة',
        ],
      ),
      SubscriptionPackageModel(
        id: '3',
        name: 'بلس',
        price: 3000,
        currency: 'ج.م',
        validityDays: 30,
        subscribersCount: 18,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 3 أيام',
          'تثبيت فى مقاول صحى خلال ال48 ساعة القادمة',
          'ظهور فى كل محافظات مصر',
          'اعلان مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت في مقابل صبحي',
          'تثبيت فى مقاول صحى خلال ال48 ساعة القادمة',
        ],
        badge: 'أفضل قيمة مقابل سعر',
      ),
      SubscriptionPackageModel(
        id: '4',
        name: 'سوبر',
        price: 3000,
        currency: 'ج.م',
        validityDays: 30,
        subscribersCount: 24,
        features: [
          'صلاحية الأعلان 30 يوم',
          'رفع لأعلى القائمة كل 3 أيام',
          'تثبيت فى مقاول صحى خلال ال48 ساعة القادمة',
          'ظهور فى كل محافظات مصر',
          'اعلان مميز',
          'تثبيت فى مقاول صحى فى الجهراء',
          'تثبيت في مقابل صبحي',
          'تثبيت فى مقاول صحى خلال ال48 ساعة القادمة',
        ],
      ),
    ];
  }
}
