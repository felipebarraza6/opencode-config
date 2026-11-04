# review-diff

Revisa un diff contra criterios de aceptación y buenas prácticas.

## Cuándo usar

- Después de que Verifier confirme que los tests pasan.
- Antes de aprobar un cambio.

## Pasos

1. Lee el plan original y los criterios de aceptación.
2. Inspecciona el diff completo.
3. Evalúa:
   - Cumplimiento de criterios.
   - Compatibilidad hacia atrás.
   - Contratos de API.
   - Validación de entradas.
   - Autenticación y autorización.
   - Manejo de errores.
   - Transacciones y consistencia.
   - Rendimiento.
   - Observabilidad.
   - Migraciones.
   - Secretos expuestos.
   - Calidad y mantenibilidad.
   - Tests faltantes.
4. Emite una decisión: `APPROVE`, `CHANGES_REQUESTED` o `BLOCK`.

## Salida esperada

- Resumen de lo revisado.
- Hallazgos clasificados por severidad (crítico, alto, medio, bajo).
- Decisión final.
- Acciones requeridas, si aplica.

## Restricciones

- No modifiques el código en la primera revisión.
- Sé explícito sobre los problemas y da ejemplos concretos.
