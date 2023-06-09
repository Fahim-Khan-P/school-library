require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    super[0...10]
  end
end
