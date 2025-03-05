# 依赖

## yaml文件解析

```shell
go get gopkg.in/yaml.v2
```

## 日志

```shell
go get github.com/sirupsen/logrus
```

## gin引入

```shell
go get -u github.com/gin-gonic/gin
```

将gin引入到代码

```shell
import "github.com/gin-gonic/gin"
```

如果需要使用http.StatusOk之类的http状态常量，则需要引入net/http包：

```shell
import "net/http"
```

## 热加载

### 工具1

```shell
go install github.com/pilu/fresh@latest

#再终端里运行
fresh
```

### 工具2

```shell
go get -u github.com/codegangsta/gin
go run main.go
```

# 注意点

## gin中间件中使用goroutine

当在中间件或者handler中启动新的goroutine时，不能使用原始的上下文(c \*gin.Context)，必须使用其只读副本c.Copy()

