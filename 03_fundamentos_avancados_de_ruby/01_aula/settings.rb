class Settings
  def add(attribute, value, **kwargs)
    # Define variavel de instancia com valor vindo da chamada da função
    self.instance_variable_set(:"@#{attribute}", value)

    # Define Getter
    self.define_singleton_method(attribute) do
      self.instance_variable_get(:"@#{attribute}")
    end

    # Define Setter
    self.define_singleton_method(:"#{attribute}=") do |input|
      self.instance_variable_set(:"@#{attribute}", input)
    end

    # Persiste valor recebido como parametro do add(value)
    self.send(:"#{attribute}=", value)

    # Define alias
    if kwargs&.keys.include?(:alias)
      # Define getter do alias
      self.define_singleton_method(kwargs[:alias]) do
        self.instance_variable_get(:"@#{attribute}")
      end

      # Define setter do alias
      self.define_singleton_method(:"#{kwargs[:alias]}=") do |input|
        self.instance_variable_set(:"@#{attribute}", input)
      end
      self.send(:"#{kwargs[:alias]}=", value)
    end

    # Define Read only
    if kwargs&.keys.include?(:readonly)
      # Redefine setter do metodo
      self.define_singleton_method(:"#{attribute}=") do |*args|
        puts "Erro: configuração '#{attribute}' é somente leitura"
      end

      # Caso tenha alias, também será Read only
      if kwargs&.keys.include?(:alias)
        # Redefine setter do alias
        self.define_singleton_method(:"#{kwargs[:alias]}=") do |*args|
          puts "Erro: configuração '#{kwargs[:alias]}' é somente leitura"
        end
      end
    end
  end

  def all
    # Seleciona os metodos que não contenham '=' / os getters apenas
    getters = self.methods(false).select{ !_1.to_s.include?('=')}

    # Monta hash ->  metodo: valor
    details = getters.each_with_object({}) do |getter, object|
      object[getter] = self.send(getter)
    end

    puts details
  end

  def method_missing(name, *_args, **_kwargs)
    "Configuração '#{name}' não existe."
  end
end
