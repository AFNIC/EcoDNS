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
  <img width="450" height="350" src="https://github.com/AFNIC/EcoDNS/blob/main/Images/HackathonTeam.jpeg">
</p>

## Steps 
### Setup the Infrastructure for measurements

##### DNS Resolution infrastructure

A Ubuntu Laptop running BIND9 handles the domain name resolution requests sent by the traffic generator. It is connected with a [Wattmeter](https://www.yoctopuce.com/EN/products/capteurs-electriques-usb/yocto-watt), which will give the watts consumed by the laptop.

##### DNS traffic generation
We plan to use the shell scripts in the [`Src`](Src/) directory to generate different DNS traffic types.
* [To generate UDP traffic](Src/request2.sh)  - We have to check whether the source code does what it intends to do?
* [To generate DoH traffic](Src/request_doh.sh)  - We have to check whether the source code does what it intends to do?
* [To generate DoT traffic](Src/request_dot.sh)  - We have to check whether the source code does what it intends to do?

##### Data Synchronisation

To have statistics of the logs, we plan to synchronise the Data being received by the laptop running the DNS resolver `labs@192.168.14.2` (server1) to the server running the data analytics `ubuntu@91.134.96.246` (server2)

There is a synchronisation done between server1 and server2

Arınç: Run as root: `ssh labs@10.0.0.2 "sudo nethogs -t" > /var/log/nethogs-server-1.log &`

##### Data viewing and analytics

The server which is used for Data Analytics (server-2-vps): `ssh ubuntu@91.134.96.246`

## Results


Grafana is up and running: http://91.134.96.246:3000/ (Ask me the password ;-)

The server which runs DNS resolver (server-1-dns-resolver): `ssh labs@192.168.14.2`

Connect to server-1-dns-resolver from server-2-vps: `ssh labs@10.0.0.2`
