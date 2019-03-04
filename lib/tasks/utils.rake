namespace :utils do
  desc "Populando Banco de Dados..."
  task seed: :environment do
    puts "Gerando os tipos (Kinds)..."
      kinds = ["Plataforma", "Encoder", "Live", "Vídeo"]
        kinds.each do |kind|
          Kind.create!(description: kind)
        end
    puts "Gerando os tipos (Kinds)...[OK]"
  end

end
