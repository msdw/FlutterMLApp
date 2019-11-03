from __future__ import absolute_import, division, print_function, unicode_literals
# import tensorflow as tf
# import tensorflow_hub as hub
# from tensorflow.keras import layers
import numpy as np
import PIL.Image as Image

# classifier_url ="https://tfhub.dev/google/tf2-preview/mobilenet_v2/classification/2"

# labels_path = tf.keras.utils.get_file('ImageNetLabels.txt','https://storage.googleapis.com/download.tensorflow.org/data/ImageNetLabels.txt')
# imagenet_labels = np.array(open(labels_path).read().splitlines())

# IMAGE_SHAPE = (224, 224)

# classifier = tf.keras.Sequential([
#     hub.KerasLayer(classifier_url, input_shape=IMAGE_SHAPE+(3,))
# ])


def classify(image_path, num_of_classes=5):
    img = open_image(image_path)

    learn = load_learner('models')

    pred,idx,outputs = learn.predict(img)
    print('Predicted class: ', pred)

    if int(pred.__str__()) == 1:
        return True
    elif int(pred.__str__()) == 0:
        return False




# if __name__ == '__main__':
#     img = tf.keras.utils.get_file('image.jpg', 'https://storage.googleapis.com/download.tensorflow.org/example_images/grace_hopper.jpg')
#     print(img)
#     print(classify('C:\\Users\\zbigi\\.keras\\datasets\\image.jpg'))
