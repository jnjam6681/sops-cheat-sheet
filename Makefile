
encrypt:
	sops -i -e secrets.env

run:
	SOPS_AGE_KEY_FILE=key.txt sops -i -d secrets.env