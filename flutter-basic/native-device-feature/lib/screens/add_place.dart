import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:native_feature/widgets/image_input.dart';
import 'package:native_feature/widgets/location_input.dart';
import 'dart:io';

import '../providers/user_places.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _pickedImage == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredTitle, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add a New Place',
          ),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ImageInput(
                onSelectImage: _selectImage,
              ),
              const SizedBox(
                height: 10,
              ),
              LocationInput(),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: _savePlace,
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text(
                  'Add Place',
                ),
              ),
            ])));
  }
}
