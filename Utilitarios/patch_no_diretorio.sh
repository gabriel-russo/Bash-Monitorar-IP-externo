#!/bin/bash

# Diretório de origem
src_dir="<diretório de origem>"

# Diretório de destino
dst_dir="<diretório de destino>"

# Loop para percorrer todos os arquivos no diretório de origem
for file in $src_dir/*; do
  # Verifica se o arquivo é um diretório ou não
  if [ ! -d "$file" ]; then
    # Obtém o nome do arquivo sem o caminho completo
    filename=$(basename "$file")
    
    # Verifica se o arquivo existe no diretório de destino
    if [ -f "$dst_dir/$filename" ]; then
      # Compara os arquivos e copia somente se diferentes
      cmp -s "$file" "$dst_dir/$filename"
      if [ $? -ne 0 ]; then
        cp "$file" "$dst_dir/$filename"
        echo "Arquivo $filename atualizado"
      fi
    else
      cp "$file" "$dst_dir/$filename"
      echo "Arquivo $filename copiado"
    fi
  fi
done

