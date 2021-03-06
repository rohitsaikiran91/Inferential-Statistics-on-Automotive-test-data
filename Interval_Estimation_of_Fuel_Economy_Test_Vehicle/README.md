# Interval Estimation of on-road Fuel Economy(Kmpl or gallons/100 Km) based on test data from vehicles
## Problem Statement
To provide an interval estimation for on-road Fuel Economy(Kmpl or gallons/100 Km) of a test vehicle at different average speeds of a trip.

## Background
The best representation of fuel economy of a vehicle is the one determined when subjected 'on-road' traffic conditions that are composed of different driving cycles (Urban and highway). A test vehicle is instrumented with a fuel flow meter along the fuel lines. The fuel flow meter provides the instantaneous consumption of the vehicle. The usual setup used by prominent fuel flowmeters is shown in Figure 1 .

## Test Methodology
1. The vehicle is instrumented with following DAQ systems:
   1. Fuel Flowmeter
   2 Data Logger - Capable of logging CAN(Controller Area Network) data at a minimum storage frequency of 100 Hz. The data logger is      capable of providing timestamp data of the all the signals that are required.
   3. In case of analog signals(such as sensor voltages) and digital signals (such as outputs from Optical encoders), a module that can convert analog signal to digital signal and further append the signal data to a  CAN data frame as payload is required
2. The instrumented vehicle is then driven on two routes:
      1. Urban Route - The typical average speed of a complete trip is around 10 - 30 Kmph.
      2. Highway Route - There two types of highways , the first one has an average speed which is typically 30 - 60 kmph(Highway) and the last one has an average speed that is greater than 60 kmph.

3. The test vehicle is driven in each of these routes for multiple times. The sufficiency of number of trips is based on strategy to attain statistical consistency.

## Existing Analysis Methodology

The Many standards such as SAE J1526 and research papers specify an engineering method analysis with a very basic statistical test to determine Fuel economy. All the standards depend on the consistency of measurements across trips (which essential depends on traffic conditions and driver's driving style). For example in Table below, 3rd measurement might be a valid measurement, but because it is not consistent with the 1st and 2nd measurements, it might be discarded

| Measurement - 1 | Measurement - 2 | Measurement - 3 |
| --------------- | -------------- | ---------------- |
| Kmpl | Kmpl | Kmpl |
| 17.1 | 17.2 | 16.1 |

From the above table the average fuel economy would be ( 17.1 + 17.2 )/2  = 17.15 Kmpl

An alternative method suggested by many research papers is fit an model between dependent variable (Fuel Economy) and independent variables (Average Vehicle Speed of the trip, acceleration levels and so on). Although this method embraces the variations in measurements, this approach is prediction rather than an inference from an experiment.
In this method, the total trip is divided into micro-trips. Each microtrip is considered as a separate trip and both dependent (Fuel Economy) and independent variables are determined for each microtrip. Thus each microtrip is essentially a data point for prediction.

![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/MT_Example.jfif)

![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/Prediction.PNG)

## Proposed Methodology

![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/Methodology1.png)

## Example of proposed methodology with average speed as independent variable

### Sample Data: Timestamp data collected across a route
![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/Sample_data.png)

### Microtrips and corresponding data of each microtrip for Fuel economy and Average vehicle speed
![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/MT_data.jpg)

### BOX PLOT Analysis to identify the outliers
![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/Dumpt/box_plot.jpg)

### FINAL INTERVAL ESTIMATION AND DATA REPRESENTATION
![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/DATA_VISUALIZATION/INTERVAL_ESTIMATION_BARCHART.JPG)
![images](https://github.com/rohitsaikiran91/Inferential-Statistics-on-Automotive-test-data/blob/master/Interval_Estimation_of_Fuel_Economy_Test_Vehicle/DATA_VISUALIZATION/INTERVAL_ESTIMATION_LINEPLOT.JPG)
