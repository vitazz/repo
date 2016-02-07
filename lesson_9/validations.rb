module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    # def validate(name, *args)
    #   @validate_data ||= {}
    #   @validate_data[name] = *args
    #   puts @validate_data.inspect
    # end

    def validate(name, *args)
      validates_name = '@@validates'
      class_variable_set(validates_name, {}) unless class_variable_defined?(validates_name)
      class_variable_get(validates_name)[name] = *args
    end
  end

  module InstanceMethods

    def validate!
      self.class.class_variable_get('@@validates').each do |name, args|
        send("validate_#{args[0]}", name, *args[1, args.size])
      end
      true
    end

    # def format
    #   fail 'Wrong format' if @name !~ @type
    # end
    #
    # def presence
    #   fail 'Empty name' if @name.nil?
    # end
    #
    # def type
    #   fail 'Wrong class' if @name_tmp.is_a?(@type)
    # end

    def validate_presence(name, message='Argument is empty string')
      value = instance_variable_get("@#{name}")
      fail ArgumentError, message if value.nil? || value.empty?
    end

    def validate_format(name, format, message='Invalid format')
      value = instance_variable_get("@#{name}")
      fail ArgumentError, message unless value =~ format
    end

    def validate_type(name, type, message='Invalid type')
      value = instance_variable_get("@#{name}")
      fail ArgumentError, message unless value.instance_of? type
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end
