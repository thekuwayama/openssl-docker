# openssl-docker

docker run example

```
$ docker run -v /path/to/crt/and/key:/tmp -p 4433:4433 -it thekuwayama/openssl openssl s_server -cert /tmp/server.crt -key /tmp/server.key -tls1_3
```

```
$ docker run -it thekuwayama/openssl openssl s_client -connect localhost:4433 -tls1_3
```
