import 'package:business_card_app/core/custom/sizes/paddings.dart';
import 'package:business_card_app/core/globals/message.dart';
import 'package:business_card_app/features/home/bloc/home_bloc.dart';
import 'package:business_card_app/features/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/custom/widgets/custom_button.dart';
import '../../../core/custom/widgets/custome_textdield.dart';
import '../../../di.dart';
import '../bloc/home_event.dart';
import '../models/v_card_model.dart';

class UserInfoInputView extends StatefulWidget {
  const UserInfoInputView({super.key});

  @override
  _UserInfoInputViewState createState() => _UserInfoInputViewState();
}

class _UserInfoInputViewState extends State<UserInfoInputView> {

  // Controllers for the input fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // Store the generated vCard QR code
  String? vCardData;

  // Function to generate vCard string
  String generateVCard({
    required String name,
    required String jobTitle,
    required String phone,
    required String email,
    required String address,
  }) {
    return '''
BEGIN:VCARD
VERSION:3.0
FN:$name
TITLE:$jobTitle
TEL;TYPE=CELL:$phone
EMAIL:$email
ADR;TYPE=WORK:$address
END:VCARD
''';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is VCardOperationSuccess) {
          clearTextFields();
          showMessage('vCard created successfully');
          // go back to the previous screen

          //context.read<HomeBloc>().add(FetchVCards());

          Future.delayed(const Duration(seconds: 2), () => Navigator.pop(context));
        }
        if (state is VCardError) {
          showMessage('Error creating vCard, please try again');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create vCard',),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom text fields for user input
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                  ),
                  20.ph,
                  CustomTextField(
                    controller: jobTitleController,
                    hintText: 'Enter your job title',
                  ),
                  20.ph,
                  CustomTextField(
                    controller: phoneController,
                    hintText: 'Enter your phone number',
                  ),
                  20.ph,
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),
                  20.ph,
                  CustomTextField(
                    controller: addressController,
                    hintText: 'Enter your address',
                    textInputAction: TextInputAction.done,
                  ),
                  40.ph,
                  // Button to generate QR code
                  CustomButton(
                    isLoading: state is VCardLoading,
                    onPressed: () async {
                      // check if any of the fields is empty
                      if (nameController.text.isEmpty ||
                          jobTitleController.text.isEmpty ||
                          phoneController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          addressController.text.isEmpty) {
                        showMessage('Please fill all fields');
                        return;
                      }

                      vCardData = generateVCard(
                        name: nameController.text,
                        jobTitle: jobTitleController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        address: addressController.text,
                      );

                      // Save the vCard to Hive
                      saveVCard();
                    },
                    text: 'Create',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> saveVCard() async {
    try {
      final VCardModel vCard = VCardModel(
        name: nameController.text,
        jobTitle: jobTitleController.text,
        phone: phoneController.text,
        email: emailController.text,
        address: addressController.text,
        qrCodeUrl: vCardData!,
        profileImageUrl: '',
      );

      context.read<HomeBloc>().add(AddVCard(vCard));

      // // check if the vCard key(phone) already exists, then update it
      // Box<VCardModel> vCardBox = sl<Box<VCardModel>>();
      // if (vCardBox.containsKey(vCard.phone)) {
      //   await vCardBox.put(vCard.phone, vCard);
      // } else {
      //   await vCardBox.add(vCard);
      // }
      // clearTextFields();
      // setState(() {
      //   loading = false;
      // });
    } catch (e) {
      debugPrint('Error saving vCard: $e');
    }
  }

  void clearTextFields() {
    nameController.clear();
    jobTitleController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
  }
}
