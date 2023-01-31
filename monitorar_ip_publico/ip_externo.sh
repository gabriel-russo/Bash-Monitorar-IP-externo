#!/bin/bash
 
#Script to report public IP address change
#By: Ronny L. Bull
#Modificado por: Gabriel M. Russo	

#Arquivo texto com o ip externo
IP_FILE="$pwd/ip_externo.txt"
 
#Ip atual pelo ifconfig.me
IP_CURRENT=$(curl ifconfig.me)

#Verifica se é um arquivo válido
if [ -f "$IP_FILE" ]; then
  KNOWN_IP=$(cat $IP_FILE)
else
  #Arquivo invalido entao, inicia-se um valido
  echo "$IP_CURRENT" > $IP_FILE
  KNOWN_IP=$(cat $IP_FILE)
fi
 
#Verifica se o IP mudou
if [ "$IP_CURRENT" != "$KNOWN_IP" ]; then
 
  #Escreva novo ip no arquivo
  echo $IP_CURRENT > $IP_FILE
  
  #Atualize o conteudo do email que sera enviado para o novo IP	  
  sed -i -r "s/\b(([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3}))$/$IP_CURRENT/g" email.txt
  
  #Envie o email
  sendmail -vt < email.txt
 
  #Nao ha necessidade de enviar email caso nao tenha mudado...  
fi

