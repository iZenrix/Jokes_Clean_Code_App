import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/modules/setting/controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Notification Time'),
      ),
      body: Obx(
        () => Center(
          child: controller.isLoading.value
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            'Selected Time: ${controller.selectedTime.value?.format(context) ?? 'Anda belum memilih waktu'}',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => controller.selectTime(context),
                      icon: const Icon(Icons.access_time),
                      label: const Text(
                        'Select Time',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textStyle:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        iconColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => controller.cancelAllNotifications(),
                      icon: const Icon(Icons.cancel),
                      label: const Text(
                        'Cancel All Notifications',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        textStyle:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        backgroundColor: Colors.red,
                        iconColor: Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
