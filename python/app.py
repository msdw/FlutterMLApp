from flask import Flask, request
import pyrebase
import json
from classification import classify




__firebase_config = {
        "apiKey": "AIzaSyDXd9OYGlj5a_C-PkoYVkDXxdQYRcky7nY",
        "authDomain": "fluttermlapp-88314.firebaseapp.com",
        "databaseURL": "https://fluttermlapp-88314.firebaseio.com",
        "storageBucket": "fluttermlapp-88314.appspot.com"
    }

firebase = pyrebase.initialize_app(__firebase_config)
storage = firebase.storage()

app = Flask(__name__)


@app.route('/classify', methods=['GET', 'POST'])
def classify_photo():
    print(request.args.get('key', ''))
    print(request.form['name'])
    image_name = request.form['name']
    image_path = image_name
    image_url = request.form['url']

    #download photo from storage
    storage.child(image_name).download(image_path)
    label = classify(image_path)

    data = {'name': image_name, 'url': image_url, 'prediction': label}
    return json.dumps(data)