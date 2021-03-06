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
- Wikipedia - All the world's knowledge, reasonably accurate (moreso than ever before), immediately available, free, in every language. This is the noblest, highest goal of global networking.
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

As opposed to executing code line-by-line, a compiler will translate all the code into machine code and place the result into "binaries", either executable or libraries that executables reference. Because the whole of the code is done in it's own "build" process, time can be taken to apply optimizations to the code, usually specific to the platform and hardware the compilers are running on.

The advantage is that the resulting binaries can execute (in theory) as fast as the hardware is capable of. Modern compilers are extremely good at optimizing functions, unrolling loops, using custom CPU instruction sets etc and can speed programs up by ridiculous amounts. A program like x264 will use 100% of every CPU core in order to work as fast as possible. Some programs will even use the graphics card for further speed increase. Most of this ability is not available to interpreted languages (the exception is when an interpreted program calls functions that run from compiled libraries, something that python, R, etc make heavy use of).

Q6 - Two programming languages
------------------------------
### C
#### Advantages:
- Very fast, with a modern compiler it runs bare metal speed.
- Good for algorithms, hardcore processing.
- Total control of "under the hood" stuff like memory management, caching, etc.
- Very long history. Standardized and ubiquitous, many tools available, and the opensource ones are as good as any paid one (even custom compilers built by CPU makers).

#### Disadvantages:
- Very low-level and complicated. Hard to divine what is happening by reading the code, even if you wrote it yourself.
- Because memory management is the sole responsibility of the programmer, it is highly insecure - vulnerabilities can come from anywhere. A classic example was an integer-overflow vulnerability where a specially crafted malicious JPEG picture was able to give an attacker control of an entire system by deliberately writing executable code to memory that it should not have had access to, then running it from user space to break into root space.
- Not very friendly for rapid development. Being a compiled language, repeated build cycles are needed to test, or specialized testing tools built into the build environment (like Valgrind).

### Python
#### Advantages:
- Fast and extensible.
- Garbage-collected for security and stability (no integer-overflows-into-root-space).
- Easy to read syntax.
- With Cython, can be extended with external libraries that run at C and Assembly speed, or even on GPU for things like machine learning (PyTorch etc).

#### Disadvantages:
- Version conflicts between 2.7 and 3.5+ code unlikely to be resolved soon.
- Messy and easy to screw up development environment. Lots of reinstalling and faith required, and hence every setup likely to be different.

Q7 - Two ethical issues, One case study
---------------------------------------

### Criminal acts such as theft, fraud, trafficking and distribution of prohibited substances, terrorism  

The balancing of user privacy and autonomy with responsibility to protect society is fraught. Any communication technology can be used to organize groups, and some of them can have nafarious aims.  

I don't believe it is up to an IT professional to be a policing authority. Governments are concerned about encryption, and naturally wish to exercise control over it. However, they do not have control over un-recorded speech between people offline, and should not expect to be granted access to private communication online. Governments are no less accountable than any citizen, and in the case a government becomes compromised or hostile, it becomes important that citizens maintain the ability to organize.  

Encryption with backdoors for "the good guys" is simply not secure against any attacker. A backdoor and a vulnerability are practically identical. Backdoors legislation should be resisted always.

### Trading of shares on the stock exchange OR crypto-currencies

In recent years High-Frequency Trading (HFT) has become big business. Internet connections in Wall Street are among the fastest in the world. The idea of conducting thousands of trades per second was terrifying to stock markets a few years ago, but appears to have settled into a niche without huge disruption.

Cryptocurrencies present no particular ethical problem except their excessive and growing use of electricity, and the use of bot-nets of compromised machines to mine crypto currencies for hackers.

### Case Study: Personal Information, Cambridge Analiytica et al, The Graph, And Manipulating Millions.

"Big Data" is the biggest thing to happen to election campaigns probably ever. The ability to tailor messages and advertisements to the feelings (almost always fear) of thousands or specific groups of voters is without precedent. It is a perfect storm of wide adoption of social media through all demographics (including the less savvy), advances in Artificial Intelligence and Data Science and Moore's Law providing the computing power to chug through unbelievable amounts of data.  

Some time around [2015][13], Cambridge Analytica recruited about 270,000 people to install an app as part of a paid study (academic purposes only). The app had access to their facebook profiles. Consent was given and it was not a big deal. Except that not only did the app gather data from the people who installed the app, but also nearly all of their facebook friends. 270,000 people became 87,000,000.  

