### ss
```
ss <option 1> <option 2> <option 3>
```
```
ss -altu
```
* -a or --al
* -l or --listen
* -t or --tcp
* -u or --udp


### nslookup
```
apt install dnsutils
apt install bind9-utils
```
```
nslookup [options] [domain-name]
```
nslookup Option	Description
* -domain=[domain-name]	Change the default DNS name.
* -debug	Show debugging information.
* -port=[port-number]	Specify the port for queries. The default port number is 53.
* -timeout=[seconds]	Specify the time allowed for the server to respond.
* -type=a	View information about the DNS A address records.
* -type=any	View all available records.
* -type=hinfo	View hardware-related information about the host.
* -type=mx	View Mail Exchange server information.
* -type=ns	View Name Server records.
* -type=ptr	View Pointer records. Used in reverse DNS lookups.
* -type=soa	View Start of Authority records. 

### dig
```
dig [server] [name] [type]
```
```
dig @8.8.8.8 google.com
```
Option	Description
* +short	Provides a short answer to the query.
* +noall +answer	Displays only the answer section of the query.
* +stats	Displays statistics about the query.
* +trace	Traces the path from the root DNS servers to the authoritative servers for a domain.
* +nocmd	Omits the initial command line from the output.
* +nssearch	Performs an NS query for the specified domain and checks all listed name servers for consistency.
* @server	Queries the specified DNS server.
* -t type 	Specifies the type of DNS record to query (e.g., A, MX).
* -p port	Uses the specified port number for the query (default is 53).
* -q name	Queries the specified domain name.
* -k filename	Specifies a TSIG key file for secure DNS queries.
* +[no]question	Controls the display of the question section of the query.
* +[no]answer 	Controls the display of the answer section of the query.
* +[no]authority 	Shows or hides the authority section.
* +[no]additional	Displays or hides the additional section.
* +[no]comments	Shows or hides the comments in the output.
* +[no]stats	Displays or hides the statistics.
* +[no]ttl	Controls the display of TTL values.
* +[no]recurse	Toggles recursion for the query.

