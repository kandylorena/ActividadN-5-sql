# Diccionario de Datos

## Tabla: estudiantes

| Campo   | Tipo de Dato   | Restricciones              | Descripción                              |
|---------|----------------|---------------------------|------------------------------------------|
| id      | SERIAL         | PRIMARY KEY               | Identificador único del estudiante       |
| rut     | VARCHAR(12)    | NOT NULL, UNIQUE          | Rol Único Tributario del estudiante      |
| nombre  | VARCHAR(50)    | NOT NULL                  | Nombre completo del estudiante           |
| correo  | VARCHAR(100)   | UNIQUE                    | Correo electrónico del estudiante        |

---

## Tabla: cursos

| Campo                | Tipo de Dato   | Restricciones     | Descripción                              |
|---------------------|----------------|------------------|------------------------------------------|
| id                  | INT            | PRIMARY KEY      | Identificador único del curso            |
| codigo              | VARCHAR(10)    | NOT NULL, UNIQUE | Código único del curso                   |
| nombre              | VARCHAR(50)    | NOT NULL         | Nombre del curso                         |
| docente_responsable | VARCHAR(50)    |                  | Nombre del docente responsable           |

---

## Tabla: matriculas

| Campo              | Tipo de Dato   | Restricciones                                      | Descripción                                      |
|-------------------|----------------|---------------------------------------------------|--------------------------------------------------|
| id                | SERIAL         | PRIMARY KEY                                       | Identificador único de la matrícula              |
| fecha_inscripcion | DATE           | DEFAULT CURRENT_DATE                              | Fecha en que se realiza la inscripción           |
| anio              | INT            |                                                   | Año académico de la matrícula                    |
| rut_estudiante    | VARCHAR(12)    | FOREIGN KEY → estudiantes(rut), ON DELETE CASCADE | RUT del estudiante matriculado                   |
| codigo_curso      | VARCHAR(10)    | FOREIGN KEY → cursos(codigo), ON DELETE CASCADE   | Código del curso en el que se matricula          |

---

## Relaciones

- Un estudiante puede tener múltiples matrículas.
- Un curso puede tener múltiples matrículas.
- La tabla `matriculas` actúa como tabla intermedia entre `estudiantes` y `cursos`.
- Eliminaciones en `estudiantes` o `cursos` eliminan automáticamente las matrículas asociadas (ON DELETE CASCADE).



• ¿Cuál fue la mayor dificultad al transformar el modelo conceptual al relacional?
La mayor dificultad fue relacionar de manera adecuada, saber cual era la tabla intermedia

• ¿Qué ventajas tiene normalizar una base de datos? ¿Y cuándo conviene desnormalizarla?
ventajas de no redundar en conceptos o codigo, ayuda a entender y desmenuzar mas cada datos y su tabla.