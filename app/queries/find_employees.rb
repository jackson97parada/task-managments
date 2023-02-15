class FindEmployees
  attr_reader :employees

  def initialize(employees = initial_scope)
    @employees = employees
  end

  def call(params = {})
    scoped = employees
    scoped = find_by_name(scoped, params[:name])
    scoped = find_by_last_name(scoped, params[:last_name])
    scoped = find_by_document(scoped, params[:document])
    scoped = find_by_mobile(scoped, params[:mobile])
    scoped = find_by_salary(scoped, params[:salary])
    scoped = find_by_enable(scoped, params[:enable])
    sort(scoped, params[:order_by])
  end

  private

  def initial_scope
    Employee
  end

  def find_by_name(scoped, name)
    return scoped unless name

    scoped.where("name like ?", name)
  end

  def find_by_last_name(scoped, last_name)
    return scoped unless last_name

    scoped.where("last_name like ?", last_name)
  end

  def find_by_document(scoped, document)
    return scoped unless document

    scoped.where("document like ?", document)
  end

  def find_by_mobile(scoped, mobile)
    return scoped unless mobile

    scoped.where("mobile like ?", mobile)
  end

  def find_by_salary(scoped, salary)
    return scoped unless salary

    scoped.where("salary like ?", salary)
  end

  def find_by_enable(scoped, enable)
    return scoped unless enable

    scoped.where(enable: enable)
  end

  def sort(scoped, order_by)
    return scoped unless order_by

    scoped.order("id #{order_by}")
  end
end
