class Settings
  def add(attribute, value)
    return self.send(attribute) if self.respond_to?(attribute)

    # Opt a
    self.define_singleton_method(attribute) { value }
  
    # Opt b
    # self.class.instance_eval do
    #     attr_accessor attribute
    # end
    # self.send(:"#{attribute}=", value)
  end

  def method_missing(name, *_args, **_kwargs)
    "Configuração '#{name}' não existe."
  end
end
