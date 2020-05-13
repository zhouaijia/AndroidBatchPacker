#!/usr/bin/env bash
# 生成cli
./gradlew :packer-cli:clean :packer-cli:shadowJar
cp packer-cli/build/libs/packer-cli-all.jar packer-cli/packer-cli-all.jar
# 替换readme中的版本
VERSION_NAME=`grep VERSION_NAME gradle.properties`
VERSION_STRING=`echo $VERSION_NAME | cut -d '=' -f 2`
GROUP=`grep GROUP gradle.properties`
GROUP_STRING=`echo $GROUP | cut -d '=' -f 2`
for file in $(find . -name 'README.md'); do
 sed -i.bak -e "s/\(['\"]\)\(${GROUP_STRING}\):\(.*\):.*\(['\"]\)/\1\2:\3:${VERSION_STRING}\4/g" ${file}
 rm ${file}.bak
done
## 提交
# git add .
# git commit -m "update cli.jar & readme"
# git push origin HEAD

## upload jar & aar
# ./gradlew clean bintrayUpload -x :app:clean

## git tag
# git tag v$VERSION_STRING
# packergit push origin v$VERSION_STRING