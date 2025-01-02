import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/cache_manager_mixin.dart';
import 'package:jokes_app/app/service/notification_service.dart';

class SettingController extends GetxController with CacheManager {
  late NotificationService notificationService;
  var selectedTime = Rx<TimeOfDay?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    notificationService = NotificationService();
    var notificationTime = getNotificationTime();
    selectedTime.value = notificationTime != null
        ? TimeOfDay(
            hour: notificationTime.hour,
            minute: notificationTime.minute)
        : null;
    log('Selected time: ${selectedTime.value?.format(Get.context!)}');
    super.onInit();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;

      // Convert TimeOfDay to DateTime for scheduling
      final now = DateTime.now();
      var scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      // If the time is in the past, schedule it for tomorrow
      if (scheduledTime.isBefore(now)) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }

      log('Scheduled time: $scheduledTime');

      try{
        isLoading.value = true;

        await notificationService.scheduleNotification(scheduledTime);

        log('Notification scheduled for ${picked.format(context)}');

        await saveNotificationTime(scheduledTime);

        isLoading.value = false;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification scheduled for ${picked.format(context)}'),
          ),
        );
      } catch (e) {
        log('Error scheduling notification: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error scheduling notification'),
          ),
        );
        return;
      }
    }
  }

  Future<void> cancelAllNotifications() async {
    isLoading.value = true;

    await notificationService.cancelAllNotifications();
    await removeNotificationTime();
    selectedTime.value = null;

    isLoading.value = false;
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text('All notifications canceled'),
      ),
    );
  }
}
