require_relative 'baseDecorator'
require_relative 'person'

class TrimmerDecorator < Base_Decorator
    def correct_name
        if @nameable.length > 10
            @nameable[0..10]
        else
            @word
        end
    end
end