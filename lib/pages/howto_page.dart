import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plant_app/core/init/lang/locale_keys.g.dart';

class HowTo extends StatelessWidget {
  const HowTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.instructions.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 85,
                backgroundImage: AssetImage('assets/images/tiny_plant.jpg'), 
              ),
            ),
            buildInstructionSection(
              icon: Icons.forest,
              title: LocaleKeys.howtouse.tr(),
              description: "${LocaleKeys.firstplantname.tr()}\n${LocaleKeys.secondplanttype.tr()}\n${LocaleKeys.thirdplantphoto.tr()}\n${LocaleKeys.fourthcreate.tr()}"
                  
            ),
            const SizedBox(height: 20),
            buildInstructionSection(
              icon: Icons.info,
              title: LocaleKeys.whyuse.tr(),
              description: LocaleKeys.why.tr()
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInstructionSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(description),
      ],
    );
  }
}