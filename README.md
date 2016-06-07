#nuaactf-bundle

首先 你需要一个docker环境，然后按顺序执行下列命令

## 构建docker镜像
```
cd images/nuaactf-python
docker build -t="nuaactf-python:latest" .

cd ../nuaactf-php-fpm
docker build -t="nuaactf-php-fpm:latest" .
cd ../../
```

## 运行环境

```
./run.sh
```

## 导入sql数据
```
./mysql_import.sh
```

## 重新加载赛提数据
```
./tasks_reload.sh
```