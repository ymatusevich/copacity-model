class BaseForm
  include ActiveModel::Model
  include FormToModel

  def initialize(params = {})
    @params = params
    @params.each do |k, v|
      unless respond_to?("#{k}=")
        @params.delete(k)
        next
      end

      send("#{k}=", v)
    end
  end

  def save
    return false unless valid?

    save!
  end

  def update
    return false unless valid?

    update!
  end

  def params
    @params.permit!
  end

  def persisted?
    id.present?
  end

  private

  def save!
    raise NotImplementedError
  end

  def update!
    raise NotImplementedError
  end
end
