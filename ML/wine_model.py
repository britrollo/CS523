# I pledge my honot that I have abided by the Stevens Honor System. Brianne Trollo
import pandas as pd

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score
from sklearn.model_selection import cross_val_predict
from sklearn import metrics

import coremltools

from sklearn.datasets import load_wine

data = load_wine()

#Data set URL
dataset_url = 'http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data'
#Names of the columns
names = ['cultivar', 'alcohol', 'malic_acid', 'ash', 'alkalinity_ash', 'magnesium', 'total_phenols', 'flavonoids', 'nonflavonoid_phenols', 'proanthocyanins', 'color intensity', 'hue', 'od280_od315', 'proline']

#Read the CSV file
data = pd.read_csv(dataset_url, names=names, header=None)

X = data[['alcohol','malic_acid','ash','alkalinity_ash','magnesium','total_phenols']]
y = data['cultivar'].astype(str)

#Create the model
model = RandomForestClassifier()

#Evaluate the model with cross validation
scores = cross_val_score(model,X,y,cv=5)
print('Scores:{}').format(scores)
print('Accuracy:{0:0.2f}(+/-{1:0.2f})').format(scores.mean(),scores.std()*2)

predicted = cross_val_predict(model,X,y,cv=5)
print('Predicted:{}').format(predicted)
accuracy_score = metrics.accuracy_score(y,predicted)
print('Accuracy:{0:0.2f})').format(accuracy_score)

#Fit the data
model.fit(X,y)

#Convert model to Core ML
coreml_model = coremltools.converters.sklearn.convert(model, input_features=['alcohol','malicAcid','ash','alkalinityAsh','magnesium','totalPhenols'])

#Save Core ML Model
coreml_model.save('wine.mlmodel')
print('Core ML Model saved')

