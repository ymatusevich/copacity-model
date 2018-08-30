class BaseService
  def initialize
  end

  def call
    raise NotImplementedError
  end

  protected

  def fail
    ServiceResult.new(success: false)
  end
end
