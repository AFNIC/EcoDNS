## Plan

* Setup the Infrastructure for measurements
* Install the required softwares for measurements (EcoDNS, Scaphandre..)
* Verify the DNS traffic generation


## Expected Output
* Baseline measurements (With DNS over UDP)
  * Able to have the overall measurements of DNS energy consumption (i.e. BIND9) in Grafana in kWh
    * Compare the software & hardware measurements for the above scenario 
  * Measure the energy consumption for the baseline scenarion with respect to HW (e.g. CPU, GPU, Network Interface)
* Repeat the measurements made in baseline with DoT, DoH

## Team  

<p align="center">
  <img width="500" height="350" src="https://github.com/AFNIC/EcoDNS/blob/main/Images/HackathonTeam.jpeg">
</p>

## Steps 
### Setup the Infrastructure for measurements

##### DNS Resolution infrastructure

A Ubuntu Laptop running BIND9 handles the domain name resolution requests sent by the traffic generator. It is connected with a [Wattmeter](https://www.yoctopuce.com/FR/products/capteurs-electriques-usb/yocto-watt), which will give the watts consumed by the laptop.
