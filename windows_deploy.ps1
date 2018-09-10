yarn run build
aws s3 sync dist/ s3://oncipher/
Remove-Item -Recurse -Force .\dist
aws cloudfront create-invalidation --distribution-id E3J6RNRBVSAFVO --paths "/*"
