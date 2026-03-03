# Parcial – DNS Maestro/Esclavo con BIND9 + Apache + Ngrok

**Realizado por:** Daniel Ojeda  
**Entorno:** Windows + VirtualBox + Vagrant  
**Máquinas virtuales:** Ubuntu (ubuntu/jammy64)

---

## Topología de Red

**VM1 – servidor-maestro**  
- IP: 192.168.56.10  
- Rol: DNS Maestro + Servidor Web Apache  

**VM2 – servidor-esclavo**  
- IP: 192.168.56.11  
- Rol: DNS Esclavo + Cliente de pruebas  

**Red privada:** 192.168.56.0/24  

---

## DNS con BIND9

### Configuración implementada

- Servidor DNS Maestro / Esclavo
- Zona directa
- Zona inversa
- Transferencia de zona (AXFR)
- NOTIFY automático
- Restricción para evitar Open Resolver

### Archivos de configuración incluidos

- named.conf.local
- named.conf.options
- db.empresa.local
- db.danielojeda.com
- db.192

###  Pruebas realizadas

Desde el servidor esclavo:

```bash
dig @192.168.56.11 parcial.danielojeda.com A
dig @192.168.56.11 -x 192.168.56.10
```

Resultados esperados:
- Resolución correcta del dominio
- Resolución inversa correcta
- Autoridad del servidor esclavo

---

## Servidor Web Apache

###  Configuración

VirtualHost personalizado en:

```
/etc/apache2/sites-available/parcial.conf
```

Dominio configurado:
```
parcial.danielojeda.com
```

###  Compresión GZIP activada

Módulos habilitados:

- mod_deflate
- mod_headers

Comando utilizado:

```bash
sudo a2enmod deflate
sudo systemctl restart apache2
```

---

##  Pruebas con curl

Sin compresión:

```bash
curl -I http://parcial.danielojeda.com
```

Con compresión:

```bash
curl -I -H "Accept-Encoding: gzip" http://parcial.danielojeda.com
```

Se verificó la presencia de:

```
Content-Encoding: gzip
Vary: Accept-Encoding
```

---

## Verificación con Wireshark

- Captura realizada en interfaz del cliente
- Filtro aplicado: `http`
- Se confirmó cabecera `Content-Encoding: gzip`
- Se verificó reducción de tamaño en paquetes HTTP

---

## Exposición del Servidor con Ngrok

Comando ejecutado:

```bash
ngrok http 80
```

Redirigiendo hacia:

```
192.168.56.10:80
```

Se generó una URL pública que permitió acceder al servidor web desde fuera de la red local.

Se creó página personalizada:

```
pagina_ngrok.html
```

Contenido verificado remotamente.

---

## Impacto Técnico de la Compresión

### Ventajas
- Reduce tráfico de red
- Mejora tiempos de respuesta
- Optimiza ancho de banda
- Mejora experiencia del usuario

### Desventajas
- Incremento leve en uso de CPU
- Mayor procesamiento en el servidor

---

## Conclusión

Se implementó correctamente:

- Infraestructura DNS Maestro/Esclavo funcional
- Servidor Apache configurado con VirtualHost
- Compresión GZIP activa y validada
- Captura y análisis de tráfico con Wireshark
- Exposición segura del servidor a Internet mediante túnel ngrok

Proyecto validado técnica y funcionalmente.
