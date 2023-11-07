import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tennis_test/core/extensions/generic_extensions.dart';
import 'package:flutter_tennis_test/domain/models/reservation/reservation_model.dart';

class ReservationListItem extends StatelessWidget {
  const ReservationListItem({
    super.key,
    required this.reservationModel,
    required this.onReservationTap,
    required this.onDeleteTap,
  });

  final ReservationModel reservationModel;
  final Function(ReservationModel reservationModel) onReservationTap;
  final Function(int reservationId) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onReservationTap(reservationModel),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      width: 160,
                      imageUrl: reservationModel.courtImageUrl,
                      placeholder: (context, url) => const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          reservationModel.courtName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'Reserved for: ${reservationModel.dateOfReservation!.formatDateWithHour()}',
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                            'Reservation time: ${reservationModel.hoursOfReservation.toString()} hours'),
                        Text(
                          'Reserved by: ${reservationModel.userName}',
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          'Precipitation Probability: ${reservationModel.precipitationProbability}%',
                          style:
                              const TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            color: Colors.red,
            onPressed: () => onDeleteTap(reservationModel.id!),
            icon: const Icon(Icons.delete),
            iconSize: 40,
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
