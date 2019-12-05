require "../modelo/alumno.rb"
require "../modelo/curso.rb"
class Factory
	def self.crearCurso(codigo,nombre)
		obj = Curso.new(codigo,nombre)
		return obj
	end
	def self.crearAlumno(dni,nombre,edad)
		obj = Alumno.new(dni,nombre,edad)
		return obj
	end
end