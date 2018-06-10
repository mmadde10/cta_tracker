# cta_tracker

Note: Not associated with the Chicago Transit Authority (CTA).

A Flutter Application for Tracking the CTA L train through location services. 

## Developer Getting Started
 * Install the Flutter framework
 * Install the dependencies of the Flutter framework

### Install Flutter
* [Install] (https://flutter.io/get-started/install/)

### Get Running
A CTA API key is required for this project. To request one visit the [CTA API Website] (https://www.transitchicago.com/developers/traintracker/)

* Create a file config.dart in lib directory. Add the API key to the file.

    ```dart
    const Map properties = const {
        'CTAkey': 'YOUR CTA API KEY HERE'
    };
    ```
