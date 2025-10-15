class ServiceResult
  attr_reader :success, :record, :message

  def initialize(success:, record: nil, message: nil)
    @success = success
    @record = record
    @message = message
  end

  def success?
    success
  end
end
