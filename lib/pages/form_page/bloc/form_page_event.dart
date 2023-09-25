part of 'form_page_bloc.dart';

@immutable
sealed class FormPageEvent {}

//Event to add contact to firestore database
class AddContactDataEvent extends FormPageEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String phoneNo;

  AddContactDataEvent(
      this.firstName, this.lastName, this.email, this.address, this.phoneNo);
}
