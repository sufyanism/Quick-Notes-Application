import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

class StorageService{

  static const String key = 'NOTES LIST';

  Future<List<Note>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if(data == null) return[];
    return Note.decode(data);
  }

  Future<void> saveNotes(List<Note>notes)  async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, Note.encode(notes));
  }

}