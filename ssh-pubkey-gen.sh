#!/bin/bash
#R4VEN - https://github.com/Ravinou - 2023

default_key_type="ed25519"
valid_key_types=("dsa" "ecdsa" "ecdsa-sk" "ed25519" "ed25519-sk" "rsa")

# Display help
function display_help() {
    echo
    echo "Usage: $0 [options]"
    echo
    echo "Options:"
    echo "  -t, --type <type> : Specify the key type (dsa|ecdsa|ecdsa-sk|ed25519|ed25519-sk|rsa)"
    echo "  -h, --help        : Display this help and list of available key types"
    echo "If no key type is specified, the default key type is used (ed25519)"
    echo
    echo "Available key types: ${valid_key_types[*]}"
    echo
    echo "Example: $0 -t ed25519"
}

# Default to using ed25519
key_type="$default_key_type"

# Check the number of arguments
if [ "$#" -eq 0 ]; then
    # No arguments specified, use the default key type (ed25519)
    :
elif [ "$#" -eq 2 ]; then
    while [ "$#" -gt 0 ]; do
        case "$1" in
            -t|--type)
                shift
                key_type="$1"
                if [[ ! " ${valid_key_types[*]} " =~ " $key_type " ]]; then
                    echo "Error: Invalid key type. Available key types: ${valid_key_types[*]}"
                    display_help
                    exit 1
                fi
                ;;
            -h|--help)
                display_help
                exit 0
                ;;
            *)
                echo "Error: Unrecognized argument"
                display_help
                exit 1
                ;;
        esac
        shift
    done
else
    echo "Error: You can only specify one key type at a time."
    display_help
    exit 1
fi

# Generate the public key in the specified format
ssh-keygen -t "$key_type" -f /tmp/temporary_key -N "" -C "ssh-pubkey-gen@test" | tail -n 0

# Display the public key
cat /tmp/temporary_key.pub

# Remove the temporary key
rm -f /tmp/temporary_key /tmp/temporary_key.pub
