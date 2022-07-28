## Installation

This plugin gets installed through ```bitops.config.yaml``` in the bitops core level. This file is located [here](https://github.com/bitovi/bitops/blob/plugins/bitops.config.yaml)


### Sample Config

```
bitops:
  fail_fast: true 
  run_mode: default
  logging:      
    level: DEBUG
    color:
      enabled: true
    filename: bitops-run
    err: bitops.logs
    path: /var/logs/bitops
  opsrepo_root_default_dir: _default
  plugins:    
    aws:
      source: https://github.com/bitops-plugins/aws
...
...
...

```

## Installed Libraries
``awscliv2`` and ``aws-iam-authenticator`` libraries gets installed as part of aws plugin installation of BitOps