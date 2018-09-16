# docker for cloud9 ide
It's unbuntu based cloud9 ide. To run

```bash
$ docker run -td  -p <local-port>:8182 dock-c9:1
```

### Example
```
$ docker run -td  -p 8182:8182 dock-c9:1
```
<br/>

### Custome path
Pass env "C9_PATH" value to change working directory(WD). Default WD="/work/c9sdk")
```bash
$ docker run -td  -p 8182:8182 -e C9_PATH=<path> dock-c9:1
```
### Example
```
$ docker run -td  -p 8182:8182 -e C9_PATH=/ dock-c9:1
```

### Reference
Cloud9 Core - https://c9.github.io/core/ https://c9.io

### Have fun !!
