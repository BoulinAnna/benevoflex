# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "cleaning DB participations"
Participation.destroy_all

puts "cleaning DB missions"
Mission.destroy_all

puts "cleaning DB orgnisations"
Organisation.destroy_all

puts "cleaning DB users"
User.destroy_all

puts "create a user"
# User_Demo = User.create!(username: "demouser", email: "demo@mail.com", password: "123456")

puts "Creating organisations ..."

coeurs_solidaires = Organisation.create!(name: "Cœurs Solidaires",
description: "Cœurs Solidaires est une association caritative dédiée à venir en aide aux personnes en situation de précarité et d'isolement. Elle organise des collectes de vêtements, de nourriture et de produits de première nécessité, qu'elle distribue aux familles et individus dans le besoin. L'association met également en place des actions de solidarité telles que des repas partagés, des événements de soutien et des accompagnements personnalisés. Son objectif est de créer des liens solidaires au sein de la communauté et d'offrir un soutien moral et matériel aux plus vulnérables. Grâce à l'engagement de ses bénévoles, Cœurs Solidaires œuvre chaque jour pour un monde plus inclusif et bienveillant.",
photo_url: "")
coeurs_solidaires.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/organisations/coeurs.jpg")),
  filename: "coeurs.jpg",
  content_type: "image/jpg"
)
coeurs_solidaires.save

main_dans_la_main = Organisation.create!(name: "Main dans la Main",
description: "Main dans la main est une association caritative qui œuvre pour l'inclusion sociale et l'autonomie des personnes en difficulté. Elle propose des actions de soutien concret telles que la distribution de nourriture, de vêtements, ainsi que des accompagnements dans la recherche d’emploi ou de logement. L'association met également en place des événements communautaires pour renforcer les liens entre les habitants et favoriser l'entraide. Grâce à une équipe de bénévoles engagés, Main dans la main offre un soutien moral et matériel pour redonner espoir et dignité aux plus démunis. Son but est de créer un réseau solidaire où chacun trouve sa place et peut compter sur l'autre.",
photo_url: "")

solidarite_partagee = Organisation.create!(name: "Solidarité Partagée",
description: "Solidarité Partagée est une association caritative dédiée à l'entraide et à la redistribution des ressources aux personnes en situation de précarité. Elle organise des collectes de biens essentiels tels que des vêtements, des denrées alimentaires et des produits d'hygiène, puis les redistribue aux personnes dans le besoin. L'association mène également des actions de soutien social et éducatif pour aider les bénéficiaires à surmonter leurs difficultés. Grâce à un réseau de bénévoles impliqués, Solidarité Partagée favorise l'inclusion et l'autonomisation des plus vulnérables. Son objectif est de bâtir une société plus solidaire où l'entraide devient une valeur partagée par tous.",
photo_url: "")

# modèle : Organisation.create!(name: "", description: "", photo_url: "")
# 3 organisations : "Cœurs Solidaires", "Main dans la Main", "Solidarité Partagée"
puts "Finished!"
puts "Created #{Organisation.count} organisations"

puts "Creating missions ..."

