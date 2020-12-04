from numpy import loadtxt, genfromtxt
import numpy as np
# from keras.models import Sequential
# from keras.layers import Dense
from keras.models import Sequential
from keras.layers import Dense, Activation
import keras
def get_data():
    data = genfromtxt('Matlab/output.csv', delimiter=',')
    data = np.delete(data, 1, 1)
    prescence = data[:,2]
    data = np.delete(data, 2, 1)
    return data, prescence
    
def testAndTrain():
    # load the dataset
    X,y = get_data()
    p = np.random.permutation(len(y))
    X,y = X[p,:], y[p]
    Xtest, ytest = X[230:,:], y[230:]
    X,y = X[:230,:], y[:230]
    # define the keras model
    model = Sequential()
    model.add(Dense(50, input_dim=2, activation='relu'))
    model.add(Dense(8, activation='relu'))
    model.add(Dense(1, activation='linear'))
     # compile the keras model
    optimizer = keras.optimizers.Adam(lr=0.01)
    model.compile(loss='mean_squared_error', optimizer=optimizer, metrics=['mse'])
     # fit the keras model on the dataset
    model.fit(X, y, epochs=150, batch_size=10)
     # evaluate the keras model
    _, accuracy = model.evaluate(X, y, verbose=0)
     # _, accuracy = model.evaluate(X, y, verbose=0)
    print('Accuracy: %.2f' % (accuracy * 100))
     # make probability predictions with the model
    predictions = model.predict(Xtest)
     # round predictions
    rounded = [round(x[0]) for x in predictions]
     # summarize the first 5 cases
    cnt = 0
    cnt_true = 0
    for i in range(len(ytest)):
        print('%s => %d (expected %d)' % (Xtest[i].tolist(), predictions[i], ytest[i]))
        if abs(predictions[i] - ytest[i]) <= 30:
            cnt_true += 1
        cnt += 1
    print(cnt_true / cnt * 100)
    #print(predictions)
    # return predictions

testAndTrain()