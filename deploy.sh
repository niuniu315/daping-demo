rm -rf dist &&
yarn build &&
cd dist &&
git init &&
git add . &&
git commit -m "update" &&
git branch -M demo-1 &&
git remote add origin git@github.com:niuniu315/daping-demo-website.git &&
git push -f -u origin demo-1 &&
cd ..
# 部署成功提供Github Pages 链接
echo https://niuniu315.github.io/daping-demo-website/index.html

