#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Uso: $0 <versão> (exemplo: 6.8.2)"
  exit 1
fi

LONG_VERSION="$1"
SHORT_VERSION=$(echo "$LONG_VERSION" | cut -d. -f1,2)

NAMES=(
  "qt-everywhere-src"
  "qt-everywhere-opensource-src"
)

downloaded_file=""

# Verifica se algum arquivo já existe ou tenta baixar sequencialmente
for name in "${NAMES[@]}"; do
  filename="${name}-${LONG_VERSION}.tar.xz"
  
  if [ -f "$filename" ]; then
    echo "Arquivo já existe: $filename"
    downloaded_file="$filename"
    break
  else
    if wget "https://download.qt.io/official_releases/qt/${SHORT_VERSION}/${LONG_VERSION}/single/$filename"; then
      echo "Download concluído: $filename"
      downloaded_file="$filename"
      break
    else
      echo "Falha ao baixar $filename, tentando próximo..."
    fi
  fi
done

if [ -z "$downloaded_file" ]; then
  echo "Erro: Não foi possível baixar nenhum arquivo."
  exit 1
fi
