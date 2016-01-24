module Accessors

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |a|
        instance_variable_set(var_name, a)
        @hist ||= []
        @hist << a
      end
      define_method("#{name}_history") { @hist }
    end
  end


  def strong_attr_acessor(name, name_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |a|
      instance_variable_set(var_name, a)
      if a.class != name_class
        raise 'Wrong class'
      end
    end
  end


end
