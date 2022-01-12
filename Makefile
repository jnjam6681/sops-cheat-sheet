
encrypt:
	sops -i -e ./secrets/*

run:
	SOPS_AGE_KEY_FILE=key.txt sops -i -d ./secrets/* 