class BaseForm
  include ActiveModel::Model

  def initialize(params = {})
    @params = params
    @params.each do |k, v|
      @params.delete!(k) && next unless respond_to?(k)

      send("#{k}=", v)
    end
  end

  def params
    @params.permit!
  end

  def persisted?
    false
  end
end
