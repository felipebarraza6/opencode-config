# plan-feature

Genera un plan de implementación verificable.

## Cuándo usar

- Después de analizar el repositorio.
- Antes de que un Builder comience a editar código.
- Cuando la tarea es compleja o tiene riesgo.

## Pasos

1. Reconfirma el objetivo, alcance y criterios de aceptación.
2. Enumera los archivos afectados concretos.
3. Describe cambios por archivo.
4. Define estrategia de tests (unitarios, integración, e2e, manuales).
5. Identifica riesgos y decisiones pendientes.
6. Si aplica, describe plan de rollback.
7. Propón un orden de ejecución paso a paso.

## Salida esperada

Un plan markdown con:
- Resumen.
- Archivos afectados.
- Pasos numerados.
- Estrategia de tests.
- Riesgos y decisiones pendientes.
- Rollback.

## Restricciones

- No escribas código ni modifiques archivos.
- Si falta información crítica, pide aclaración antes de continuar.
