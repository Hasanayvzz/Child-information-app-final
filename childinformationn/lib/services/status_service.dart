import 'dart:io';
import 'package:childinformationn/models/status.dart';
import 'package:childinformationn/services/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class StatusService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StorageService _storageService = StorageService();
  String mediaUrl = '';

  Future<void> addStatus(String status, PickedFile pickedFile) async {
    var ref = _firestore.collection("Status");

    if (pickedFile == null) {
      mediaUrl = '';
    } else {
      mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));
    }

    var documentRef = await ref.add({'status': status, 'image': mediaUrl});

    return Status(id: documentRef.id, status: status, image: mediaUrl);
  }

  Stream<QuerySnapshot> getStatus() {
    var ref = _firestore.collection("Status").snapshots();

    return ref;
  }

  Future<void> removeStatus(String docId) {
    var ref = _firestore.collection("Status").doc(docId).delete();

    return ref;
  }
}
