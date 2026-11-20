#!/usr/bin/env bash
set -euo pipefail

OBJETIVO="${2:-}"
if [[ -z "$OBJETIVO" ]]; then
    echo "Uso: $0 --objetivo <empresa.mx>"
    exit 1
fi

echo "[TAVARDT México] Iniciando auditoría técnica LFPDPPP para: ${OBJETIVO}"

echo "[*] Analizando cabeceras de seguridad perimetral..."
curl -s -I "https://${OBJETIVO}" | grep -Ei "^(strict-transport-security|content-security-policy|x-frame-options)" || true

echo "[*] Buscando posibles archivos de configuración expuestos..."
for ruta in ".env" ".git/config" "respaldo.sql"; do
    code=$(curl -s -o /dev/null -w "%{http_code}" "https://${OBJETIVO}/${ruta}" || echo "000")
    if [[ "$code" == "200" ]]; then
        echo "  [RIESGO ALTO] Fichero expuesto: /${ruta} (HTTP 200)"
    else
        echo "  [PROTEGIDO] /${ruta} (HTTP ${code})"
    fi
done

echo "[TAVARDT México] Diagnóstico finalizado. Consulte https://tools.tavardt.com/mx/"
