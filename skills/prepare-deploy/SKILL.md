# prepare-deploy

Prepara un despliegue sin ejecutarlo automáticamente.

## Cuándo usar

- Cuando un cambio está aprobado y listo para release.
- Para preparar migraciones, release notes o comandos de deploy.

## Pasos

1. Verifica que todas las validaciones pasaron.
2. Revisa el diff final.
3. Identifica migraciones o cambios de infraestructura necesarios.
4. Escribe el plan de deploy paso a paso.
5. Escribe el plan de rollback.
6. Lista exactamente qué comandos se ejecutarán.
7. Solicita confirmación humana antes de ejecutar cualquier comando en producción.

## Salida esperada

- Resumen del release.
- Migraciones necesarias.
- Comandos de deploy propuestos.
- Plan de rollback.
- Checklist de aprobación.

## Restricciones

- No ejecutes deploy a producción sin confirmación humana explícita.
- No modifiques secretos directamente.
- No asumas permisos de CI/CD que no hayas confirmado.
