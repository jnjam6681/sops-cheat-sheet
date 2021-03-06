# Sops Cheat Sheet

Simple and flexible tool for managing secrets

---
## Install dependentcies
<b>Install sops for mac</b>
```
brew install sops
```

<b>Install gnupg for mac</b>
```
brew install gnupg
```

<b>Install age for mac</b>
```
brew install age
```

---
## Gnupg
#### Generate certificate
```
gpg --full-generate-key
```

#### List key
| Commands                | Description          |
| ----------------------- | -------------------- |
| ```gpg --list-key```        | list all public key  |
| ```gpg --list-secret-key``` | list all private key |

#### Encryption
| Commands                                        | Description |
| ----------------------------------------------- | ----------- |
| `sops -pgp <your_public_key> -i -e secrets.env` | encrypt     |
| `sops -pgp <your_public_key> -i -d secrets.env` | decrypt     |


#### Sops configure file
<b>.sops.yaml</b> -> sops configure file

```
creation_rules:

  # Specific to `dev_a` env
  - path_regex: .*secret.env
    # Here, only the `Alice` key-id
    pgp: >-
      44A6623C65C5ABA5ED5B754C58DD4F4522D6FFBC
```

<b>IMPROTANT</b> everytime before encrypt you make sure that the secret is not encrypted.

`sops -i -e secrets.env` -> encrypt

`sops -i -d secrets.env` -> decrypt


#### Export private key
```
gpg --list-secret-keys
```
```
gpg --export-secret-keys <your_id> > private.key
```

#### Import private key
```
gpg --import private.key
```

#### Edit expire date
```
gpg --edit-key <your_id>
```
` > expire`

#### Remove certificate
| Commands                                    | Description        |
| ------------------------------------------- | ------------------ |
| `gpg --delete-key <your_public_id>`         | remove public key  |
| `gpg --delete-secret-key <your_private_id>` | remove private key |
---

## Age
<b>Generate certificate</b>
```
age-keygen -o key.txt
```

<b>Encryption</b>
```
sops -a age1vrvm0ym63632keqjssa2c6q869c7m8mt4ev2ar2pd7waxel29cwq3s67qm -i -e pf-secret.env
```

<b>Decryption</b>
```
SOPS_AGE_KEY_FILE=key.txt sops -a age1vrvm0ym63632keqjssa2c6q869c7m8mt4ev2ar2pd7waxel29cwq3s67qm -i -d pf-secret.env
```

---

## Referrences
- [https://github.com/mozilla/sops](https://github.com/mozilla/sops)
- [https://github.com/FiloSottile/age](https://github.com/FiloSottile/age)
- [https://dev.to/stack-labs/manage-your-secrets-in-git-with-sops-common-operations-118g](https://dev.to/stack-labs/manage-your-secrets-in-git-with-sops-common-operations-118g)
- [https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine](https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine)
- [https://nickjanetakis.com/blog/creating-and-managing-a-gpg-key-pair](https://nickjanetakis.com/blog/creating-and-managing-a-gpg-key-pair)
- [https://stackoverflow.com/questions/33361068/gnupg-there-is-no-assurance-this-key-belongs-to-the-named-user](https://stackoverflow.com/questions/33361068/gnupg-there-is-no-assurance-this-key-belongs-to-the-named-user)