class Alumno
	attr_accessor :dni,:nombre,:edad
	def initialize(dni,nombre,edad)
		@dni = dni
		@nombre = nombre
		@edad = edad
	end
end