# マニュアルの生成

```sh
docker build -t buildroot .
docker run -v "$(pwd)/docs:/workdir/docs:ro" -v "$(pwd)/output:/workdir/output" buildroot make manual-html
```
