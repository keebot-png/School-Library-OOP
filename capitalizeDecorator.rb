require_relative 'baseDecorator'
require_relative 'person'

class CapitalizeDecorator < Base_Decorator
    def correct_name
        @nameable.capitalize
    end
end