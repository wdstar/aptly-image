aptly Docker image
==================

## Contents

This image consists of debian:stable-slim + aptly.

## Usage

```
$ docker run -d -v '/root/.gnupg:/root/.gnupg:rw' whitestar/aptly
or
$ sudo mkdir /var/lib/aptly
$ docker run -d -v '/root/.gnupg:/root/.gnupg:rw' -v '/var/lib/aptly:/aptly-data:rw' whitestar/aptly
```

## Configurations

- `/etc/aptly.conf`: configuration file.
- `/root/.gnupg`: for GNU PG signing.
- `/aptly-data`: persistent volume.
- `8080`: distribution service port.
- `8081`: REST API service port.
- `sandbox` repository: default dummy repository.

## License and Authors

- Author:: wdstar at github.com

```text
Copyright 2017, wdstar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
