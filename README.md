# SSH Public Key Generator

Generate SSH **public** keys with ease! This simple Bash script allows you to generate SSH **public** keys in various formats.

Generating only the **public part of an SSH key** may be necessary for your tests, your developments... enjoy!

🔑 **Supported Key Types:**

-   ed25519 (default)
-   dsa
-   ecdsa
-   ecdsa-sk
-   ed25519-sk
-   rsa

## Usage

```bash
./generate-ssh-key.sh [options]
```

## Options

-   `-t`, `--type <type>`: Specify the key type (dsa|ecdsa|ecdsa-sk|ed25519|ed25519-sk|rsa)
-   `-h`, `--help`: Display this help and list of available key types

If no key type is specified, the default key type is used (ed25519).

Example:

```bash
./generate-ssh-key.sh -t ed25519
```

## License

This project is licensed under the MIT License. See the LICENSE file for details.

<div align="center"><b>Enjoy generating SSH keys with ease!</b> 🚀🔐</div>
