import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/note_model.dart';
import '../services/storage_service.dart';

final storageServiceProvider = Provider((ref) => StorageService());

final searchQueryProvider = StateProvider<String>((ref) => "");

final notesProvider = StateNotifierProvider<NotesViewModel, List<Note>>((ref) {
  final storage = ref.read(storageServiceProvider);
  return NotesViewModel(storage)..loadNotes();
});

class NotesViewModel extends StateNotifier<List<Note>> {
  final StorageService storage;
  final uuid = const Uuid();

  NotesViewModel(this.storage) : super([]);

  Future<void> loadNotes() async {
    state = await storage.getNotes();
  }

  Future<void> addNote(String title, String content) async {
    final newNote = Note(
      id: uuid.v4(),
      title: title,
      content: content,
      createdAt: DateTime.now(),
    );
    state = [...state, newNote];
    await storage.saveNotes(state);
  }

  Future<void> updateNote(String id, String title, String content) async {
    state = [
      for (final note in state)
        if (note.id == id)
          Note(id: id, title: title, content: content, createdAt: note.createdAt)
        else
          note
    ];
    await storage.saveNotes(state);
  }

  Future<void> deleteNote(String id) async {
    state = state.where((n) => n.id != id).toList();
    await storage.saveNotes(state);
  }
}

final filteredNotesProvider = Provider<List<Note>>((ref) {
  final notes = ref.watch(notesProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase();

  if (query.isEmpty) return notes;

  return notes.where((note) {
    return note.title.toLowerCase().contains(query) ||
        note.content.toLowerCase().contains(query);
  }).toList();
});
