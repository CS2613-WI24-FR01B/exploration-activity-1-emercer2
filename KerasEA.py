import csv
import ast
import numpy as np
from sklearn.model_selection import train_test_split
import pandas as pd 
import random
#predicting most likely movie and show genres from title

#load data from csv
titles = []
genresByTitle = []

uncleanData = pd.read_csv("titles.csv")


numGenres = input("How many genres would you like to perdict: \n")

#remove duplicate rows if any and uneeded columns
data = uncleanData[~uncleanData["title"].duplicated()]

def repair_array_bound_categories(arr):
    arr = ast.literal_eval(arr)
    
    if len(arr) == 0:
        return np.nan
    
    elif len(arr) == 1:
        return arr[0]
    
    else:
        return random.choice(arr)
data["genres"] = data["genres"].apply(repair_array_bound_categories)
data = data.drop(columns=['id', 'type', 'description', 'release_year', 'age_certification', 'runtime', 'production_countries', 'seasons', 'imdb_id', 'imdb_score', 'imdb_votes', 'tmdb_popularity', 'tmdb_score'])

print(data)
