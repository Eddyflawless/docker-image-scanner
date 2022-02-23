# docker-image-scanner


## Create an env in the root directory
```touch .env ```

## Add your snyk token
cat | echo >> .env-test <<EOF snyk_token=[your-token-here]
EOF

## make files executeable
```chmod +x docker-scan.sh init.sh ```


