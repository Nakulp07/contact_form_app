import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

part 'form_page_event.dart';
part 'form_page_state.dart';

class FormPageBloc extends Bloc<FormPageEvent, FormPageState> {
  // created instance of firestore
  final _firestore = FirebaseFirestore.instance;

  FormPageBloc() : super(FormPageInitial()) {
    on<AddContactDataEvent>(addContactDataEvent);
  }

  // function to add data to cloud Firestore
  FutureOr<void> addContactDataEvent(
      AddContactDataEvent event, Emitter<FormPageState> emit) async {
    try {
      // passing data to firestore 'contacts' collection with mentioned fields
      _firestore.collection('contacts').add(
        {
          'firstName': event.firstName,
          'lastName': event.lastName,
          'email': event.email,
          'phoneNumber': event.phoneNo,
          'address': event.address
        },
      );
    } catch (e) {
      // show snackbar if any error while adding contact to firestore
      const SnackBar(
        content: Text('something went wrong while adding data to firestore !!'),
      );
    }
  }
}