Mission.create!(title: "Noël pour tous", description: "Noël pour tous consiste à collecter des dons (jouets, vêtements, nourriture) pendant la période des fêtes afin de les distribuer aux familles en difficulté. Les bénévoles participent à l'organisation des collectes, à la gestion des dons et à la distribution pour offrir un Noël solidaire à ceux qui en ont besoin. Un engagement chaleureux et concret pour faire briller l'esprit de Noël chez les plus démunis.",
category: "Collecte et distribution", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Toulouse", organisation: coeurs_solidaires, photo_url: "" )

Mission.create!(title: "Collecte rentrée scolaire", description: "La Collecte rentrée scolaire consiste à recueillir des fournitures scolaires, des vêtements et des équipements pour les enfants issus de familles en difficulté. Les bénévoles aident à organiser les collectes, trier les dons et préparer les kits scolaires à distribuer avant la rentrée. Un engagement essentiel pour offrir à chaque enfant les outils nécessaires pour réussir sa scolarité.",
category: "Collecte et distribution", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Albi", organisation: main_dans_la_main, photo_url: "" )

Mission.create!(title: "Collecte alimentaire solidaire", description: "La Collecte alimentaire solidaire vise à recueillir des denrées alimentaires non périssables pour les distribuer aux personnes en situation de précarité. Les bénévoles participent à l'organisation des points de collecte, à la réception des dons et à la distribution dans les centres d'aide. Un acte de solidarité pour lutter contre la faim et la pauvreté dans la communauté.",
category: "Collecte et distribution", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Carcassonne", organisation: solidarite_partagee, photo_url: "" )

Mission.create!(title: "Ma ville propre", description: "Ma ville propre consiste à organiser des opérations de nettoyage dans les espaces publics pour préserver l'environnement urbain. Les bénévoles participent à la collecte de déchets, au tri sélectif et à la sensibilisation des habitants à la propreté. Un engagement collectif pour rendre la ville plus agréable et respectueuse de l'environnement.",
category: "Environnement et écologie", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Carcassonne", organisation: coeurs_solidaires, photo_url: "")

Mission.create!(title: "Les berges de Garonne", description: "Les berges de Garonne consiste à organiser des actions de nettoyage et de préservation des berges du fleuve, en ramassant les déchets et en protégeant la faune et la flore locales. Les bénévoles participent à l'entretien des espaces naturels, tout en sensibilisant le public à l'importance de la protection de l'environnement. Un engagement pour préserver la beauté et la biodiversité des berges de Garonne.",
category: "Environnement et écologie", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Toulouse", organisation: main_dans_la_main, photo_url: "")

Mission.create!(title: "Quartier des Pommiers", description: "Quartier des Pommiers consiste à organiser des actions de nettoyage, de plantation d'arbres et de sensibilisation à la protection de l'environnement dans le quartier. Les bénévoles participent à l'embellissement des espaces publics, à la gestion des déchets et à la promotion du développement durable. Un engagement pour préserver la nature et améliorer la qualité de vie des habitants du quartier.",
category: "Environnement et écologie", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Albi", organisation: solidarite_partagee, photo_url: "")

Mission.create!(title: "Mathématiques au primaire", description: "Mathématiques au primaire consiste à accompagner les élèves du primaire dans l'apprentissage des mathématiques en leur offrant un soutien personnalisé. Les bénévoles aident les enfants à renforcer leurs compétences, à surmonter leurs difficultés et à développer leur confiance en eux. Un engagement enrichissant pour favoriser la réussite scolaire et l'épanouissement des jeunes élèves.",
category: "Soutien scolaire", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Albi", organisation: coeurs_solidaires, photo_url: "")

Mission.create!(title: "Chinois LVB", description: "Chinois LVB consiste à accompagner les élèves dans l'apprentissage du chinois en tant que langue vivante étrangère (LVB). Les bénévoles aident les étudiants à améliorer leur compréhension, leur expression orale et écrite, tout en les motivant à découvrir la culture chinoise. Un engagement passionnant pour enrichir le parcours linguistique des jeunes apprenants.",
category: "Soutien scolaire", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Carcassonne", organisation: main_dans_la_main, photo_url: "")

Mission.create!(title: "Français de la 6ème à la 3ème", description: "Français de la 6ème à la 3ème consiste à accompagner les collégiens dans l'amélioration de leurs compétences en français, en particulier dans la lecture, l'écriture et la grammaire. Les bénévoles offrent un soutien individualisé pour aider les élèves à surmonter leurs difficultés et à renforcer leur confiance en leurs capacités. Un engagement précieux pour favoriser leur réussite scolaire et leur épanouissement intellectuel.",
category: "Soutien scolaire", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Toulouse", organisation: solidarite_partagee, photo_url: "")

Mission.create!(title: "Les petites palettes", description: "Les petites palettes consiste à organiser des ateliers artistiques et créatifs pour les enfants, afin de stimuler leur imagination et leur sensibilité artistique. Les bénévoles encadrent des activités telles que la peinture, la sculpture ou la création de projets collectifs, tout en encourageant l'expression individuelle. Un engagement enrichissant pour favoriser l'épanouissement culturel des jeunes participants.",
category: "Animation culturelle", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Toulouse", organisation: coeurs_solidaires, photo_url: "")

Mission.create!(title: "Modelage pour débutants", description: "Modelage pour débutants consiste à animer des ateliers d'initiation à l'art du modelage, où les participants apprennent à façonner l'argile et à découvrir les techniques de base. Les bénévoles accompagnent les débutants dans leurs créations, en les guidant et en les encourageant à exprimer leur créativité. Un engagement enrichissant pour partager la passion de l'art et développer les talents des participants.",
category: "Animation culturelle", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Albi", organisation: main_dans_la_main, photo_url: "")

Mission.create!(title: "Couture : trousse d'écolier", description: "Couture : trousse d'écolier consiste à animer des ateliers de couture où les participants apprennent à confectionner des trousses scolaires personnalisées. Les bénévoles accompagnent les apprenants dans la maîtrise des techniques de couture, tout en favorisant la créativité et la réalisation de projets pratiques. Un engagement enrichissant pour transmettre un savoir-faire tout en créant des objets utiles et uniques.",
category: "Animation culturelle", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Carcassonne", organisation: solidarite_partagee, photo_url: "")

# modèle : Mission.create!(title: "", description: "", category: "", start_date: "", end_date: "", address: "", organisation_id:, photo_url: "")
# 4 catégories : "Collecte et distribution", "Environnement et écologie", "Soutien scolaire", "Animation culturelle"
# 3 missions par catégorie
# 3 dates : start_date:"2025 11 02", end_date: "2025 11 04", start_date: "2025 07 15", end_date: "2025 07 15", start_date: "2025 04 12", end_date: "2025 04 13"
# 3 villes : "Toulouse", "Albi", "Carcassonne"
# 3 organisations : "Cœurs Solidaires", "Main dans la Main", "Solidarité Partagée"

puts "Finished!"
puts "Created #{Mission.count} missions"
