# certgen
A simple certificate generator utility tool to generate self-signed certificates.

### Metadata

You can put all the information in a `certmeta` file in the following format:

```
C:US
ST:IL
L:Chicago
O:SecureOrg
```

### Execution

`$ ./certgen.sh example.com`


### Output

The certificate and key are stored in `server.crt` and `server.key` files respectively. 


