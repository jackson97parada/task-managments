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



#  Filtros para todos los modelos x


