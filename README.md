
## Build Qt com Intel DPC++
Para criar uma imagem docker com Qt e SYCL utilize o arquivo **Dockerfile.SYCL.Qt6.8.2**  
Caso Precise criar com outra versão da Qt diferente da 6.8.2, altere a versão dentro do arquivo.  

```Dockerfile
ARG QT_SHORT_VERSION="6.8"
ARG QT_FULL_VERSION="${QT_SHORT_VERSION}.2"
```

### Como fazer o build da imagem docker  
Faça o download da versão pretendida utilizando o script **download-qt.sh**  

```bash
./download-qt.sh 6.8.2

docker build --no-cache -f Dockerfile.SYCL.Qt6.8.2 -t sycl2025-qt6-8-2 .
```
