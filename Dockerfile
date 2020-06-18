FROM golang:1.7.0-alpine AS builder

ENV GO111MODULE=on \
    CGO_ENABLED=1

WORKDIR /build

# Copia o código necessário para o build da aplicação
COPY . .

# Build da aplicação
RUN go build soma.go

# Cria o diretorio /dist contendo apenas os arquivos necessários para o runtime
# Depois, serão copiados como / (root) da imagem resultante
WORKDIR /dist
RUN cp /build/soma ./soma

# Cria a imagem mínima para runtime, baseado na imagem raiz
FROM scratch

COPY --chown=0:0 --from=builder /dist /

ENTRYPOINT ["/soma"]