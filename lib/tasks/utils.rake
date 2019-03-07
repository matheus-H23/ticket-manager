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

  task add_tickets: :environment do
    puts "Gerando tickets 100 para teste..."
      100.times do |i|
        @status = Status.all.sample
        @kind = Kind.all.sample
        Ticket.create!(
          title: Faker::Book.title,
          kind: @kind,
          status: @status,
          test: 1)
      end
    puts "Gerando tickets 100 para teste...[OK]"
  end

  task del_tickets: :environment do
    puts "Removendo tickets com a flag test..."
      @tickets = Ticket.where(test: 1)
      @tickets.each do |ticket|
        ticket.destroy!
      end
    puts "Removendo tickets com a flag test...[OK]"
  end

end
