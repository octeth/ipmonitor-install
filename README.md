<H2> IPmonitor installer </H2>

Welcome to Ipmonitor installer.
<br/>
<h4>Requirements:</h4> 
- Fresh installed Ubuntu server 22.04
- IPmonitor license.dat file uploaded to some directory on server
- Dockerhub username and accesskey (will be removed soon)

<br/>
To install application you need to invoke bash script in such way:<br/>
<code>
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/octeth/ipmonitor-install/master/installer.sh)"
</code>
<br/>
 It will create directory in /opt/ipmonitor, prepares docker and launchs the stack
