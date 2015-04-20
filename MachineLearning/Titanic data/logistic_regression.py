# -*- coding: utf-8 -*-
"""
Created on Sun Apr 19 18:41:10 2015

@author: jdumoulin
"""

import numpy as np
from sklearn import cross_validation
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import f1_score, accuracy_score
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm
from patsy import dmatrices

# read the training data
df = pd.read_csv("train.csv") 

df = df.drop(['Ticket','Cabin', 'Name'], axis=1)
# Remove NaN values
df = df.dropna() 

print df.columns

#df_target = df['Survived']
#df_data = df.drop(['Survived'], axis = 1)

df_target, df_data = dmatrices('Survived ~ C(Pclass) + C(Sex) + Age + \
                Parch + Fare + C(Embarked)', df, return_type="dataframe")

df_target = np.ravel(df_target)

x_train, x_test, y_train, y_test = cross_validation.train_test_split(
    df_data, df_target, test_size=0.4, random_state=0)

print df_data.columns    

print x_test

# First heres the model with sklearn
lr_model = LogisticRegression().fit(x_train, y_train)
y_predict = lr_model.predict(x_test)

print 'accuracy = %f' % lr_model.score(x_test, y_test)
#print y_predict

print 'F1 score: %f' % f1_score(y_test, y_predict)

#Now heres the model with statmodels
lr_model2 = sm.Logit(y_train, x_train)
result = lr_model2.fit()
y_predict2 = result.predict(x_test)

y_predict2[y_predict2>=0.5] = 1.
y_predict2[y_predict2<0.5] = 0.

print 'accuracy = %f' % accuracy_score(y_test, y_predict2)
#print y_predict

print 'F1 score: %f' % f1_score(y_test, y_predict2)


