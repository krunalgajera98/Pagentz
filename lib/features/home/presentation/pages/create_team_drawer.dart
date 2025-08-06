import 'package:bndemo/core/values/strings.dart';
import 'package:bndemo/features/home/domain/entities/team_model.dart';
import 'package:bndemo/features/home/presentation/controller/team_controller.dart';
import 'package:bndemo/features/home/presentation/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTeamDrawer extends StatelessWidget {
  final VoidCallback onClose;

  CreateTeamDrawer({required this.onClose});

  final _formKey = GlobalKey<FormState>();
  TeamController controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    // final isMobile = ResponsiveUtils.isMobile(context);
    // final isTablet = ResponsiveUtils.isTablet(context);
    // final width = MediaQuery.of(context).size.width;
    // final drawerWidth =  width * 0.6;
    const drawerWidth = 330.0;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: drawerWidth,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 30,
              color: Color(0x19000000),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onPressed: onClose,
                ),
                const Text(createTeam, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      _label(teamname),
                      CustomTextField(text: providename, ctl: controller.teamNameController),
                      const SizedBox(height: 18),
                      _label(addexistingusers),
                      CustomTextField(text: typename, ctl: controller.existingUsersController),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('OR',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey)),
                          ),
                          Expanded(child: Divider(thickness: 0.5, color: Colors.grey[400])),
                        ],
                      ),
                      const SizedBox(height: 18),
                      _label(inviteNewUsers),
                      _label(email),
                      CustomTextField(text: typeemailinvite, ctl: controller.emailController),
                      const SizedBox(height: 12),
                      _label(firstname),
                      CustomTextField(text: '', ctl: controller.firstNameController),
                      const SizedBox(height: 12),
                      _label(lastname),
                      CustomTextField(text: '', ctl: controller.lastNameController),
                      const SizedBox(height: 12),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        ),
                        child: const Text(addinvitee,
                            style: TextStyle(fontSize: 11, color: Colors.black)),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        noexternalS1,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        rememberS1,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      const Divider(
                        color: Colors.grey,
                        thickness: 0.5,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          OutlinedButton(
                            onPressed: onClose,
                            style: OutlinedButton.styleFrom(
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              side: const BorderSide(color: Colors.grey),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            ),
                            child: const Text(cancel,
                                style: TextStyle(fontSize: 11, color: Colors.black)),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () {
                              controller.teamsList.add(
                                TeamModel(
                                    name:
                                        '${controller.teamNameController.text} ${controller.existingUsersController.text}',
                                    members: '1'),
                              );
                              if (_formKey.currentState?.validate() ?? false) {
                                onClose();
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              side: const BorderSide(color: Colors.grey),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                            ),
                            child: const Text('Add',
                                style: TextStyle(fontSize: 11, color: Colors.black)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6, left: 2),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10)),
      );
}
