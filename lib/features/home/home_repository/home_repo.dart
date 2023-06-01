import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../modals/task_modal.dart';

class TaskRepository {
  static final TaskRepository _instance = TaskRepository._internal();

  factory TaskRepository() => _instance;

  TaskRepository._internal();

  static Database? _database;

  Future<Database> get database async {
     _database = _database ?? await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'tasks.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE tasks (
            id TEXT PRIMARY KEY,
            title TEXT,
            is_done INTEGER,
            description TEXT,
            date_time INTEGER,
            rating INTEGER
          )
        ''');
      },
    );
  }

  Future<List<TaskModal>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');

    return List.generate(maps.length, (i) {
      return TaskModal(
        title: maps[i]['title'],
        isDone: maps[i]['is_done'] == 1,
        description: maps[i]['description'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(maps[i]['date_time']),
        id: maps[i]['id'],
        rating: maps[i]['rating'],
      );
    });
  }

  Future<void> insertTask(TaskModal task) async {
    final db = await database;
    await db.insert(
        'tasks',
        {
          'id': task.id,
          'title': task.title,
          'is_done': task.isDone ? 1 : 0,
          'description': task.description,
          'date_time': task.dateTime.millisecondsSinceEpoch,
          'rating': task.rating,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<void> deleteTask(String taskId) async {
  final db = await database;
  await db.delete(
    'tasks',
    where: 'id = ?',
    whereArgs: [taskId],
  );
}
Future<void> updateTask(TaskModal task) async {
  final db = await database;
  await db.update(
    'tasks',
    {
      'title': task.title,
      'is_done': task.isDone ? 1 : 0,
      'description': task.description,
      'date_time': task.dateTime.millisecondsSinceEpoch,
      'rating': task.rating,
    },
    where: 'id = ?',
    whereArgs: [task.id],
  );
}

}
