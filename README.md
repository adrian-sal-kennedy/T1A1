Adrian Kennedy - T1A1
=====================

Q1 - History of the Internet
----------------------------

- 1843 - Ada Lovelace publishes the [first ever algorithm specifically meant to be run on a computer][1] (Charles Babbage's Analytical engine, which sadly was never actually completed so the program never run).

- 1844 - [Samuel Morse][2] sends "WHAT HATH GOD WROUGHT" 71km from Washington to Baltimore over a telegraph. Telegraph technology had been a curiosity since the early days of the discovery of electricity, but only from 1838 onward did it see any practical commercial use, when voltages could be made high enough to counter losses (power loss is proportional to current squared, so low current and high voltage works best for distance) and systems using less (therefore cheaper) wiring could be built to cover large distances.

- 1940's - Alan Turing and John Von Neumann. Legends. Invented computers as we know them.

- 1962 - [J.C.R. Licklider at MIT discusses][3] his “Galactic Network” concept in a series of memos. Later worked on ARPANET. The idea was conceptually very similar to the Internet.

- 1969 - ARPANET's first node installed at UCLA [\[3\]][3]

- 1989 - Using Steve Jobs' "Gap year" flagship product, the NeXT computer, [Tim Berners Lee][4] invented HTTP and a line-mode browser was developed to use it. I haven't used a greentext computer since 1990 and looking at CERN's emulation of such, I'm glad.

- 1991 - Al Gore [confuses legislation and enthusiasm for invention][5] and drafted the bill *High Performance Computing and Communication Act of 1991*. To his credit, the Mosaic browser (and later Netscape) would not have been developed without the funding included in that bill. So perhaps Gore really did invent the Internet.

- 1995 - [Windows '95 is released][6]. This doesn't seem so significant, but it heralded a massive boost in home computer sales. Suddenly they were less dorky, but not elitist or expensive like macs were. Windows came pre-installed on mass produced OEM computers. Families would buy the whole deal - Computer, CD-ROM, dial-up modem. With that modem came your choice of kicking it old school with BBS services, or using AOL (I actually had this!) or Netscape and Internet Explorer.

I could certainly list a lot in between. Myself, the most significant moments were:
- The advent of IM platforms (I never did ICQ, but certainly MSN Messenger played a big part of keeping up with friends)
- FutureSplash / Macromedia Flash bringing rich content for so many years until (thank God) HTML5 did away with the need for it.
- Internet forums. Sprung from mailing lists but far less arcane.
- 4chan - This dumpster fire of a site has been easily as culture-defining as The Simpsons was to my generation.
- Wikileaks. Showing the world some of the things you can use the Internet for.
- Facebook. I hate it, I really do. But there's no denying the influence it's had in shaping the whole of society.
- Cambridge Analytica and all that came with it.
- The BitTorrent protocol. Not only did it make up a good whack of all online traffic for a long time, it served as the prototype for expensive transfer systems like Aspera.
- Netflix and YouTube. Killed TV. Good riddance. Also killed most piracy unless you're wanting Game Of Thrones (as an ex film guy - just steal it, we already got paid. Don't shed a tear for the licensor because it's Murdoch).

[1]:https://en.wikipedia.org/w/index.php?title=Ada_Lovelace&oldid=948961677
[2]:https://en.wikipedia.org/w/index.php?title=Electrical_telegraph&oldid=949073278
[3]:https://www.internetsociety.org/internet/history-internet/brief-history-internet/
[4]:http://line-mode.cern.ch/www/hypertext/WWW/TheProject.html
[5]:https://en.wikipedia.org/w/index.php?title=Al_Gore_and_information_technology&oldid=948791284
[6]:https://www.forbes.com/sites/ianmorris/2015/08/24/windows-95-changed-the-world/


Q2 - Critical enabling features of the Internet
-----------------------------------------------
### Packets
A chunk of data with a header and a data payload. The header, amoung other things, how big the packet is so the receiver knows when one packet ends and the next begins. In both [IPv4][7] and [IPv6][8] these packet length fields are 16 bits long, hence packets have a max size of 2^16 =  65536 bytes. IPv6 allows "jumbo payloads" which are stored as 32-bit fields, allowing up to 4GB packets. This allows a large reduction in routing overhead so is potentially faster for files larger than 64KB.

### IP Addresses
IPv4 was the first version of Internet Protocol to be deployed in ARPANET way back in 1983. It was standardized in 1981. It is still the main protocol in use - IPv6 has been pushed for years, and for good reason, but IPv4 is still The Internet.  

IPv4 addresses follow the format nnn.nnn.nnn.n. Most devices on a local network show up as "192.168.1.x". www.google.com shows up as 216.58.203.110

The human-friendly text addresses we type into our browsers actually just query a Domain Name Server which then looks up an associated numerical IP address.  

IPv6 addresses are much longer. This is good because the Internet of IPv4 could only support 4 billion devices, and there are more of them than that now.

### Routers
Routers are the "black boxes" invisaged in the ARPAnet concept. They receive packets and send them on. Not a lot more.

A packet, when it leaves your network interface, will take a path through any number of intermediary routers to get to it's destination. [A router doesn't necessarily know where a packet should go.][9]  

Each router in the chain, using the packet header information, will send the packet onward to another router along the path, until it reaches it's destination, or times out (the packet header contains either a Time To Live value for IPv4 or a number of hops that is decremented each time it is routed until it reaches zero). If a packet times out or hits zero, it is considered "lost" and your machine will send it again. When the destination receives the packet it will send an "ACK" packet back which essentially is just a header with no payload.

### Domains and DNS
DNS means [Domain Name System][10]. Basically just names, but the "domain" aspect indicates that they are heirarchical names. Any address that falls under, say, https://adrian-sal-kennedy.github.com/ will be under:

- the **.com** Top Level Domain (there are over 1500 of these now, mostly owned by big companies so they can have .pfizervor whatever at the end of their addresses)
- the **.github** domain, indicating this is part of the greater GitHub site.
- the **adrian-sal-kennedy** subdomain, which in this case is generated from the account name of the user of GitHub.

The domain name system is basically a big table of these names and the IP addresses they actually connect to. If you like you can directly enter IP addresses into your browser's address bar and they will resolve just as if you'd typed the name.

[7]:https://en.wikipedia.org/wiki/IPv4
[8]:https://en.wikipedia.org/wiki/IPv6
[9]:https://cromwell-intl.com/networking/routing.html
[10]:https://en.wikipedia.org/wiki/Domain_Name_System


Q3 - More critical enabling technologies of the Internet
--------------------------------------------------------

### TCP

[Transmission Control Protocol (TCP)][11] is the standard by which internet-connected devices exchange data. It is the major part of the [Internet Protocol][12] suite of layers and protocols by which the entire Internet depends.  

TCP's emphasis is on reliability and error robustness. Packets carry check-sums and failed sums result in packets being re-sent.  

For applications that do not require 100% accuracy nor reciprocity between client and server, there is also UDP (User Datagram Protocol) which is more analogous to traditional broadcasting - high throughput and low latency at the expense of possible errors in transmission.

### HTTP and HTTPS

**HyperText Transfer Protocol** is the application protocol for Hypermedia. Hypermedia, in turn, is simply the combination of text, links, interactions like mouse-clicks and taps etc. It is distinct from linear text (such as a book) by the fact that words can be linked, the user can jump around in any way, and it is fundamentally non-linear, in that it does not simply read from beginning to end like a book or a piece of music - hyperlinks in particular allow the user deeper interactions.

**HTTPS** is the same, but **s**ecured using **TLS** (Transport Layer Security), which allows encryption over the network (but not on client or server), preventing "man-in-the-middle" attacks. TLS provides up to 224 bits in it's cryptographic keys, meaning a brute-force attack would take 2^224 guesses to come up with a crack, by which time the connection would be well over. The universe would also long have undergone a heat-death and the very last subatomic particles in existence would have decayed trillions of years beforehand. Even assuming Moore's Law holds indefinitely and computer speed doubles every 18 months forever.

### Web Browsers (requests, rendering and developer tools)

A web browser is simply a piece of software that takes the incoming packets and breaks them apart into hypermedia and then interprets that and presents it for the user. It will (at the very least) understand HTML and CSS, be able to render web pages and follow links etc. An example of the earliest browser is linked above in the "History Of The Internet" section. Current browsers are almost their own operating systems - the Web has expanded into a platform for delivering not just text, images and video, but full-fledged applications, something that until recently was the exclusive realm of operating systems.

A browser will accept a URL (Uniform Resource Locator) and request it thus:
"http://www.example.com"
- "http://" indicates that HyperText Transfer Protocol will be used. We also have things like "ftp://" or even "file://" for local files or files on a remote server (this can be a security nightmare for sysadmins with malicious file:// links appearing in users' emails).
- "www." is not really useful. It was a nice way for webmasters to help split the load between physical servers, but otherwise that subdomain is not there or any other reason than aesthetics.
- "example." This is the domain. Requests for this are what the Domain Name Servers look up and match to an IP address and port number.
- com - this is the Top Level Domain. Generally used to indicate wither something is **com**mercial, a not-for-profit **org**anization, etc. There used to be very few TLD's, but now there are heaps for countries, companies, biznesses (sic), info, continents and in different languages and character sets like Cyrillic, Chinese or Arabic characters.

The URL is resolved to a DNS and a request is made to the server with the IP address that corresponds to the URL. It then returns an ACK packet or just gets on with delivering the contents of the default page it is configured to deliver (usually index.html if no filename is given in the URL).

The returned packets are decoded and/or decrypted by the browser and rendered into something the user can interpret - graphics and text.

The **developer tools** in modern browsers are a powerful extension of the "view source" feature that was available in early browsers - where one just showed the html file in plain text, the developer tools show absolutely everything that is happening under the hood to make that page show up - html, css, bandwidth, DOM, connections, data transferred and speed, etc etc. You can also interactively modify code to see what changes it will cause.

[11]:https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[12]:https://en.wikipedia.org/wiki/Internet_protocol_suite


Q4 - 3 Ruby Data Structures
---------------------------

### 1. Arrays

An array is essentially a list of values. Each value has an index. Values can be nil and will retain an index. Arrays are represented as:
```
arr = [value, value, value]
```
and values can be returned with this syntax
```Ruby
arr[int index]
```

### 2. Hashes

Hashes are rather like arrays except their indices are themselves values. Therefore they are "key/value pairs". Defined as:
```
hash = {key: "value", something: "excellent", etc: "et cetera", "foo" => "bar"}
```

In the last case the syntax is different because colons specifically denote symbols rather than any old value. Using symbols saves a lot of memory and execution speed.

### 3. Objects

In Ruby, objects are constructed from calling class methods. You can define a class which, when called, creates the object. The object can consist of any number of variables or data structures itself.

Q5 - Interpreters and Compilers
-------------------------------

### Interpreters

An interpreter reads and executes code line-by-line until the program ends or an error is found (or until the user stops it).

The great advantage of interpreters is that bugs are easily found. Usually a compiler will show the line where it failed, plus the byte or character offset from the beginning of that line. You can go straight to that line and fix the problem without having to rebuild the whole project.

A great disadvantage (conceptually - internally interpreters and compilers only really differ in their interactivity these days as computers have got faster and the lines have blurred) is they are much slower.

### Compilers

As opposed to executing code line-by-line, a compiler will translate all the code into machine code and place the result into "binaries", either executable or libraries that executables reference. Because the whole of the code is done in it's own "build" process, time can be taken to apply optimizations to the code, usually specific to the platform the compilers are running on.