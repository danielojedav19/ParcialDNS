\# Parcial – DNS Maestro/Esclavo con BIND9 + Apache + Ngrok



Realizado por: Daniel Ojeda  

Entorno: Windows + VirtualBox + Vagrant  

VMs: Ubuntu (ubuntu/jammy64)







\## Topología



VM1: servidor-maestro  

IP: 192.168.56.10  

Rol: DNS Maestro + Apache



VM2: servidor-esclavo  

IP: 192.168.56.11  

Rol: DNS Esclavo + Cliente de pruebas



Red privada: 192.168.56.0/24







\## DNS con BIND9



\- Configuración Maestro/Esclavo

\- Zona directa e inversa

\- Transferencia segura (AXFR)

\- NOTIFY automático

\- Protección contra Open Resolver



Pruebas realizadas con:



dig @192.168.56.11 parcial.danielojeda.com A  

dig @192.168.56.11 -x 192.168.56.10  







\## Apache con compresión gzip



Módulos activados:



\- mod\_deflate

\- mod\_headers



Pruebas:



curl -I http://parcial.danielojeda.com  

curl -I -H "Accept-Encoding: gzip" http://parcial.danielojeda.com  



Se verificó:



Content-Encoding: gzip  

Vary: Accept-Encoding  







\## Verificación con Wireshark



\- Captura en interfaz cliente

\- Filtro: http

\- Confirmación de cabecera gzip







\## Exposición con Ngrok



Se ejecutó:



ngrok http 80



Redirigiendo hacia:



192.168.56.10:80



Se verificó acceso remoto correcto.







\## Impacto de la compresión



Ventajas:

\- Reduce tráfico

\- Mejora tiempos de carga



Desventajas:

\- Incremento leve en uso de CPU







\## Conclusión



Se implementó correctamente:



\- DNS Maestro/Esclavo seguro

\- Apache con compresión activa

\- Validación técnica

\- Exposición a Internet

