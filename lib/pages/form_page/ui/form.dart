import 'package:contac_form_app/pages/form_page/bloc/form_page_bloc.dart';
import 'package:contac_form_app/utils/colors.dart';
import 'package:contac_form_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:contac_form_app/routes/route_constants.dart';

class FormClass extends StatefulWidget {
  const FormClass({super.key});

  @override
  State<FormClass> createState() => _FormClassState();
}

class _FormClassState extends State<FormClass> {
  // instance o a formPage BloC
  FormPageBloc formPageBloc = FormPageBloc();

  // global key of type form state to validate each field in the form
  final contactFormKey = GlobalKey<FormState>();

  // string to pass parameters form TextFormField
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String phoneNo = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        // key for the contact form to validate data
        key: contactFormKey,
        child:
            // listview for all TextFormFields
            ListView(
          padding:
              const EdgeInsets.only(top: 150, left: 15, right: 15, bottom: 20),
          children: [
            Center(
              // Text widget to display Headline
              child: Text(
                'Fill the details',
                style: headlineTextStyle,
              ),
            ),
            // sizedbox for spacing between Textformfield
            const SizedBox(
              height: 70,
            ),
            TextFormField(
              // key for particular TextFormField
              key: const ValueKey('firstName'),
              validator: (value) {
                // validations for First Name
                if (value!.isEmpty) {
                  return 'First Name should not be empty';
                } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(
                    value)) // r =raw string , ^ =start of string ,[] = range of charters to accept for regular expression, $ = end of string
                {
                  return 'First Name should not contain digits or special characters';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                // assign textFormField value to firstName string when it gets saved
                firstName = value ?? '';
              },
              // name-Textinput type of keyboard for accepting values
              keyboardType: TextInputType.name,
              cursorColor: ColorsTheme()
                  .cursorColor, // constant colour for the cursor of TextFormField
              // decoration for the TextFormField is enabled and focused mode
              decoration: InputDecoration(
                focusedBorder: textFormFieldFocusedBorder,
                enabledBorder: textFormFieldEnabledBorder,
                labelText: 'First Name', // label for TextFormField
                floatingLabelStyle:
                    focusedlabeltextStyle, // constant style for floating label
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // key for particular TextFormField
              key: const ValueKey('lastName'),
              // validations
              validator: (value) {
                if (value == '') {
                  return null;
                } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(
                    value!)) // r =raw string , ^ =start of string , [] = range of charters to accept for regular expression, $ = end of string
                {
                  return 'Last Name should not contain digits or special characters';
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                lastName = value ?? ''; // assigning value to lastName string
              },
              // anme type of keyboard
              keyboardType: TextInputType.name,
              //cursor Colour
              cursorColor: ColorsTheme().cursorColor,
              // decoration for textFormField
              decoration: InputDecoration(
                focusedBorder: textFormFieldFocusedBorder,
                enabledBorder: textFormFieldEnabledBorder,
                labelText: 'Last Name',
                floatingLabelStyle: focusedlabeltextStyle,
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // key for particular TextFormField
              key: const ValueKey('phoneNo'),
              initialValue: '+91 ',
              validator: (value) {
                if (!RegExp(
                        r'^((\+|0{0,2})91(\s*[\ | \-]\s*)?|[0]?)?[789]\d{9}$')
                    .hasMatch(value!)) {
                  // Regular expression for format of mobile numbers in india
                  // numbers can start with '0' or '00' or '+91' or '91'
                  // there can be '-' or ' '(space) after the initial value
                  // mobile number should start with 7 or 8 or 9
                  // after that there should be 9 digits in mobile number
                  return 'Enter a valid phone number';
                } else {
                  return null;
                }
              },
              // save phone number value to the string
              onSaved: (value) {
                phoneNo = value ?? '';
              },
              // keyboard with only digits will be displayed on screen
              keyboardType: TextInputType.phone,
              // cursor for the textfield
              cursorColor: ColorsTheme().cursorColor,
              // border and label decoration of the TextFormfield
              decoration: InputDecoration(
                focusedBorder: textFormFieldFocusedBorder,
                enabledBorder: textFormFieldEnabledBorder,
                labelText: 'Phone Number',
                floatingLabelStyle: (TextFormField().enabled)
                    ? enabledlabeltextStyle
                    : enabledlabeltextStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              // key for particular TextFormField
              key: const ValueKey('email'),
              validator: (value) {
                if (value == '') {
                  return null;
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                    .hasMatch(value!)) {
                  //Regular expression should contain only '-' or '_' or '.' along with words befor @
                  // then one @ sign in email
                  // after @ sign 2 to 4 words with '-','_' and '.'
                  return 'Invalid Email';
                } else {
                  return null;
                }
              },

              // save email value to the particular string
              onSaved: (value) {
                email = value ?? '';
              },
              // keyboard of type @ in it
              keyboardType: TextInputType.emailAddress,
              // colour and decoartion for the cursor and TextFormField
              cursorColor: ColorsTheme().cursorColor,
              decoration: InputDecoration(
                focusedBorder: textFormFieldFocusedBorder,
                enabledBorder: textFormFieldEnabledBorder,
                labelText: 'Email',
                floatingLabelStyle: focusedlabeltextStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              key: const ValueKey('address'),
              validator: (value) {
                // address should not have more than 90 letters
                if (value!.length > 90) {
                  return 'Too Large Address';
                } else {
                  return null;
                }
              },
              // save address value to the particular string
              onSaved: (value) {
                address = value ?? '';
              },
              // 3 lines for the input of address
              maxLines: 3,
              // keyboard type for address
              keyboardType: TextInputType.multiline,

              // cursor colour and input decoration of TextFormField
              cursorColor: ColorsTheme().cursorColor,
              decoration: InputDecoration(
                focusedBorder: textFormFieldFocusedBorder,
                enabledBorder: textFormFieldEnabledBorder,
                labelText: 'Address',
                floatingLabelStyle: focusedlabeltextStyle,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // button to submit data
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) =>
                    ColorsTheme().elevatedButtonBgColor), // bgColor for button
              ),
              onPressed: () {
                // validate all fields of Form
                final isValid = contactFormKey.currentState!
                    .validate(); // validate alll fields of the form

                if (isValid) {
                  // if all fields are valid , pass contact details to BloC which will push data on Cloud firestore
                  contactFormKey.currentState!.save();
                  formPageBloc.add(
                    AddContactDataEvent(
                        firstName, lastName, email, address, phoneNo),
                  );
                  // Route to Submitted page
                  context.goNamed(FormAppconstants.exitRouteName);
                } else {
                  // display snack bar if any error occured
                  SnackBar(
                    content: Text(
                      'Invalid input',
                      style: buttonTextStyle,
                    ),
                  );
                }
              },
              // text for the submit button
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
