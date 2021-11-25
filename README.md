# Shell-Monitorar-IP-externo
Shell script para monitorar o IP externo de um dispositivo, e caso mude irá enviar por email o novo IP

## Dependências:

Obs: Debian based distros:

`sudo apt-get install ssmtp mailutils`

Após a instalação do pacote, configurar o `/etc/ssmtp/ssmtp.conf` de acordo com a sua necessidade. 

## Observações:
1. O ip que está contido nos arquivos é apenas um IP dummy, ao executar o script ele irá se atualizar automaticamente.
2. Não esquecer de inserir seu email corretamente dentro do **email.txt**
3. Executar o script na mesma pasta que os outros arquivos, caso não queira, mude os diretorios correspondentes dentro do script. 
## Uso:
Executar o script `ip_externo.sh`

### Opcional:
Insira o arquivo no crontab, exemplo:
- Executará todos os dias as 08:00h da manhã ...
> `0 8 * * * bash /caminho/do/script/ip_externo.sh > /dev/null 2>&1`
