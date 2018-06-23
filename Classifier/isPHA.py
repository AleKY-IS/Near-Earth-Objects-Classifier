import math
from sklearn.metrics import accuracy_score
import pandas as pd
import xgboost as xgb

data  = pd.read_csv(“/Data/NEA_labeled.csv") # adjust path to Data folder
target = data['PHA_flag'].values
target = [0 if math.isnan(x) else x for x in target]
data = data.drop(['PHA_flag'],axis=1)

for column in data:
    if data[column].dtype == 'O':
        data[column],_ = pd.factorize(data[column])
 
    else:
        #for int or float: fill NaN
        tmp_len = len(data[data.isnull()])
        if tmp_len > 0:
            data.loc[data[column].isnull(), column] = -1


from sklearn.cross_validation import train_test_split

X_train, X_test_validate, y_train, y_test_validate = train_test_split(data,target, test_size=0.4)
X_validation, X_test, y_validation, y_test = train_test_split(X_test_validate,y_test_validate, test_size=0.5)


xg_train = xgb.DMatrix( X_train, label=y_train) 
xg_validation = xgb.DMatrix(X_validation)
xg_test = xgb.DMatrix(X_test)

# setup parameters for xgboost
param = {}
param['objective'] = 'multi:softmax'
param['eta'] = 0.3
param['max_depth'] = 6
param['silent'] = 1
param['nthread'] = 8
param['num_class'] = 2
 
watchlist = [ (xg_train,'train')]
num_round = 100
bst = xgb.train(param, xg_train, num_round, watchlist );
 
res = bst.predict( xg_validation ).astype(int);
print accuracy_score(y_validation, res)

res = bst.predict( xg_test ).astype(int);
print accuracy_score(y_test, res)
