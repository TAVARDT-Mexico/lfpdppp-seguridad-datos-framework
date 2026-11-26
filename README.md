<p align="center">
  <a href="https://ag.tavardt.com/mx/">
    <img src="https://ag.tavardt.com/img/tavardt-banner.png" alt="TAVARDT" width="1024" />
  </a>
</p>

# Framework de Seguridad de Datos LFPDPPP

[![Diagnóstico TAVARDT](https://img.shields.io/badge/TAVARDT-Herramientas%20T%C3%A9cnicas-5b3cf5.svg)](https://tools.tavardt.com/mx/)
[![Conformidad LFPDPPP](https://img.shields.io/badge/M%C3%A9xico-LFPDPPP%20INAI-00C853.svg)](https://ag.tavardt.com/mx/ciberseguridad/)
[![Licencia](https://img.shields.io/badge/licencia-MIT-blue.svg)](LICENSE)

Framework técnico de verificación de seguridad, mitigación de riesgos de fuga de información y cumplimiento de las medidas de seguridad de la **Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP)** y recomendaciones del **INAI** en México.

Desarrollado y mantenido por el área de ciberdefensa e investigación de amenazas de **TAVARDT**.

***

## 1. Arquitectura de Conformidad y Controles Auditados

La regulación mexicana en materia de protección de datos personales impone a los responsables el deber de adoptar salvaguardas técnicas adecuadas contra accesos o tratamientos no autorizados. La herramienta efectúa inspecciones automatizadas sobre dos capas críticas de la superficie pública del sistema:

* **Protección del Transporte y Cabeceras Web Defensivas**: Evalúa que el servidor web implemente políticas criptográficas robustas sobre TLS. Verifica activamente la presencia de las cabeceras `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP) y `X-Frame-Options`.
* **Detección Perimetral de Archivos de Configuración Expuestos**: Inspecciona la raíz del dominio para prevenir la divulgación accidental de activos sensibles. Audita la exposición de variables de entorno (`.env`), metadatos de control de versiones (`.git/config`) y copias de seguridad de bases de datos (`respaldo.sql`).

***

## 2. Vectores de Riesgo e Impacto Operacional

Las deficiencias de configuración en activos web públicos comprometen la confidencialidad de la información e incrementan el riesgo regulatorio ante el INAI. El motor de auditoría previene cuatro vectores críticos de vulnerabilidad perimetral:

* **Degradación Criptográfica y Robo de Sesiones**: La omisión de la cabecera HSTS posibilita ataques de intermediario y la interceptación de tráfico no cifrado. Forzar el transporte seguro garantiza la privacidad de las comunicaciones de los usuarios en tránsito.
* **Exfiltración de Secretos y Llaves de Acceso**: La presencia accesible de archivos `.env` revela credenciales de bases de datos, tokens de API y sales de cifrado. Estos elementos comprometidos facilitan la intrusión no autorizada en la infraestructura interna.
* **Reconstrucción del Repositorio por Metadatos**: El acceso público al archivo `.git/config` permite a actores externos analizar el historial de versiones y orígenes remotos del código. Este reconocimiento expone rutas internas y lógica de negocio privada.
* **Fuga Masiva de Registros por Respaldos Públicos**: La accesibilidad de archivos `respaldo.sql` permite la descarga directa de bases de datos sin autenticación. Esta situación representa una vulneración grave de seguridad sujeta a sanciones económicas bajo la LFPDPPP.

***

## 3. Guía de Inicio Rápido y Verificación Operativa

Ejecute el diagnóstico perimetral de seguridad técnica sobre dominios objetivos mediante el intérprete POSIX Bash:

```bash
git clone https://github.com/TAVARDT-Mexico/lfpdppp-seguridad-datos-framework.git
cd lfpdppp-seguridad-datos-framework
bash scripts/auditar-lfpdppp.sh -objetivo dominio.mx
```

### Diagnóstico de Respuestas y Evaluación de Estados

El script de inspección reporta el estado técnico de cada recurso evaluado según el código de respuesta HTTP recibido:

* **Recurso Protegido y Conforme (`[PROTEGIDO]`)**: Respuestas de denegación o recurso no encontrado (como HTTP 403 Forbidden o HTTP 404 Not Found) indican que el perímetro impide el acceso público.
* **Alerta Crítica de Exposición (`[RIESGO ALTO]`)**: Un código de estado HTTP 200 OK advierte que el archivo sensible es accesible públicamente y exige intervención correctiva inmediata en las reglas del servidor web.

***

## 4. Preguntas Frecuentes Técnicas (FAQ)

### ¿Cómo apoya la inspección de cabeceras HTTP al cumplimiento de las medidas de seguridad de la LFPDPPP?
La verificación automatizada evalúa la presencia de directivas de protección como Strict-Transport-Security, Content-Security-Policy y X-Frame-Options en el servidor web. Estas cabeceras garantizan el cifrado estricto en tránsito y bloquean ataques de intermediario, cumpliendo con el principio de seguridad exigido por la legislación mexicana.

### ¿Qué riesgos específicos identifica la herramienta durante el sondeo de archivos expuestos?
El script analiza la raíz pública del dominio para detectar la presencia inadvertida de credenciales en .env, metadatos en .git/config y copias en respaldo.sql. Obtener un código HTTP 200 en estos recursos confirma una vulnerabilidad crítica que expone bases de datos y llaves de acceso a actores no autorizados.

### ¿Cuáles son las implicaciones legales ante el INAI en caso de detectarse una fuga de información sensible?
La exposición desprotegida de bases de datos o secretos de configuración constituye una vulneración de seguridad bajo los Artículos 19 y 20 de la LFPDPPP. Este tipo de incidentes obliga a implementar medidas correctivas inmediatas y puede derivar en procedimientos de verificación e imposición de multas por parte del INAI.

### ¿Cómo garantiza la herramienta su reproducibilidad técnica en entornos de despliegue continuo?
El script opera bajo el estándar POSIX Bash con manejo estricto de interrupciones para asegurar ejecuciones idénticas sin requerir dependencias externas complejas. Esto facilita su incorporación en canalizaciones de integración continua para auditar la superficie pública antes de autorizar pases a producción.

### ¿Qué acciones de mitigación deben implementarse de inmediato si el escáner reporta un riesgo alto?
El equipo de infraestructura debe ajustar de inmediato la configuración del servidor web para denegar el acceso a archivos ocultos, respaldos y repositorios. Asimismo, es obligatorio revocar y generar nuevas contraseñas, certificados y llaves de API que hayan estado expuestas públicamente.

***

## Enlaces Útiles

* **Portal Corporativo:** https://ag.tavardt.com/mx/
* **Suite de Diagnósticos:** https://tools.tavardt.com/mx/
* **Contacto Técnico:** https://ag.tavardt.com/mx/contacto/

***

© 2026 TAVARDT. Todos los derechos reservados.
