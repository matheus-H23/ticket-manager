namespace :utils do
  desc "Populando Banco de Dados..."
  task seed: :environment do
    puts "Gerando os tipos (Kinds)..."
      @kinds = ["Plataforma", "Encoder", "Live", "Vídeo"]
        @kinds.each do |kind|
          Kind.create!(description: kind)
        end
    puts "Gerando os tipos (Kinds)...[OK]"

    puts "Gerando os status (Status)..."
      @status = ["Aberto", "Em Andamento", "Aguardando Cliente", "Atribuido", "Resolvido", "Fechado"]
        @status.each do |status|
          Status.create!(description: status)
        end
    puts "Gerando os status (Status)...[OK]"

    puts "Gerando Master Admin (User)..."
      User.create!(
        name: "Master Admin",
        email: "matheushmms@hotmail.com",
        password: "123456")
    puts "Gerando Master Admin (User)...[OK]"

  end

end
