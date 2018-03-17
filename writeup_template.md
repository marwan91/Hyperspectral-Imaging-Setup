# **Hyper-spectral Imaging test setup** 



The goals / steps of this project are the following:
* Build an optical setup for performing hyper-spectral imaging
* Install sensors and actuators required to perform the tests
* Automate the setup using LABVIEW
* Analyze the captured data using matlab
* Create a user interface to visualize the results


[//]: # (Image References)

[image1]: ./examples/20150217_141204.jpg "setup"
[image2]: ./examples/assembled_image.png "stitched"
[image4]: ./examples/slice.jpg "slit"
[image5]: ./examples/false_spectrum.jpg "false"
[image6]: ./examples/true_spectrum.jpg "true"
[image7]: ./examples/real_vs_fake.png "graph"





#### 2. Optical setup

The imaging setup consists of the following ...

1- CCD camera

2- collimating lens

3- Diffraction grating

4- Adjustable fluidic lens for image focus

5- 20um slit

6- piezo-electric linear drive motor 

7- Rotary stepper motor with CAN controller

8- CAN-USB converter


![alt text][image1]

### Methodology

Hyper-spectral imaging is implemented in this project by using a 20um slit to slice the object image to thin fragments. then capturing the wavelength spectrum of each slice. Then Assembling all the slices to produce the hyperspetral cube. 

### Example of how Hyper-Spectral imaging works

![alt text][image3]

The image above is a single slice from the slit point of view , and it is captured by the CCD camera.

The image below is all slices of the object stitched together. The slices are assembled using matlab image processing tools.

![alt text][image2]

To capture each slice, A linear drive piezo electric motor with a step of 10 um moves the slit barrier sideways to scan the object from end to end. The scanning process is automated by LABVIEW. 

#### Experiment .

This experiment is an example to demonstrate the uage of Hyper-spectral imaging.

The object to be analyzed is a sample of a fake leaf and a real one. Hardly distiguishable with the naked eye.

The setup is used in this experiment to detect the difference between the two samples.



![alt text][image4]

![alt text][image5] 

![alt text][image6] 
![alt text][image7] 

![alt text][image8]


#### 2. Discuss the model's predictions on these new traffic signs and compare the results to predicting on the test set. At a minimum, discuss what the predictions were, the accuracy on these new predictions, and compare the accuracy to the accuracy on the test set (OPTIONAL: Discuss the results in more detail as described in the "Stand Out Suggestions" part of the rubric).

Here are the results of the prediction:

| Image			        |     Prediction	        					| 
|:---------------------:|:---------------------------------------------:| 
| Stop Sign      		| Stop sign   									| 
| U-turn     			| U-turn 										|
| Yield					| Yield											|
| 100 km/h	      		| Bumpy Road					 				|
| Slippery Road			| Slippery Road      							|


The model was able to correctly guess 4 of the 5 traffic signs, which gives an accuracy of 80%. This compares favorably to the accuracy on the test set of ...

#### 3. Describe how certain the model is when predicting on each of the five new images by looking at the softmax probabilities for each prediction. Provide the top 5 softmax probabilities for each image along with the sign type of each probability. (OPTIONAL: as described in the "Stand Out Suggestions" part of the rubric, visualizations can also be provided such as bar charts)

The code for making predictions on my final model is located in the 11th cell of the Ipython notebook.

For the first image, the model is relatively sure that this is a stop sign (probability of 0.6), and the image does contain a stop sign. The top five soft max probabilities were

| Probability         	|     Prediction	        					| 
|:---------------------:|:---------------------------------------------:| 
| .60         			| Stop sign   									| 
| .20     				| U-turn 										|
| .05					| Yield											|
| .04	      			| Bumpy Road					 				|
| .01				    | Slippery Road      							|


For the second image ... 

### (Optional) Visualizing the Neural Network (See Step 4 of the Ipython notebook for more details)
#### 1. Discuss the visual output of your trained network's feature maps. What characteristics did the neural network use to make classifications?


