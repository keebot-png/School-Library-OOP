require_relative 'nameable'

class Base_Decorator < Namable
    def initialize(nameable)
        @nameable = nameable
    end

    def correct_name
        @nameable
    end
end