# flutter_tennis_test

A new Flutter project to manage the reservations of three tennis courts.

- The application stores data locally in the device, but needs internet connection when the user
  wants to add a new reservation because the application needs to consult an endpoint to get the
  weather forecast for the reservation date.
- The application has validations to prevent the user that tries to reserve a tennis court if it was
  already reserved in the same day and hour or if it was reserved three times in the same day.

## Getting Started

- flutter clean
- flutter pub get
- flutter pub run build_runner build --delete-conflicting-outputs
- flutter run
