# Changelog

## 1.0.0

Provides 3 convenience functions to aid with SSL connections to
public NervesHub instances:

* `NervesHubCAStore.file_path/0` -> path to generated cacerts.pem
* `NervesHubCAStore.certificates/0` -> Reads the cacerts.pem in as
  a list of OTP certificates
* `NervesHubCAStore.cacerts/0` -> Reads the cacerts.pem in as a list
  of DER encoded certificates
