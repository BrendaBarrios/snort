
# Archivo de configuración para las reglas locales en snort 
sudo rm /etc/snort/rules/local.rules

echo " Insertando reglas locales ....." 

echo '

alert icmp $EXTERNAL_NET any -> $HOME_NET any (msg:"ping al servidor"; sid:10000001; rev:001;)

alert tcp any any -> $HOME_NET 80 (msg:"Regla del http"; sid:10000003; rev:003;)

alert tcp any any -> $HOME_NET 80 (msg:" Entrando al admin"; content:"GET /admin"; sid:10000002; rev:002;)

alert tcp any any -> $HOME_NET 3306 (msg:"Alguien intenta entrar a la base de datos"; sid:10000004;rev:004; )

alert tcp $EXTERNAL_NET any -> $HOME_NET 22 (msg:"Detectando conexión por ssh";sid:1000005; rev:005;) 


'| sudo tee /etc/snort/rules/local.rules

echo " Se temino de copiar las reglas locales"