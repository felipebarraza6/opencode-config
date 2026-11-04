# analyze-repository

Analiza un repositorio antes de proponer cualquier cambio.

## Cuándo usar

- Al inicio de una tarea nueva.
- Cuando no se conoce bien el codebase.
- Antes de planificar una feature o refactor.

## Pasos

1. Lee `AGENTS.md` o `README.md` del proyecto para entender stack y convenciones.
2. Inspecciona la estructura de directorios principales.
3. Identifica el lenguaje, framework, gestor de paquetes y comandos de validación.
4. Localiza archivos relevantes para la tarea usando `glob`, `grep` y lectura selectiva.
5. Resume:
   - Stack tecnológico.
   - Estructura relevante.
   - Archivos afectados probables.
   - Dependencias o contratos involucrados.
   - Riesgos iniciales.

## Salida esperada

Un resumen estructurado que sirva de input para `plan-feature`.

## Restricciones

- No modifiques archivos.
- No ejecutes comandos destructivos.
- No asumas APIs o dependencias que no hayas confirmado.
