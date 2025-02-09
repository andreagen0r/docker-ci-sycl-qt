#!/bin/bash

# Verifica se a versão foi fornecida
if [ $# -ne 1 ]; then
    echo "Uso: $0 <versão> (exemplo: 6.8.2)"
    exit 1
fi

# Extrai as versões curta e longa
LONG_VERSION="$1"
SHORT_VERSION=$(echo "$LONG_VERSION" | cut -d. -f1,2)

# Constroi a URL
URL="https://download.qt.io/official_releases/qt/${SHORT_VERSION}/${LONG_VERSION}/single/qt-everywhere-src-${LONG_VERSION}.tar.xz"

# Faz o download usando wget
echo "Iniciando download da versão $LONG_VERSION..."
wget "$URL"

echo "Download concluído!"
