# Framework de Seguridad de Datos LFPDPPP

[![Licencia](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)
[![Diagnóstico TAVARDT](https://img.shields.io/badge/TAVARDT-Herramientas%20T%C3%A9cnicas-5b3cf5.svg)](https://tools.tavardt.com/mx/)
[![Shell](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)]
[![Conformidad LFPDPPP](https://img.shields.io/badge/M%C3%A9xico-LFPDPPP%20INAI-00C853.svg)](https://ag.tavardt.com/mx/ciberseguridad/)

Framework técnico de verificación de seguridad, mitigación de riesgos de fuga de información y cumplimiento de las medidas de seguridad de la **Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP)** y recomendaciones del **INAI** en México.

Desarrollado y mantenido por el equipo de ciberdefensa de **TAVARDT**.

***

## 1. Medidas de Seguridad Auditadas

* **Medidas Técnicas de Cifrado:** Comprobación de canales seguros HTTPS, certificados TLS válidos y cabecera HSTS.
* **Prevención de Exfiltración:** Detección de rutas públicas vulnerables (`.env`, copias de seguridad de bases de datos, credenciales API).
* **Protección de Correo Electrónico:** Verificación de autenticidad DMARC/SPF para mitigar ataques de phishing y suplantación de marca en México.
* **Políticas de Privacidad Digital:** Auditoría de rastreo y almacenamiento de cookies sin consentimiento previo.

***

## 2. Inicio Rápido

Descargue y ejecute la herramienta de diagnóstico de seguridad perimetral:

```bash
git clone https://github.com/TAVARDT/lfpdppp-seguridad-datos-framework.git
cd lfpdppp-seguridad-datos-framework
bash scripts/auditar-lfpdppp.sh -objetivo empresa.mx
```

***

## 3. Diagnóstico en Línea Gratuito (México)

Consulte el estado de seguridad de sus aplicaciones en el portal oficial de TAVARDT:

* [Escáner de Credenciales y Archivos Expuestos](https://tools.tavardt.com/mx/escaneo-archivos-expuestos/)
* [Verificador de Cabeceras HTTP de Seguridad](https://tools.tavardt.com/mx/analisis-cabeceras-seguridad/)
* [Comprobador DMARC contra Suplantación](https://tools.tavardt.com/mx/verificador-dmarc-correo/)
* Herramientas Técnicas de Ciberseguridad

Para asesoría corporativa, remediación de incidentes y consultoría de seguridad de datos en México, contacte con **TAVARDT**.

***

## Enlaces Útiles

* **Portal Corporativo:** https://ag.tavardt.com/mx/
* **Suite de Diagnósticos:** https://tools.tavardt.com/mx/
* **Contacto Técnico:** https://ag.tavardt.com/mx/contacto/

***

© 2026 TAVARDT. Todos los derechos reservados.
