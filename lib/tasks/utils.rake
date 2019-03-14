namespace :utils do
  desc "Populando Banco de Dados..."
  task seed: :environment do
    puts "Gerando os tipos (Kinds)..."
      @kinds = ["Uncategorized","Plataforma", "Encoder", "Live", "Vídeo"]
        @kinds.each do |kind|
          Kind.create!(description: kind)
        end
    puts "Gerando os tipos (Kinds)...[OK]"

    puts "Gerando os status (Status)..."
      @status = ["New", "Assigned","In Progress", "Hindered", "On Hold", "Solved", "Closed", "Canceled"]
      @status.each do |status|
        Status.create!(description: status)
      end
    puts "Gerando os status (Status)...[OK]"

    puts "Gerando Grupos (Group)..."
      @groups = ["Manager", "Client"]
      @groups.each do |group|
        Group.create!(name: group)
      end
    puts "Gerando Grupos (Group)...[OK]"

    puts "Gerando Unassigned user (User)..."
      User.create!(
        name: "Unassigned",
        email: "unassigned@magictickets.com",
        password: "123456",
        group: Group.find(1))
    puts "Gerando Unassigned user (User)...[OK]"

    puts "Gerando Master Admin (User)..."
      User.create!(
        name: "Master Admin",
        email: "matheushmms@hotmail.com",
        password: "123456",
        group: Group.find(1))
    puts "Gerando Master Admin (User)...[OK]"

  end

  task add_tickets: :environment do
    puts "Gerando tickets 100 para teste..."
      100.times do |i|
        @status = Status.all.sample
        @kind = Kind.all.sample
        @assignee = User.all.sample
        @reporter = User.all.sample
        Ticket.create!(
          title: Faker::Book.title,
          kind: @kind,
          status: @status,
          test: 1,
          reporter: @reporter,
          assignee: @assignee)
      end
    puts "Gerando tickets 100 para teste...[OK]"
  end

  task del_tickets: :environment do
    puts "Removendo tickets com a flag test..."
      @tickets = Ticket.all
      @tickets.each do |ticket|
        ticket.destroy!
      end
    puts "Removendo tickets com a flag test...[OK]"
  end



  task add_users: :environment do |t|
    puts "Gerando 10 usuários para teste (User)..."
      10.times do |i|
        @group = Group.all.sample
        @name = Faker::Name.name
        User.create!(
          name: @name,
          email: Faker::Internet.email(@name, '.'),
          password: "123456",
          group: @group,
          test: 1)
      end
    puts "Gerando 10 usuários para teste (User)...[OK]"
  end

  task del_users: :environment do |t|
    puts "Removendo 10 usuários para teste (User)..."
      @users = User.where(test: 1)
      @users.each do |user|
        user.destroy!
      end
    puts "Removendo 10 usuários para teste (User)...[OK]"
  end

end
