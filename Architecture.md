# Architecture


<p align="center">
  <img width="800" height="350" src="https://github.com/AFNIC/EcoDNS/blob/main/Images/InfraDNS.png">
</p>

### DNS traffic generation
We plan to generate DNS traffic (i.e. the process of creating and sending DNS queries) to stress test the DNS authoritative servers and resolvers.

Key aspects of the DNS traffic gneration include:
- **Query Patterns**: Generating specific types of DNS queries (e.g., `A`, `AAAA`, `MX`, or `TXT` records) to simulate real-world traffic or test specific scenarios.
- **Traffic Volume**: Adjusting the rate of query generation to simulate low, medium, or high loads on DNS servers.
- **Tools**: We plan to use the shell scripts in the `Src` directory to generate different DNS traffic types. We could also use tools like [`dnsperf`](https://github.com/DNS-OARC/dnsmeter/tree/master), [`queryperf`](https://github.com/romuald/queryperf), [`dnsmeter`](https://github.com/DNS-OARC/dnsmeter/tree/master), [`dnsgen`](https://github.com/DNS-OARC/dnsmeter/tree/master)  to generate DNS traffic.
- **Applications**: To calculate the energy consumption based on different levels of DNS traffic generated.



## DNS Resolver:

Handles domain name resolution requests sent by the traffic generator

## Energy Monitoring Module:

Tracks the energy consumption of DNS operations, providing data for optimization.
User Interface:

Allows users to interact with the system, manage domain registrations, and view energy consumption metrics.

