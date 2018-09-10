DISTRO="Your Cloudfront Distro ID"
yarn run build
aws s3 sync dist/ s3://oncipher --profile cipher
rm -rf dist/
aws cloudfront create-invalidation --distribution-id $DISTRO --paths "/*"
