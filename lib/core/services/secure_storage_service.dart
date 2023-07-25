import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class SecureStorageService {
  SecureStorageService({required this.storage});

  final FlutterSecureStorage storage;

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<Option<Map<String, String>>> readAll() async {
    return optionOf(await storage.readAll());
  }

  Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<void> write(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  Future<bool> contains(String key) async {
    return await storage.containsKey(key: key);
  }
}
