# Suggested Study Plan
&ensp; *1- "PLL System-Level":* </br>
&ensp; &ensp; &ensp; Understand the general operation of PLLs + how to derive the open & closed loop equations. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Start with CH 16 of Prof. Razavi's reference "Design of Analog CMOS Integrated Circuits" 3rd ed. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Follow the equations in Prof. Sang-Soo Lee's EE230 lecture notes. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Generate the open-loop & the closed-loop Bode Plots using Matlab & VerilogA. </br></br>
&ensp; *2- "PLL Circuit Blocks":* </br>
&ensp; &ensp; &ensp; Understand how to build each building block on the transistor level. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Prof. Sam Palermo's ECEN620 lecture notes explain the specifics of each block along with showing the common topologies. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; b) Eng. Dennis Fischette's Tutorial presents practical tips for building PLL blocks based on what's done in industry. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Build each individual block on Cadence Virtuoso. </br></br>
&ensp; *3- "Jitter & Phase Noise Understanding":* </br>
&ensp; &ensp; &ensp; Understand the relationship between phase noise & jitter + understand how each block contributes to the total phase noise. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; a) Check the technical notes about PLL jitter & phase noise below. </br>
&ensp; &ensp; &ensp; &ensp; &ensp; => [Project] Connect all the circuit blocks together, & optimize based on the jitter & the phase noise requirements.</br></br>

# Courses
| | Course | Instructor | Affiliation | Material | PLL Lectures|
|---:|---|---|---|---|---|
|    |   |   |   |   |   |
| 1| EE 230 : "RFIC II"  | Dr. Sang-Soo Lee  | SJSU |([Material](https://drive.google.com/drive/folders/1WcP2svOrAle0cEzlL1oexYeuDEQjH5j9))| Lecs: 16 - 21 |
| 2| ECEN 620: "Network Theory: Broadband Circuit Design" | Dr. Sam Palermo   | Texas A&M Univ|([Site](https://people.engr.tamu.edu/spalermo/ecen620.html?fbclid=IwAR2SWKe_MPtf0ppmeYcn-hc3iDoC0JvFNAA6rgvxQDsvzCfM15htVaWEZuo)) ([Material](https://drive.google.com/drive/folders/1lpc9RQN0gua415adOnqK3tUChHH6Mqif?usp=sharing))| Lecs: 1 - 11 |
| 3| ECE 504: "PLL & High-Speed Link design"  | Dr. Vishal Saxena | Univ of Idaho |([Material](https://drive.google.com/drive/folders/176nN4prJmCzLWFan0TysT9ifXJiWUich?usp=sharing))| Lecs: ALL|
| 4| "High-Speed Serial Interface Circuits & Systems"  | Dr. Woo Choi | Yonsei Univ |([Site](http://tera.yonsei.ac.kr/class/2021_2_2/main.htm)) ([Material](https://drive.google.com/drive/folders/1vfblDuzH_SzOzE_7qD8c-JpRa6OSgap9?usp=drive_link))| Lecs: 1 - 5 |
> Thanks to Eng. [Ahmed Ramadan](https://www.linkedin.com/in/ahmed-ramadan-70430914a/) who collected most of these material.

# References
|||||
|---:|---|---|---|
| 1|"Design of Analog CMOS Integrated Circuits" - CH 16    | by Razavi   | ([Ref](https://drive.google.com/file/d/14HT0R-oztZRAJbOOP0i4hZYRGIiUSPJD))|
| 2|"Design of CMOS PLLs"                                  |by Razavi    | ([Ref](https://drive.google.com/file/d/1pkin8NZktw55MCJYCk_KjVBS1WnJyZQd/))|

# Technical Documents
|||||
|---:|---|---|---|
| 1| "Practical Tips for PLL Design"| Dennis Fischette |([Site](https://www.delroy.com/PLL_dir/pll.htm)) ([Docs](https://drive.google.com/file/d/1GcYZ-5Dmts4HL2uMz5SmjmuEwoTcmYgy))|
| 2| "PLL Fundamentals"    | Dean Banerjee - TI|([Slides](https://drive.google.com/drive/folders/1uUDOyvCSBSp6G3UI9uv4MGyx7vH1ovVd)) ([Book](https://www.ti.com/lit/ml/snaa106c/snaa106c.pdf))|
| 3| Jitter & Phase Noise  |||
|  | (A) "Converting Oscillator Phase Noise to Time Jitter"| Walt Kester - AnalogDevices|([Docs](https://www.analog.com/media/en/training-seminars/tutorials/MT-008.pdf))|
|  | (B) "Phase Locked Loop Noise Transfer Functions"| Peter Delos - LockheedMartin|([Docs](https://www.highfrequencyelectronics.com/index.php?option=com_content&view=article&id=1354:phase-locked-loop-noise-transfer-functions&catid=134:2016-01-january-articles&Itemid=189))|
|  | (C) "Timing Jitter - Tutorial & Measurement Guide"| Silicon Labs Timing|([Docs](https://www.mouser.com/pdfdocs/timing-jitter-tutorial-and-measurement-guide-ebook.pdf))|
|  | (D) ISSCC2012: "Jitter basics and advanced concepts"| Nicola Da Dalt - Infineon|([Docs](https://drive.google.com/file/d/1TEHrjFmUKhwwGLLrArSvR6PgWYO75l5A))|
|  | (E) ESSCIRC2019: "Fundamental Concepts in Jitter and Phase Noise"| Ali Sheikholeslami - Univ of Toronto|([Docs](https://drive.google.com/file/d/1-bdD9vR_FgfasawexiEQEdjoDEzLiPEh))|

# Project
|||||
|---:|---|---|---|
| 1| "1.9-GHz PLL design" |([Repo](https://github.com/muhammadaldacher/Analog-Design-of-1.9-GHz-PLL-system))| |
| 2| PLL Masters Thesis by Rishi Ratan |([Report](https://hdl.handle.net/2142/49509)) ([Site](https://www.ideals.illinois.edu/items/49560))| |

> Google Drive: ([Link](https://drive.google.com/drive/folders/1Zg5deNV4TfbXPfwJipUkGqU3kteMFmFe?usp=sharing))
