require_relative 'settings'

settings = Settings.new

# Definindo configurações dinamicamente
settings.add(:timeout, 30)
settings.add(:mode, "production")

# Acessando configurações via método
puts settings.timeout # => 30
puts settings.mode # => "production"

# Tentando acessar configuração inexistente
puts settings.retry # => "Configuração 'retry' não existe."

# Checando se um método está disponível
puts settings.respond_to?(:timeout) # => true
puts settings.respond_to?(:retry) # => false


## BONUS
settings = Settings.new

# Alias
settings.add(:timeout, 30, alias: :espera)
puts settings.timeout # => 30
puts settings.espera # => 30

# Apenas Leitura
settings.add(:api_key, "SECRET", readonly: true)#, alias: :chave)
settings.api_key = "HACKED" # => Erro: configuração 'api_key' é somente leitura

# Listagem de configurações
settings.all # => { timeout: 30, mode: "production",api_key: "SECRET" }

# Permite alterar valor
settings.timeout = 60
puts settings.timeout # => 60

#* obs nesse ultimo acabei usando vairaveis de instancia, pelo que entendi
# ao ler novamente, era pra ter integrado com method missing XD erro meu XD
