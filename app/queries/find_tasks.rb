class FindTasks
  attr_reader :tasks

  def initialize(tasks = initial_scope)
    @tasks = tasks
  end

  def call(params = {})
    scoped = tasks
    scoped = find_by_title(scoped, params[:title])
    scoped = find_by_start_date(scoped, params[:start_date])
    scoped = find_by_end_date(scoped, params[:end_date])
    scoped = find_by_status(scoped, params[:status])
    scoped = find_by_tag_id(scoped, params[:tag])
    sort(scoped, params[:order_by])
  end

  private

  def initial_scope
    Task
  end

  def find_by_title(scoped, title)
    return scoped unless title

    scoped.where("title like ?", title)
  end

  def find_by_start_date(scoped, start_date)
    return scoped unless start_date

    scoped.where("start_date like ?", start_date)
  end

  def find_by_end_date(scoped, end_date)
    return scoped unless end_date

    scoped.where("end_date like ?", end_date)
  end

  def find_by_status(scoped, status)
    return scoped unless status

    scoped.where(status: enabled)
  end

  def find_by_tag_id(scoped, tag)
    return scoped unless tag

    scoped.where("tag_id like ?", tag)
  end

  def sort(scoped, order_by)
    return scoped unless order_by

    scoped.order("id #{order_by}")
  end

end


