# Container Images for pwncat CI/CD-based testing

These container images serve as GitHub Actions "service" containers to provide
bind and reverse shells as well as SSH for linux hosts. This allows us to
point `pytest` at these existing instances and run automated testing.

## Linux Containers (Ubuntu/CentOS)

Each Linux container exposes three ports:

- SSH via Port 22
- Bind Shell via Port 4444
- Reverse Shell Trigger via Port 9999

To trigger a reverse shell, send a line of text to `:9999` containing a host/port
combo. For example:

```sh
echo "$LISTENER_IP:4444" > /dev/tcp/$CONTAINER_IP/9999
```

This will trigger a connection from the container to `$LISTENER_IP` on port `4444`.
This is easiest if both the listener and the vulnerable host are containers.

## Windows Containers

The windows container runs similar services except without the SSH service.
It will start a bind shell on port `4444`, and a reverse shell trigger on `9999`.
The reverse shell trigger behaves in the same way as the Linux version. The
key difference with Windows is that the bind shell can only handle a single
connection at a time. Further connections will hang until the first is closed.
