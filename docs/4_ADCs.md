# 4) Analog-to-Digital Converters (ADCs):
# Suggested Study Plan
&ensp; *1- "Data Converter Basics":* </br>
&ensp; &ensp; &ensp; Understand the Data Convertion basics, including Sampling, Quantization, Spectrum Analysis, & Performance Metrics. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Lecs 3-6 from Prof. Sang-Soo Lee's EE288 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Lecs 1-6 from Prof. Hesham Omran's ECE 486 lecture notes. </br></br>
&ensp; *2- "ADC architectures":* </br>
&ensp; &ensp; &ensp; Understand the operation of the different types of ADCs & their applications. </br>
&ensp; &ensp; &ensp; ( Flash -- SAR -- Algorithmic -- Pipeline -- Single/Dual-Slope Integration -- Sigma-Delta ) </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Lecs 1-3 from Prof. Sang-Soo Lee's EE288 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Check the ["ADC and DAC"](https://youtube.com/playlist?list=PLwjK_iyK4LLCnW-df-_53d-6yYrGb9zZc) playlist from ["ALL ABOUT ELECTRONICS"](https://www.youtube.com/@ALLABOUTELECTRONICS) channel. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Check the ["Analog-to-Digital Converter Architectures and Choices for System Design"](https://www.analog.com/en/analog-dialogue/articles/analog-to-digital-converter-architectures-and-choices.html) article from "Analog Dialogue". </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Build the different ADC types using ideal components & VerilogA, & observe the input & output of your system. </br></br>
&ensp; *3- "ADC basic building blocks":* </br>
&ensp; &ensp; &ensp; Learn about each building block of the ADC, in addition to their different topologies & ways of improvement. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Lecs 8-14 from Prof. Sang-Soo Lee's EE288 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Lecs 7,8,11 from Prof. Hesham Omran's ECE 486 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Build & Simulate the main blocks (Track-&-Hold switches, Dynamic Comparators, OpAmps) on Cadence Virtuoso.</br></br>
&ensp; *4- "DAC architectures":* </br>
&ensp; &ensp; &ensp; Understand the operation of the different types of DACs + their Pros & Cons. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Lecs 15-17 from Prof. Sang-Soo Lee's EE288 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Lecs 9-10 from Prof. Hesham Omran's ECE 486 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Build a DAC, Measure the worst case DNL using Monte Carlo Sims, & observe how device sizing affect performance.</br></br>
&ensp; *5- "ADC Design on circuit level":* </br>
&ensp; &ensp; &ensp; Work on building an ADC using actual devices for its building blocks. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Lecs 18-25 from Prof. Sang-Soo Lee's EE288 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Lecs 12-16 from Prof. Hesham Omran's ECE 486 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Choose an ADC architecture, Build each block individually, then Put all the blocks together as a whole ADC, </br>
&ensp; &ensp; &ensp; &ensp; &ensp; &ensp; &ensp; Simulate the ADC system, & Measure the key metrics (like ENOB & SNR) using the Calculator in Cadence Virtuoso.</br></br>

# Courses
| | Course | Instructor | Affiliation | Material | 
|---:|---|---|---|---|
|    |   |   |   |   |
| 1| EE 288 : "Data Conversion for AMS ICs"             | Dr. Sang-Soo Lee | SJSU            |([Material](https://drive.google.com/drive/folders/12Qqfw_TX1i7dvVVYXksaSdHV4gth1OD5))|
| 2| ECE 486: "Analog Integrated Systems Design"        | Dr. Hesham Omran | Ain Shams Univ  |([Videos & Material](https://www.master-micro.com/professional-courses/analog-systems-design))[Arabic]|
| 3| EE 505: "CMOS and BiCMOS Data Conversion Circuits" | Dr. Randy Geiger | Iowa State Univ |([Videos & Material](http://class.ece.iastate.edu/rlgeiger/Randy505/?fbclid=IwAR1WIn6QDdOqlHgPRl__w9kuLnfBPydm33x12G5-zDX1ilXNkS6iDqh7gnY))|
| 4| "ADC and DAC" Playlist | "ALL ABOUT ELECTRONICS" |  |([Videos](https://youtube.com/playlist?list=PLwjK_iyK4LLCnW-df-_53d-6yYrGb9zZc))|

# References
|||||
|---:|---|---|---|
| 1|"CMOS Data Converters for Communications"     | by Gustavsson| ([Ref](https://drive.google.com/file/d/1M6u7kcCi23wva3ddAbEqMXQc7HddzA1X/view))|
| 2|"Principles of Data Conversion System Design" | by Razavi    | ([Ref](https://drive.google.com/file/d/1mWoMSFOqtsYJD_Kp8JNWCEjG_3vsgG4D/view))|
| 3|"Electronics Tutorial: Converters"            | "Analog Devices"| ([Ref](https://www.analog.com//media/en/training-seminars/design-handbooks/Basic-Linear-Design/Chapter6.pdf))|

# Technical Documents
|||||
|---:|---|---|---|
| 1| "Analog-to-Digital Converter Architectures and Choices for System Design"| Brian Black |([Article - Analog Dialogue](https://www.analog.com/en/analog-dialogue/articles/analog-to-digital-converter-architectures-and-choices.html))|

# Project
|||||
|---:|---|---|---|
| 1| "Ideal 10-bit Pipeline ADC & DAC" |([Repo](https://github.com/muhammadaldacher/Modeling-of-10-bit-Pipeline-ADC-and-10-bit-DAC))| |
| 2| "Ideal 4-bit Flash ADC & DAC"     |([Repo](https://github.com/muhammadaldacher/Modeling-of-4-bit-Flash-ADC-and-4-bit-DAC))| |
| 3| "Bootstrapped Switch"             |([Repo](https://github.com/muhammadaldacher/Analog-Design-of-Bootstrapped-Switch))| |
| 4| "Dynamic Comparator"              |([Repo](https://github.com/muhammadaldacher/Analog-Design-of-Dynamic-Comparator))| |
| 5| "Current-steering DAC"            |([Repo](https://github.com/muhammadaldacher/Analog-design-of-4-bit-current-steering-DACs))| |
| 6| "Pipeline ADC with Boosted OpAmp" |([Repo](https://github.com/muhammadaldacher/Analog-Design-of-1.5-bit-Pipeline-ADC-And-Boosted-OpAmp))| |
| 7| "Async SAR ADC" + Ideal Model     |([Repo](https://github.com/muhammadaldacher/Analog-Design-of-Asynchronous-SAR-ADC))| |
|||||
| 8| Dr. Hesham's ECE 486 labs   |([Repo](https://drive.google.com/drive/folders/1Q7ZbEdv-5skkqEj5j8ooOujP1t5eUBgP))| |

> Google Drive: ([Link](https://drive.google.com/drive/folders/12Qqfw_TX1i7dvVVYXksaSdHV4gth1OD5?usp=sharing))
