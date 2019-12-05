require "../controlador/factory.rb"

$arregloCursos = Array.new
$arregloAlumnos = Array.new
$arregloMatriculas = Array.new

def MenuPrincipal()
	begin
		system("cls")
		puts"*********SISTEMA DE MATRICULA********"
		puts"1. Registrar nuevo Curso"
		puts"2. Registrar nuevo Alumno"
		puts"3. Listar Cursos"
		puts"4. Listar Alumnos"
		puts"5. Registrar Matricula"
		puts"6. Reporte - Alumnos Matriculados por curso"
		puts"7. Salir"
		puts"Seleccione una opcion: "
		opcion = gets.chomp.to_i
	end until(opcion>=1 and opcion<=7)
	case opcion
		when 1
			registrarCurso()
		when 2
			registrarAlumno()
		when 3
			listarCursos()
		when 4
			listarAlumnos()
		when 5
			registrarMatricula()
		when 6
			reporteMatriculados()
	end
end

def registrarCurso()
	system("cls")
	puts"*********REGISTRAR NUEVO CURSO********"
	puts"Ingrese codigo: "
	codigo = gets.chomp
	puts"Ingrese nombre: "
	nombre = gets.chomp
	obj = Factory.crearCurso(codigo,nombre)
	$arregloCursos.push(obj)
	puts
	puts "Curso Registrado!"
	system("pause")
	MenuPrincipal()
end

def registrarAlumno()
	system("cls")
	puts"*********REGISTRAR NUEVO ALUMNO********"
	puts "Ingrese DNI: "
	dni = gets.chomp
	puts "Ingrese Nombre: "
	nombre = gets.chomp
	puts "Ingrese Edad: "
	edad = gets.chomp.to_i
	obj = Factory.crearAlumno(dni,nombre,edad)
	$arregloAlumnos.push(obj)
	puts
	puts "Alumno Registrado!"
	system("pause")
	MenuPrincipal()
end

def listarCursos()
	system("cls")
	puts"*********CURSOS REGISTRADOS********"
	print"CODIGO".ljust(10)
	print"NOMBRE".ljust(20)
	puts
	$arregloCursos.each do |item|
		print "#{item.codigo}".ljust(10)
		print "#{item.nombre}".ljust(20)
		puts
	end
	puts
	system("pause")
	MenuPrincipal()
end

def listarAlumnos()
	system("cls")
	puts"*********ALUMNOS REGISTRADOS********"
	print"DNI".ljust(10)
	print"NOMBRE".ljust(20)
	print"EDAD".ljust(10)
	puts
	$arregloAlumnos.each do |item|
		print "#{item.dni}".ljust(10)
		print "#{item.nombre}".ljust(20)
		print "#{item.edad}".ljust(10)
		puts
	end
	puts
	system("pause")
	MenuPrincipal()
end

def registrarMatricula()
	system("cls")
	puts"*********REGISTRAR MATRICULA********"

	puts"Ingrese DNI del alumno: "
	dni = gets.chomp
	alumno = $arregloAlumnos.find_all{|a| a.dni == dni}
	if(alumno == [])
		puts "El alumno no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{alumno[0].dni} - #{alumno[0].nombre}"
	puts

	puts "Ingrese codigo del curso: "
	codigo = gets.chomp
	curso = $arregloCursos.find_all{|c| c.codigo == codigo}
	if(curso == [])
		puts "El curso no se encuentra"
		system("pause")
		MenuPrincipal()
	end
	puts "#{curso[0].nombre}"
	puts

	item = [alumno[0],curso[0]]
	$arregloMatriculas.push(item)

	puts "Matricula Registrada!"
	system("pause")
	MenuPrincipal()
end

def reporteMatriculados()
	system("cls")
	puts"*********REPORTE MATRICULADOS********"

	puts "Ingrese codigo del curso"
	codigo = gets.chomp

	print "Codigo".ljust(10)
	print "Nombre Curso".ljust(20)
	print "DNI".ljust(10)
	print "Nombre Alumno".ljust(20)
	puts
	$arregloMatriculas.each do |item|
		if(item[1].codigo == codigo)
			print "#{item[1].codigo}".ljust(10)
			print "#{item[1].nombre}".ljust(20)
			print "#{item[0].dni}".ljust(10)
			print "#{item[0].nombre}".ljust(20)
			puts
		end
	end
	puts
	system("pause")
	MenuPrincipal()
end

MenuPrincipal()