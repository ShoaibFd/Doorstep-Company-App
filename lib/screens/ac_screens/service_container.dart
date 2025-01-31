import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/divider.dart';
import '../subcategory_screens/Widgets/service_container_widget.dart';

class ServicesSection extends StatelessWidget {
  final GlobalKey superSaverKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey repairGasKey = GlobalKey();
  final GlobalKey installationKey = GlobalKey();

  ServicesSection({super.key});

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.px),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            appText(
              'Select Your Services',
              fontSize: 18.px,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_downward_rounded),
          ],
        ),
        SizedBox(height: 20.px),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ServiceContainerWidget(
                title: 'Super saver\npackages',
                onTap: () => scrollToSection(superSaverKey),
                image: 'assets/images/service.png',
              ),
              const SizedBox(width: 10),
              ServiceContainerWidget(
                title: 'Services\n',
                onTap: () => scrollToSection(servicesKey),
                image: 'assets/images/service.png',
              ),
              const SizedBox(width: 10),
              ServiceContainerWidget(
                title: 'Repair &\ngas refill',
                onTap: () => scrollToSection(repairGasKey),
                image: 'assets/images/service.png',
              ),
              const SizedBox(width: 10),
              ServiceContainerWidget(
                title: 'Installation &\nUninstallation',
                onTap: () => scrollToSection(installationKey),
                image: 'assets/images/service.png',
              ),
            ],
          ),
        ),
        SizedBox(height: 10.px),
        div(),
      ],
    );
  }

  Widget _buildSection(String title, GlobalKey key) {
    return Container(
      key: key,
      width: double.infinity,
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: appText(title, fontSize: 16.px),
    );
  }
}
