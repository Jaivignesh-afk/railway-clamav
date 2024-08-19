# railway-clamav

ClamAV is an open-source antivirus engine for detecting trojans, viruses,
malware, and other malicious threats. Visit [https://docs.clamav.net/](https://docs.clamav.net/)
for more information.

This template deploys ClamAV to [Railway](https://railway.app/). It uses the
[official ClamAV Docker image](https://hub.docker.com/r/clamav/clamav/), and
modifies it to support configuration via environment variables.

To configure ClamAV via environment variables, set
`CLAMD_CONF_${CONFIGURATION_KEY}=${VALUE}` where `CONFIGURATION_KEY` is the
name of the configuration specified in [`clamd.conf`](https://linux.die.net/man/5/clamd.conf)
and `VALUE` is the value you want to set.

[`freshclam.conf`](https://linux.die.net/man/5/freshclam.conf) can also be
configured this way using `FRESHCLAM_CONF_${CONFIGURATION_KEY}=${VALUE}`.

Example(s):

- To set `StreamMaxLength=100M` in `clamd.conf`, set `CLAMD_CONF_StreamMaxLength=100M` in the environment
- To set `ConnectTimeout=30` in `freshclam.conf`, set `FRESHCLAM_CONF_ConnectTimeout=30` in the environment
