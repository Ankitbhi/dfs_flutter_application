import 'package:dfs_flutter_application/src/features/registration/provider/profile_page_provider.dart';
import 'package:dfs_flutter_application/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdhaarStatement extends StatefulWidget {
  const AdhaarStatement({super.key});

  @override
  State<AdhaarStatement> createState() => _AdhaarStatementState();
}

class _AdhaarStatementState extends State<AdhaarStatement> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfilePageProvider>(context);

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomInput(
                controller: profileProvider.aadharNameController,
                label: "*Base",
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
