from keras.models import Sequential
from keras.layers import Dense

def create_dataset(dataset, look_back=1):
	dataX, dataY = [], []
	for i in range(len(dataset)-look_back-1):
		a = dataset[i:(i+look_back), 0]
		dataX.append(a)
		dataY.append(dataset[i + look_back, 0])
	return numpy.array(dataX), numpy.array(dataY)


model = Sequential()
model.add(Dense(50, input_dim=2, activation='relu'))
model.add(Dense(15, activation='relu'))
model.add(Dense(1, activation='linear'))


model2 = Sequential
model2.add(LSTM(4, input_shape=(1, look_back)))
model2.add(Dense(1))
model2.compile(loss='mean_squared_error', optimizer='adam')
model2.fit(trainX, trainY, epochs=100, batch_size=1, verbose=2)


model.compile(loss="mean_squared_error", optimizer='adam')
model2.compile(loss='mean_squared_error', optimizer='adam')

model.fit(X, y, epochs=100, batch_size=1)

trainX = numpy.reshape(past_values, (past_values.shape[0], 1, past_values.shape[1]))
trainY = past_values[1:]

#model2.fit(trainX, trainY, epochs=100, batch_size=1)
