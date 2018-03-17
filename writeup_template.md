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

![alt text][image4]

The image above is a single slice from the slit point of view , and it is captured by the CCD camera.

The image below is all slices of the object stitched together. The slices are assembled using matlab image processing tools.

![alt text][image2]

To capture each slice, A linear drive piezo electric motor with a step of 10 um moves the slit barrier sideways to scan the object from end to end. The scanning process is automated by LABVIEW. 

#### Experiment .

This experiment is an example to demonstrate the usage of Hyper-spectral imaging.

The object to be analyzed is a sample of a fake leaf and a real one. Hardly distiguishable with the naked eye.

The setup is used in this experiment to detect the difference between the two samples.

![alt text][image5] 

The image above is the wavelength spectrum of the fake leaf.

The image below is the wavelength spectrum of the real leaf. The spectrum of the real leaf has 2 peaks. an easily noticable feature that does not appear in the fake leaf.

![alt text][image6] 


#### Discussion

Hyperspectral imaging is a useful method for extracting optical features of objects that can not be easily sensed by the human eye.
In this example , Visible light is used as the light source for inspecting the objects. but Other wavelength bands are commonly used in such tests , such as infrared and ultraviolet.



