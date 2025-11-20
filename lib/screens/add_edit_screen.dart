import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/note_model.dart';
import '../provider/notes_provider.dart';

class AddEditScreen extends ConsumerStatefulWidget {
  final Note? note;

  const AddEditScreen({super.key, this.note});

  @override
  ConsumerState<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends ConsumerState<AddEditScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? "");
    contentController = TextEditingController(text: widget.note?.content ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Note" : "Add Note"),
        actions: [
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await ref.read(notesProvider.notifier)
                    .deleteNote(widget.note!.id);
                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: "Title"),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                decoration: const InputDecoration(hintText: "Content"),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final title = titleController.text.trim();
                final content = contentController.text.trim();

                if (isEditing) {
                  await ref
                      .read(notesProvider.notifier)
                      .updateNote(widget.note!.id, title, content);
                } else {
                  await ref
                      .read(notesProvider.notifier)
                      .addNote(title, content);
                }
                Navigator.pop(context);
              },
              child: Text(isEditing ? "Save Changes" : "Add Note"),
            ),
          ],
        ),
      ),
    );
  }
}
