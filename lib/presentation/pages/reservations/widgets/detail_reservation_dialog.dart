import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tennis_test/core/extensions/generic_extensions.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';
import 'package:flutter_tennis_test/presentation/pages/reservations/widgets/confirm_delete_dialog.dart';

class DetailReservationDialog extends StatelessWidget {
  const DetailReservationDialog({
    super.key,
    required this.reservationModel,
    required this.onDeleteTap,
  });

  final ReservationModel reservationModel;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: Text('Reservation Details'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: reservationModel.courtImageUrl,
              placeholder: (context, url) => const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            reservationModel.courtName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Reserved for: ${reservationModel.dateOfReservation!.formatDateWithHour()}',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Text(
              'Reservation time: ${reservationModel.hoursOfReservation.toString()} hours'),
          Text(
            'Reserved by: ${reservationModel.userName}',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Text(
            'Precipitation Probability: ${reservationModel.precipitationProbability}%',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Text(
            'High Temp: ${reservationModel.maxTemp}%',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          Text(
            'Low Temp: ${reservationModel.minTemp}%',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            onPressed: () => showDialog(
                context: context,
                builder: (context) => ConfirmDeleteDialog(
                      reservationId: reservationModel.id!,
                      onDeleteTap: onDeleteTap,
                    )),
            child: const Text('Delete'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
        )
      ],
    );
  }
}
