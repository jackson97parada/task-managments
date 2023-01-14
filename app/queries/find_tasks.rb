class FindTasks
  attr_reader :tasks

  def initialize(tasks = initial_scope)
    @tasks = tasks
  end

  def call
    scoped = tasks
    scoped = find_by_name(scoped, params[:title])
  end

  private

  def initial_scope
    Task
  end

  # def find_by_name(scoped, title)    
  # end
  
end

# Crear serializer para cada modelo z
#  Filtros para todos los modelos x
# Crear test de los request con los parametros el metodo index x

# Crear una relacion many to many entre employee y task x

