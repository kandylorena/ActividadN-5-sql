CREATE TABLE estudiantes (
	id SERIAL primary key,
 	rut varchar (12) not null unique,
  	nombre varchar (50) not null, 
  	correo varchar (100)unique
);

CREATE TABLE cursos(
	id int primary key, 
  	codigo varchar (10) not null unique,
  	nombre varchar (50) not null,
  	docente_responsable varchar (50)
);


CREATE Table matriculas (
  id SERIAL primary key,
  fecha_inscripcion DATE DEFAULT CURRENT_DATE,
  anio int,
  rut_estudiante varchar (12),
  codigo_curso varchar (10),

  FOREIGN KEY (rut_estudiante) REFERENCES estudiantes(rut) ON DELETE CASCADE,
  FOREIGN KEY (codigo_curso) References cursos(codigo)ON DELETE CASCADE
  
);
