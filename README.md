# certgen
A simple certificate generator utility tool to generate self-signed certificates.

### Metadata

You can put all the information in a `certmeta` file in the following format:

```
[ req ]
default_bits        = 2048
distinguished_name  = req_distinguished_name
prompt              = no
output_password	    = mypass

[ req_distinguished_name ]
C                   = GB
ST                  = Test State or Province
L                   = Test Locality
O                   = Organization Name
OU                  = Organizational Unit Name
CN                  = Common Name
emailAddress        = test@email.address
```

### Execution

`$ ./certgen.sh`

`$ ./certgen.sh --read` to read the generated certificate file


### Output

The certificate and key are stored in `.crt` and `.key` files respectively matching the `Common Name`.


