# tunnel
## in cern
ssh -D 8080 bbalci@cmsusr
## outside cern
ssh -t -L 8080:localhost:8080 bbalci@lxplus.cern.ch ssh -D 8080 bbalci@cmsusr

# grid
voms-proxy-init -voms cms -rfc  -valid 192:00

# local DQM
http://hcalmon.cms/hcaldqm/index.py

# iCMS
https://cms.cern.ch/iCMS/

# raddam notes
## conference note:
https://cms.cern.ch/iCMS/jsp/openfile.jsp?type=CR&year=2018&files=CR2018_413.pdf
## pg162
https://link.springer.com/content/pdf/10.1140/epjc/s10052-007-0459-4.pdf
