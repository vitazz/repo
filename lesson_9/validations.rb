module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *args)

      case type
        when :presence
          fail 'Empty value' if name.nil?
        when :format
          fail 'Wrong format' if name !~ args[0]
        when :type
          fail 'Wrong class' if name.class != args[0]
      end
    end
  end

  module InstanceMethods
    def validate!
      fail "Type can't be nil" if @train_type.nil?
      fail "Vagons can't be nil" if @vagons_count.nil?
      fail 'Vagons count must be a number' if @vagons_count.class != Fixnum
      fail 'Possible train types: cargo, passanger' if @train_type != 'cargo' && @train_type != 'passanger'
      # fail 'Number has invalid format' if @number !~ NUMBER_FORMAT
    end


    def valid?
      validate!
    rescue
      false
    end
  end
end
