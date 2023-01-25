class FindEnterprises
  attr_reader :enterprises

  def initialize(enterprises = initial_scope)
    @enterprises = enterprises
  end

  def call(params = {})
    scoped = enterprises
    scoped = find_by_nit(scoped, params[:nit])
    scoped = find_by_address(scoped, params[:address])
    scoped = find_by_mobile(scoped, params[:mobile])
    scoped = find_by_enable(scoped, params[:enable])
    sort(scoped, params[:order_by])
  end

  private

  def initial_scope
    Enterprise
  end

  def find_by_nit(scoped, nit)
    return scoped unless nit

    scoped.where("nit like ?", nit)
  end

  def find_by_address(scoped, address)
    return scoped unless address

    scoped.where("address like ?", address)
  end

  def find_by_mobile(scoped, mobile)
    return scoped unless mobile

    scoped.where("mobile like ?", mobile)
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
