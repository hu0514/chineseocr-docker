1 构建镜像
docker build -t chineseocr .

2 下载chineseocr代码
git库：https://github.com/chineseocr/chineseocr
将模型文件下载下来放到models文件夹

3 运行容器
docker run -dit -p 8080:8080 -v /tmp/chinese/chineseocr-app2:/chineseocr chineseocr python3 app.py

4：访问测试
http://ip:8080/ocr