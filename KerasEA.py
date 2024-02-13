#Please do not mark this, I am planning on rethinking how to approach this exploration activity. 
#I have challenged myself by using this library and I am thinking of new ways to show Keras off as 
#I do not feel this appropriately completes the exploration activity even if I got it working.
















from tensorflow.keras import layers
from tensorflow import keras
import tensorflow as tf

from sklearn.model_selection import train_test_split
from ast import literal_eval

import pandas as pd
import numpy as np

#predicting most likely movie and show genres from title

#load data from csv
titles = []
genresByTitle = []

data = pd.read_csv("titles.csv")


numGenres = input("How many genres would you like to perdict: \n")

#remove duplicate rows if any and uneeded columns
data = data[~data["title"].duplicated()]
data = data.drop(columns=['id', 'type', 'description', 'release_year', 'age_certification', 'runtime', 'production_countries', 'seasons', 'imdb_id', 'imdb_score', 'imdb_votes', 'tmdb_popularity', 'tmdb_score'])

data = data.groupby("genres").filter(lambda x: len(x) > 1)

data["genres"] = data["genres"].apply(
    lambda x: literal_eval(x)
)

train_data, test_data = train_test_split(
    data,
    test_size=0.1,
    stratify=data["genres"].values,
)

# Splitting the test set further into validation
# and new test sets.
val_data = test_data.sample(frac=0.5)
test_data.drop(val_data.index, inplace=True)

print(f"Number of rows in training set: {len(train_data)}")
print(f"Number of rows in validation set: {len(val_data)}")
print(f"Number of rows in test set: {len(test_data)}")

print(data)

genres = tf.ragged.constant(train_data["genres"].values)
lookup = tf.keras.layers.StringLookup(output_mode="multi_hot")
lookup.adapt(genres)
vocab = lookup.get_vocabulary()


def invert_multi_hot(encoded_labels):
    """Reverse a single multi-hot encoded label to a tuple of vocab terms."""
    hot_indices = np.argwhere(encoded_labels == 1.0)[..., 0]
    return np.take(vocab, hot_indices)


print("Vocabulary:\n")
print(vocab)

sample_label = train_data["genres"].iloc[0]
print(f"Original label: {sample_label}")

label_binarized = lookup([sample_label])
print(f"Label-binarized representation: {label_binarized}")

print(train_data["title"].apply(lambda x: len(str(x).split(" "))).describe())

max_seqlen = 3
batch_size = 128
padding_token = "<pad>"
auto = tf.data.AUTOTUNE


def make_dataset(dataframe, is_train=True):
    labels = tf.ragged.constant(dataframe["genres"].values)
    label_binarized = lookup(labels).numpy()
    dataset = tf.data.Dataset.from_tensor_slices(
        (dataframe["title"].values, label_binarized)
    )
    dataset = dataset.shuffle(batch_size * 10) if is_train else dataset
    return dataset.batch(batch_size)

train_dataset = make_dataset(train_data, is_train=True)
validation_dataset = make_dataset(val_data, is_train=False)
test_dataset = make_dataset(test_data, is_train=False)
