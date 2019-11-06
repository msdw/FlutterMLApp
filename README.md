A simple on the surface but mildly complicated **Flutter** app using a **machine learning** model on a **Python** server via **Firebase** API requests to detect palm oil plantations in images uploaded from the user's gallery with an **in app payment system (Square)**.

Built in less than a week over a normal work week with no previous experience in Flutter/Firebase/Square.


Login, basic UI and payment system started from forked repo: https://github.com/efortuna/shrine_with_square

Firebase communication and python server inspired by this repo: https://github.com/ZbigniewTomanek/image_classification_with_flutter

# Setup and usage
Run the python flask app found in **FlutterMLApp/python** with
```
flask run --host=0.0.0.0
```
This puts the machine learning model in service to be requested by the Android app. This is not for serving a web app.

In **lib/service.dart**, a URL variable at the top of the file is set by default to the URL necessary for the app running on an Android emulator to find the Python server, which should be running on your local machine. **You may need to change this depending on where you run the Python server**

Once this is running, go ahead and launch the app on an Android emulator (if you need to set up an Android emulator or Flutter, follow their installation tutorial: https://flutter.dev/docs/get-started/install).

Select an image and make a payment (no payments are actually made, this is a test app).
The default card on Sqaure to use is **4111 1111 1111 1111**

See below some pictures of demo
![Sign up / Sign in page](https://drive.google.com/open?id=1Jn-KvKlJREiy7IXApKd8dwWYEJDiNH_x)
![Anthentification](https://drive.google.com/open?id=1zwxPWA_0JY3Z7a-6hhCx1LSuXgOKM_UA)
![Select an image](https://drive.google.com/open?id=1V1p0cicQYSo2groCutOhRI92_6cYZ4Ay)
![Image selected](https://drive.google.com/open?id=1hxeA2j1mpVQfrMwRIemMIOT-q8yisPqH)
![Pay to show](https://drive.google.com/open?id=1z-UAlTAtHVzuC_pJ1JPRQYfJFz4ZIzTz)
![Paid](https://drive.google.com/open?id=1nVRClsFwZxyiMF8f7GsFOHYP7hbtS3NV)
![Result](https://drive.google.com/open?id=1MUt6G0ePVyVRNym0_TINYbKBtGQzzSnE)
![New image without oil palm plantation](https://drive.google.com/open?id=1MBuGU03vVgsg62NxGsUuqZFpSwhNXe2o)
![Result2](https://drive.google.com/open?id=1pR-Gh41Es9MjUBPXOX-D_AhYnqSff7NC)