The data collected was detailed enough (and Cambridge Analytica's software was clever enough) to build frighteningly accurate profiles of people's personality, likes, dislikes, location, political leanings, etc etc. To give an idea of how powerful AI has become, a separate study found it could [tell a person's sexuality][14] with 91% accuracy using nothing but photographs of their faces).  

These profiles were used for political persuasion. Though the results are impossible (even for the researchers) to pin down exactly, this and similar targeted, data-heavy ad campaigns are thought largely responsible for the swing in western nations toward conservative politics - Brexit, Trump, etc.  

As to how an IT professional could respond to such things? It's hard to say. There may not be anything that can be done except to try to inform everyone you can to share less personal information, to try to maintain scepticism. It's a losing battle though - human brains are ancient and can't be patched like software. [The smartest of us can be manipulated][15], and the information that an AI can use will not be obvious to us.  

Simply refusing to participate may be tantamount to standing back and letting it happen - there will always be bad actors willing to pursue this technology, so if good people refuse it's an overall loss.

[13]:https://en.wikipedia.org/w/index.php?title=Facebook%E2%80%93Cambridge_Analytica_data_scandal&oldid=948823015
[14]:https://www.theguardian.com/technology/2017/sep/07/new-artificial-intelligence-can-tell-whether-youre-gay-or-straight-from-a-photograph
[15]:https://www.pcworld.com/article/221504/8_security_tips_to_learn_from_the_hbgary_hack.html


Q8 - Control Flow
-----------------

Control flow simply means running different code in response to different conditions. At it's simplest it's means running one set of instructions if a condition is met, and another (or none at all) if it is not:

```
if condition == true
  # do something
  puts "foo"
else
  # do something else
  puts "bar"
end
```
"condition" here can be the name of a variable (in which case the above Ruby will evaluate "true" if the variable is defined and not "nil", and "false" if it's undefined or set to "nil")
"==" is a special case of "equals" - a comparison, where a single "=" means assignment of a value. Comparison implies either true or false.

Ruby takes this further - one need only write ```if condition```, and it will automatically return true or false so the comparison is redundant.

Going beyond if-statements, code can loop or iterate a given number of times, until a condition is met, or forever in the case of a bug, or it can run different blocks of code based on a list of possible conditions (a "case" statement).

Q9 - Type coercion
------------------

Variables in programming languages are expressed internally as one of several Data Types. Numbers can be integers, decimals (floating-point) of various flavours, fractions, strings, arrays of any number of dimensions, dictionaries and pointers to memory locations.  

It is possible to write an expression that mixes types, like adding an integer to a float, or dividing two integers (but expecting a correct result), etc.  

Type Coercion happens when the interpreter or compiler automatically converts data types in order to make the code execute without error, when it makes sense to do so. In the case of 1 + 3.14159, it will convert "1" to a float before adding it to the other float, so the correct answer is given. If coercion happened the other way we would end up with 4 instead of 4.14159.

Q10 - Data Types
----------------

Expanding on type coercion, here are some common data types:

- (Signed) Integers: 1, 43, -593, 65535  
  An unsigned integer would begin at zero. A signed one uses an extra bit to encode the sign. Some legacy data formats use unsigned int, such as telephone signals (8-bit unsigned ints sampled 8000 times per second with a possible range of 0-255)
- Floating point numbers: 3.1415926535898, 1.3245E30, 1.0  
  Conceptually easy to understand - a number with decimal places. In practice there are several standards and lengths. "Single precision" is 32 bits, "Double" is 64 bits, "short" is 16 bits (common in GPUs where precision is not as important as speed), etc.  
  Structurally, floating point numbers encode an "exponent" that represents the order of magnitude, and a "mantissa" that is analogous to the decimal places, but that depends entirely on the exponent. "Standard form" of expressing numbers in mathematics is closest to how floats work - any number becomes n.nnn * 10^x, where the n's are the mantissa and the x is the exponent.
- Strings: "foo", "bar", "Lorem Ipsum Dolor"
  Just text, of usually arbitrary length. The amount of bytes each character is encoded with is usually determined by the operating system, but usually UTF-8 or Unicode or one of the multitudes of codepages that are international standards. Not everyone uses the Roman alphabet.
- Chars: single characters. A string could be considered an array of chars.
- Arrays:  [1,2,"foo",1.4142,["wut",2,3,4],nil]  
  A list of values that can themselves be any data type (even arrays). The values can be referenced by an index that usually starts at zero.
- Dictionaries or Hashes:  {key: "value", key2: "value2"}  
  Similar to an array, but instead of an index we reference with another value, so we have a key:value pair structure.

Q11 - Here’s the problem:
-------------------------
### There is a restaurant serving a variety of food. The customers want to be able to buy food of their choice. All the staff just quit, how can you build an app to replace them?
- Identify the classes you would use to solve the problem
- Write a short explanation of why you would use the classes you have identified

I would have a menu hash full of Dish Class objects and prices as key:value pairs, a Table class with seat numbers, that I can associate Dish objects with and use to tally up the bill which would be per-table but split-able because it's assigned per seat.

**class Dish:**
- dish name
- ingredients (potentially with a spiel on each one, and wholesale prices of each. Ingredient will need it's own class eventually)
- price
- options (hot, mild, searing-pain, rare, blue, burnt etc)
- special status (dish of the day, chef's choice, etc)

**class Table:**
- location
- seats (list of seat objects)
- time since last served
- order list
- price tally

**class Seat:**
- table number
- Dish ordered
- time since order made
- price tally of Dish objects

**class Waiter:**
- processes orders
- delivers food
- interfaces with my Robot's API so we can do away with human staff.

**class Chef:**
- prompts chefBot with instructions and ingredients
- manages inventory
- cleans as it goes, maintaining HACCP compliance. My insurance doesn't cover food poisoning from robots.

It doesn't seem necessary for a menu to be a class, as a list should do. I might change my mind on this if I'm opening for lunch or having issues with RSA

Q12 - Code Fail
---------------

```ruby
celsius = gets
fahrenheit = (celsius * 9 / 5) + 32
print "The result is: "
print fahrenheit
puts "."
```
Two problems:
- "celcius" will be a string because gets always returns a string (with a newline on the end). It needs a ```gets.chomp.to_f```
- All numbers are ints, so the result will be based on truncated maths. The 5 at least should be expressed as ```5.0```

Q13 - Code Fail 2
-----------------

```ruby
arr = [5, 22, 29, 39, 19, 51, 78, 96, 84]
i = 0
while (i < arr.size - 1 and arr[i] < arr[i + 1])
	i = i + 1 end
puts i
    arr[i] = arr[i + 1]
    arr[i + 1] = arr[i]
```
This code fails because it is overwriting a value that it then looks up immediately after overwriting it. The last two lines need a rewrite. Either store the first as a variable and call it up later, or create a new array with the swapped values.  

So:
```ruby
arr = [5, 22, 29, 39, 19, 51, 78, 96, 84]
i = 0
while (i < arr.size - 1 and arr[i] < arr[i + 1])
	i = i + 1 end
puts i
    arri = arr[i + 1]
    arr[i + 1] = arr[i]
    arr[i] = arri
```
Will give the expected result. I have created a variable "arri" named for what the code originally said, but with no square brackets. I then store this back into the array at the correct location after copying arr[i] to arr[i+1].


Q14 - Prime numbers
-------------------
### Flow:
- create array from 1 to 100, in odd numbers only (no even number is prime. Might as well save some time and storage)
- using "select!" method (in-place array mutation), test each array element in turn to see if it is divisible by any number other than itself and 1.
  - begin at 3, because 2 is useless with odd numbers only, 1 will always return true.
  - end at number - 1, because number will return true.
  - use a method to check primeness. This is good for neatness and maintainability if I ever want to replace the algorithm with something that works faster for large numbers.
- print the resulting, drastically reduced array.


```ruby
def prime? (number)
  3.upto(number-1) do |i|
    return number % i == 0 ? false : next
  end
end

primes = (1..100).step(2).to_a

primes.select! do |i|
  prime?(i)
end

p primes
```

Q15 - Cold and Rainy
--------------------

```ruby
if temperature < 15
  if raining
    puts "It's wet and cold"
  else
    puts "It's not raining but cold"
  end
else
  if raining
    puts "It's warm and raining"
  else
    puts "It's warm but not raining"
  end
end
```

Q16 - Allergies
--------------

An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for). The list of items (and their value) that were tested are:
 - eggs (1)
 - peanuts (2)
 - shellfish (4)
 - strawberries (8)
 - tomatoes (16)
 - chocolate (32)
 - pollen (64)
 - cats (128)

So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

Write a program that, given a person’s score can tell them:
 a) whether or not they’re allergic to a given item
 b) the full list of allergies.

 ```ruby
 def list_allergies()
  page = <<-ALLERGIES
 - eggs
 - peanuts
 - shellfish
 - strawberries
 - tomatoes
 - chocolate
 - pollen
 - cats
  ALLERGIES
  puts page
end

def return_allergies(mask)
  allergies = ["eggs","peanuts","shellfish","strawberries","tomatoes","chocolate","pollen","cats"]
  arr = ("%08b" % mask).chars.reverse
  list = arr.each_index.select {|i| arr[i] == "1" }
  list.each {|i| puts allergies[i]}
end

return_allergies(34)
```