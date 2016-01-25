module Validations
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, *args)
      @validate_data = {}
      @validate_data[name] = *args
      puts @validate_data.inspect
    end
  end

  module InstanceMethods
    def validate!
      self.class.instance_variable_get("@validate_data").each do |name, args|
        @name = instance_variable_get("@#{name}")
        @type = args.last
        send args[0]
      end
    end

    def format
      fail 'Wrong format' if @name !~ @type
    end

    def presence
      fail 'Empty name' if @name.nil?
    end

    def type
      fail 'Wrong class' if @name_tmp.is_a?(@type)
    end

    def valid?
      validate!
    rescue
      false
    end
  end
end
