ECSE 457 - Design Project - Simulink GPS Receiver

Alam Parihar, Ahmed Sami

Signal Generator --------------------------------------------------
*Simulated singals were not included in this folder as they take up quite a bit of space. To perform testing of the receiver, it
is required that you first simulate signals to test on. During our testing we found that a single satellite signal simulate for
1 second resulted in a file of size 4GB. 
The signal generator is set to generate 4 signals. The signals are saved to file seperately in matlab timeseries format
and summed when input to the receiver. Choose name of save files before simulating. 
Signal parameters can be controlled as follows:

	*TOP LEVEL*	

Data Vector blocks: Set bits for data as a repeating stream of bits at 100Hz.

PRN: The PRN number is the number of the sattelite used to generate the C/A code.

Code Phase shift: the code phase shift of the generated C/A code.

The rest of the parameters must be set within each generator submodel.

	
	*SUB-MOEDEL*
C/A Code Doppler Rate: The counter in the submodel is used to control the C/A code doppler rate; shifts by (1/32 chips)/(counter sample time).

	*CARRIER GENERATOR*
Carrier Frequency: carrier frequency can be set by the value of the constant block.

Carrier Doppler Rate: The doppler rate of the carrier is controlled by the counter; VCO output is (base frequency)+(0.02Hz*counter value);

	*WHITE NOISE*
White Noise: The white noise amplitude is controlled by scaling output values to normalize them to 1 (same amplitude as generated signal) 
and then dividing by a constant to get an appropriate SNR ratio. the constant block represents (signal amplitude)/(noise amplitude).

RECEIVER SIMULATION--------------------------------------------------------------------------------------------------------------------------------------
*WITH ACQUISITION*
To opearte the reciever simply imput the correct files to the sum block and start simulation. The signals will begin tracking 1 PRN sweep after
they are found in the acquisition stage. Once 4 signals have been found, the acquisition stage will turn off to speed up tracking simulation.

*TRACKING ONLY*
To test the receiver without the acquisiton stage, the enable inputs to the tracking stage on the top level must all be set to 1. 
Within the tracking submodel, the input "ACQ_Results" must be replaced with a MATLAB block which outputs a [6x4] matrix holding 6 rows of 
sattelite parameters in the form of: [0, (Satellite#), (Carrier Frequency), (Code Phase)]. Once the matlab block with the correct parameters
is input, you can begin the Main Recevier model simulation. 

VIEWING SCOPES----------------------------------------------------------------------------------------------------------------------
During simulation of the receiver, you can view the carrier discriminator, code phase discriminator and data line outputs for each 
of the 4 tracking loop. 
The first scope is simply called "DATA" located in the "Tracking Execution" submodel withing tracking.
The second and third scope (two discriminators) are located within the submodel "4 Tracking Loops" within "Tracking Execution"

