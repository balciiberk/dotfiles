[openstack](openstack)
[catch up](catch-up)
[secrets](secrets)
[hackathon](hackathon)
[goals](goals)
[stress testing](stress-testing)



2023-09-29 09:37:29.472  WARN 7 --- [nio-8080-exec-3] m.t.IamDynamicServerConfigurationService : Couldn't load configuration for https://cms-auth-dev.web.cern.ch/: com.google.common.util.concurrent.UncheckedExecutionException: org.springframework.web.client.ResourceAccessException: I/O error on GET request for "https://cms-auth-dev.web.cern.ch/.well-known/openid-configuration": Certificate for <cms-auth-dev.web.cern.ch> doesn't match any of the subject alternative names: [auth.web.cern.ch, alice-auth.cern.ch, alice-auth.web.cern.ch, amber-auth.cern.ch, amber-auth.web.cern.ch, atlas-auth.cern.ch, atlas-auth.web.cern.ch, cms-auth.cern.ch, cms-auth.web.cern.ch, compass-auth.cern.ch, dteam-auth.cern.ch, fcc-auth.cern.ch, lhcb-auth.cern.ch, lhcb-auth.web.cern.ch, moedal-auth.cern.ch, ops-auth.cern.ch, wlcg-auth-dev.cern.ch, wlcg-auth-dev.web.cern.ch]; nested exception is javax.net.ssl.SSLPeerUnverifiedException: Certificate for <cms-auth-dev.web.cern.ch> doesn't match any of the subject alternative names: [auth.web.cern.ch, alice-auth.cern.ch, alice-auth.web.cern.ch, amber-auth.cern.ch, amber-auth.web.cern.ch, atlas-auth.cern.ch, atlas-auth.web.cern.ch, cms-auth.cern.ch, cms-auth.web.cern.ch, compass-auth.cern.ch, dteam-auth.cern.ch, fcc-auth.cern.ch, lhcb-auth.cern.ch, lhcb-auth.web.cern.ch, moedal-auth.cern.ch, ops-auth.cern.ch, wlcg-auth-dev.cern.ch, wlcg-auth-dev.web.cern.ch]


2023-05-22 14:34:51.315 WARN 7 --- [pool-1-thread-1] com.zaxxer.hikari.pool.PoolBase : HikariPool-1 - Failed to validate connection com.mysql.cj.jdbc.ConnectionImpl@5df827f9 (No operations allowed after connection closed.). Possibly consider using a shorter maxLifetime value.


dbeaver

newdle.cern.ch

gitlab registry
glpat-yx4FEezUKvDKpANXry3A

actions:
- debug wlcg-auth-dev
- create cms-auth-dev
- test 1.8.2 update on wlcg-auth-dev
- create an outage











htcondor voms 

osg
vs.
egi



