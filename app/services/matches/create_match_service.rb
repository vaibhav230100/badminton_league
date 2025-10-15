class Matches::CreateMatchService
  attr_reader :match, :params

  def initialize(params)
    @params = params
    @match = Match.new(params)
  end

  def call
    if match.save
      ServiceResult.new(success: true, record: match, message: "Match result recorded.")
    else
      ServiceResult.new(success: false, record: match, message: "Failed to record match.")
    end
  end
end
