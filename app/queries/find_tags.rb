class FindTags
  attr_reader :tags

  def initialize(tags = initial_scope)
    @tags = tags
  end

  def call(params = {})
    scoped = tags
    scoped = find_by_name(scoped, params[:name])
    scoped = find_by_color(scoped, params[:color])
    scoped = find_by_enable(scoped, params[:enable])
    sort(scoped, params[:order_by])
  end

  def initial_scope
    Tag
  end

  def find_by_name(scoped, name)
    return scoped unless name

    scoped.where("name like ?", name)
  end

  def find_by_color(scoped, color)
    return scoped unless color

    scoped.where("color like ?", color)
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