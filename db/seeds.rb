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
User_Demo = User.create!(email: "demo@mail.com", username: "demo_guy", password: "123456", photo_url: "Avatar.png")
admin = User.create!(email: "anna@mail.com", password: "123456", username: "Anna", admin: true, photo_url: "Anna.jpg")
User_Emilie = User.create!(email: "emilie@mail.com", password: "123456", username: "Emilie", photo_url: "Emilie.jpg")
User_Lea = User.create!(email: "lea@mail.com", password: "123456", username: "Lea", photo_url: "Lea.jpg")
User_Nicolas = User.create!(email: "nicolas@mail.com", password: "123456", username: "Nicolas", photo_url: "Nicolas.png")

puts "Creating organisations ..."

coeurs_solidaires = Organisation.create!(user: admin, name: "Cœurs Solidaires",
description: "Cœurs Solidaires est une association caritative dédiée à venir en aide aux personnes en situation de précarité et d'isolement. Elle organise des collectes de vêtements, de nourriture et de produits de première nécessité, qu'elle distribue aux familles et individus dans le besoin. L'association met également en place des actions de solidarité telles que des repas partagés, des événements de soutien et des accompagnements personnalisés. Son objectif est de créer des liens solidaires au sein de la communauté et d'offrir un soutien moral et matériel aux plus vulnérables. Grâce à l'engagement de ses bénévoles, Cœurs Solidaires œuvre chaque jour pour un monde plus inclusif et bienveillant.")
coeurs_solidaires.photo.attach(
io: File.open(Rails.root.join("db/organisations/1coeurs.jpg")),
filename: "1coeurs.jpg",
content_type: "image/jpg"
)
coeurs_solidaires.save

main_dans_la_main = Organisation.create!(user: admin, name: "Main dans la Main",
description: "Main dans la main est une association caritative qui œuvre pour l'inclusion sociale et l'autonomie des personnes en difficulté. Elle propose des actions de soutien concret telles que la distribution de nourriture, de vêtements, ainsi que des accompagnements dans la recherche d’emploi ou de logement. L'association met également en place des événements communautaires pour renforcer les liens entre les habitants et favoriser l'entraide. Grâce à une équipe de bénévoles engagés, Main dans la main offre un soutien moral et matériel pour redonner espoir et dignité aux plus démunis. Son but est de créer un réseau solidaire où chacun trouve sa place et peut compter sur l'autre.")
main_dans_la_main.photo.attach(
io: File.open(Rails.root.join("db/organisations/1main.jpg")),
filename: "1main.jpg",
content_type: "image/jpg"
)
main_dans_la_main.save

solidarite_partagee = Organisation.create!(user: admin, name: "Solidarité Partagée",
description: "Solidarité Partagée est une association caritative dédiée à l'entraide et à la redistribution des ressources aux personnes en situation de précarité. Elle organise des collectes de biens essentiels tels que des vêtements, des denrées alimentaires et des produits d'hygiène, puis les redistribue aux personnes dans le besoin. L'association mène également des actions de soutien social et éducatif pour aider les bénéficiaires à surmonter leurs difficultés. Grâce à un réseau de bénévoles impliqués, Solidarité Partagée favorise l'inclusion et l'autonomisation des plus vulnérables. Son objectif est de bâtir une société plus solidaire où l'entraide devient une valeur partagée par tous.")
solidarite_partagee.photo.attach(
io: File.open(Rails.root.join("db/organisations/1solidarite.jpg")),
filename: "1solidarite.jpg",
content_type: "image/jpg"
)
solidarite_partagee.save




# modèle : Organisation.create!(name: "", description: "", photo_url: "")
# 3 organisations : "Cœurs Solidaires", "Main dans la Main", "Solidarité Partagée"
puts "Finished!"
puts "Created #{Organisation.count} organisations"

puts "Creating missions ..."

noel = Mission.create!(title: "Noël pour tous", description: "Noël pour tous consiste à collecter des dons (jouets, vêtements, nourriture) pendant la période des fêtes afin de les distribuer aux familles en difficulté. Les bénévoles participent à l'organisation des collectes, à la gestion des dons et à la distribution pour offrir un Noël solidaire à ceux qui en ont besoin. Un engagement chaleureux et concret pour faire briller l'esprit de Noël chez les plus démunis.",
category: "Collecte et distribution", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Toulouse", organisation: coeurs_solidaires)
noel.photo.attach(
io: File.open(Rails.root.join("db/missions/1noel.jpg")),
filename: "1noel.jpg",
content_type: "image/jpg"
)
noel.save

rentree = Mission.create!(title: "Collecte rentrée scolaire", description: "La Collecte rentrée scolaire consiste à recueillir des fournitures scolaires, des vêtements et des équipements pour les enfants issus de familles en difficulté. Les bénévoles aident à organiser les collectes, trier les dons et préparer les kits scolaires à distribuer avant la rentrée. Un engagement essentiel pour offrir à chaque enfant les outils nécessaires pour réussir sa scolarité.",
category: "Collecte et distribution", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Albi", organisation: main_dans_la_main)
rentree.photo.attach(
io: File.open(Rails.root.join("db/missions/1rentree.jpg")),
filename: "1rentree.jpg",
content_type: "image/jpg"
)
rentree.save

alimentaire = Mission.create!(title: "Collecte alimentaire solidaire", description: "La Collecte alimentaire solidaire vise à recueillir des denrées alimentaires non périssables pour les distribuer aux personnes en situation de précarité. Les bénévoles participent à l'organisation des points de collecte, à la réception des dons et à la distribution dans les centres d'aide. Un acte de solidarité pour lutter contre la faim et la pauvreté dans la communauté.",
category: "Collecte et distribution", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Carcassonne", organisation: solidarite_partagee)
alimentaire.photo.attach(
io: File.open(Rails.root.join("db/missions/1alimentaire.jpg")),
filename: "1alimentaire.jpg",
content_type: "image/jpg"
)
alimentaire.save

ville = Mission.create!(title: "Ma ville propre", description: "Ma ville propre consiste à organiser des opérations de nettoyage dans les espaces publics pour préserver l'environnement urbain. Les bénévoles participent à la collecte de déchets, au tri sélectif et à la sensibilisation des habitants à la propreté. Un engagement collectif pour rendre la ville plus agréable et respectueuse de l'environnement.",
category: "Environnement et écologie", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Carcassonne", organisation: coeurs_solidaires)
ville.photo.attach(
io: File.open(Rails.root.join("db/missions/1ville.jpg")),
filename: "1ville.jpg",
content_type: "image/jpg"
)
ville.save

berges = Mission.create!(title: "Les berges de Garonne", description: "Les berges de Garonne consiste à organiser des actions de nettoyage et de préservation des berges du fleuve, en ramassant les déchets et en protégeant la faune et la flore locales. Les bénévoles participent à l'entretien des espaces naturels, tout en sensibilisant le public à l'importance de la protection de l'environnement. Un engagement pour préserver la beauté et la biodiversité des berges de Garonne.",
category: "Environnement et écologie", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Toulouse", organisation: main_dans_la_main)
berges.photo.attach(
io: File.open(Rails.root.join("db/missions/1berges.jpg")),
filename: "1berges.jpg",
content_type: "image/jpg"
)
berges.save

quartier = Mission.create!(title: "Quartier des Pommiers", description: "Quartier des Pommiers consiste à organiser des actions de nettoyage, de plantation d'arbres et de sensibilisation à la protection de l'environnement dans le quartier. Les bénévoles participent à l'embellissement des espaces publics, à la gestion des déchets et à la promotion du développement durable. Un engagement pour préserver la nature et améliorer la qualité de vie des habitants du quartier.",
category: "Environnement et écologie", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Albi", organisation: solidarite_partagee)
quartier.photo.attach(
io: File.open(Rails.root.join("db/missions/1quartier.jpg")),
filename: "1quartier.jpg",
content_type: "image/jpg"
)
quartier.save

maths = Mission.create!(title: "Mathématiques au primaire", description: "Mathématiques au primaire consiste à accompagner les élèves du primaire dans l'apprentissage des mathématiques en leur offrant un soutien personnalisé. Les bénévoles aident les enfants à renforcer leurs compétences, à surmonter leurs difficultés et à développer leur confiance en eux. Un engagement enrichissant pour favoriser la réussite scolaire et l'épanouissement des jeunes élèves.",
category: "Soutien scolaire", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Albi", organisation: coeurs_solidaires)
maths.photo.attach(
io: File.open(Rails.root.join("db/missions/1maths.jpg")),
filename: "1maths.jpg",
content_type: "image/jpg"
)
maths.save

chinois = Mission.create!(title: "Chinois LVB", description: "Chinois LVB consiste à accompagner les élèves dans l'apprentissage du chinois en tant que langue vivante étrangère (LVB). Les bénévoles aident les étudiants à améliorer leur compréhension, leur expression orale et écrite, tout en les motivant à découvrir la culture chinoise. Un engagement passionnant pour enrichir le parcours linguistique des jeunes apprenants.",
category: "Soutien scolaire", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Carcassonne", organisation: main_dans_la_main)
chinois.photo.attach(
io: File.open(Rails.root.join("db/missions/1chinois.jpg")),
filename: "1chinois.jpg",
content_type: "image/jpg"
)
chinois.save

français = Mission.create!(title: "Français de la 6ème à la 3ème", description: "Français de la 6ème à la 3ème consiste à accompagner les collégiens dans l'amélioration de leurs compétences en français, en particulier dans la lecture, l'écriture et la grammaire. Les bénévoles offrent un soutien individualisé pour aider les élèves à surmonter leurs difficultés et à renforcer leur confiance en leurs capacités. Un engagement précieux pour favoriser leur réussite scolaire et leur épanouissement intellectuel.",
category: "Soutien scolaire", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Toulouse", organisation: solidarite_partagee)
français.photo.attach(
io: File.open(Rails.root.join("db/missions/1français.jpg")),
filename: "1français.jpg",
content_type: "image/jpg"
)
français.save

palettes = Mission.create!(title: "Les petites palettes", description: "Les petites palettes consiste à organiser des ateliers artistiques et créatifs pour les enfants, afin de stimuler leur imagination et leur sensibilité artistique. Les bénévoles encadrent des activités telles que la peinture, la sculpture ou la création de projets collectifs, tout en encourageant l'expression individuelle. Un engagement enrichissant pour favoriser l'épanouissement culturel des jeunes participants.",
category: "Animation culturelle", start_date: Date.new(2025, 11, 02), end_date: Date.new(2025, 11, 04), address: "Toulouse", organisation: coeurs_solidaires)
palettes.photo.attach(
io: File.open(Rails.root.join("db/missions/1palettes.jpg")),
filename: "1palettes.jpg",
content_type: "image/jpg"
)
palettes.save

modelage = Mission.create!(title: "Modelage pour débutants", description: "Modelage pour débutants consiste à animer des ateliers d'initiation à l'art du modelage, où les participants apprennent à façonner l'argile et à découvrir les techniques de base. Les bénévoles accompagnent les débutants dans leurs créations, en les guidant et en les encourageant à exprimer leur créativité. Un engagement enrichissant pour partager la passion de l'art et développer les talents des participants.",
category: "Animation culturelle", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Albi", organisation: main_dans_la_main)
modelage.photo.attach(
io: File.open(Rails.root.join("db/missions/1modelage.jpg")),
filename: "1modelage.jpg",
content_type: "image/jpg"
)
modelage.save

couture = Mission.create!(title: "Couture : trousse d'écolier", description: "Couture : trousse d'écolier consiste à animer des ateliers de couture où les participants apprennent à confectionner des trousses scolaires personnalisées. Les bénévoles accompagnent les apprenants dans la maîtrise des techniques de couture, tout en favorisant la créativité et la réalisation de projets pratiques. Un engagement enrichissant pour transmettre un savoir-faire tout en créant des objets utiles et uniques.",
category: "Animation culturelle", start_date: Date.new(2025, 04, 12), end_date: Date.new(2025, 04, 13), address: "Carcassonne", organisation: solidarite_partagee)
couture.photo.attach(
io: File.open(Rails.root.join("db/missions/1couture.jpg")),
filename: "1couture.jpg",
content_type: "image/jpg"
)
couture.save

# ajout de 10 missions:
atelier_reparation_velo = Mission.create!(title: "Atelier réparation vélo",
  description: "Les bénévoles aident à réparer des vélos pour les personnes dans le besoin et sensibilisent à l'entretien et à la mobilité douce.",
  category: "Environnement et écologie", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Paris", organisation: solidarite_partagee)
atelier_reparation_velo.photo.attach(
  io: File.open(Rails.root.join("db/missions/atelier_reparation_velo.jpg")),
  filename: "atelier_reparation_velo.jpg",
  content_type: "image/jpg"
)
atelier_reparation_velo.save

festival_zero_dechet = Mission.create!(title: "Festival zéro déchet",
  description: "Cette mission consiste à organiser un événement sur le thème du zéro déchet, avec des stands, animations et ateliers.",
  category: "Environnement et écologie", start_date: Date.new(2025, 11, 2), end_date: Date.new(2025, 11, 4), address: "Marseille", organisation: main_dans_la_main)
festival_zero_dechet.photo.attach(
  io: File.open(Rails.root.join("db/missions/festival_zero_dechet.jpg")),
  filename: "festival_zero_dechet.jpg",
  content_type: "image/jpg"
)
festival_zero_dechet.save

sensibilisation_biodiversite = Mission.create!(title: "Sensibilisation à la biodiversité",
  description: "Les participants animent des ateliers et des jeux pour faire découvrir la biodiversité locale aux enfants et familles.",
  category: "Environnement et écologie", start_date: Date.new(2025, 4, 12), end_date: Date.new(2025, 4, 13), address: "Lille", organisation: coeurs_solidaires)
sensibilisation_biodiversite.photo.attach(
  io: File.open(Rails.root.join("db/missions/sensibilisation_biodiversite.jpg")),
  filename: "sensibilisation_biodiversite.jpg",
  content_type: "image/jpg"
)
sensibilisation_biodiversite.save

aide_aux_devoirs_college = Mission.create!(title: "Aide aux devoirs – collège",
  description: "Les bénévoles accompagnent les collégiens dans leurs devoirs et les aident à acquérir des méthodes de travail efficaces.",
  category: "Soutien scolaire", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Paris", organisation: solidarite_partagee)
aide_aux_devoirs_college.photo.attach(
  io: File.open(Rails.root.join("db/missions/aide_aux_devoirs_college.jpg")),
  filename: "aide_aux_devoirs_college.jpg",
  content_type: "image/jpg"
)
aide_aux_devoirs_college.save

initiation_informatique = Mission.create!(title: "Initiation à l'informatique",
  description: "Cette mission consiste à initier des personnes âgées à l'utilisation de l'ordinateur, d'internet et des outils numériques.",
  category: "Soutien scolaire", start_date: Date.new(2025, 11, 2), end_date: Date.new(2025, 11, 4), address: "Marseille", organisation: main_dans_la_main)
initiation_informatique.photo.attach(
  io: File.open(Rails.root.join("db/missions/initiation_informatique.jpg")),
  filename: "initiation_informatique.jpg",
  content_type: "image/jpg"
)
initiation_informatique.save

lecture_pour_tous = Mission.create!(title: "Lecture pour tous",
  description: "Les bénévoles lisent des histoires à des enfants dans les bibliothèques, écoles ou centres sociaux pour encourager la lecture.",
  category: "Soutien scolaire", start_date: Date.new(2025, 4, 12), end_date: Date.new(2025, 4, 13), address: "Lille", organisation: coeurs_solidaires)
lecture_pour_tous.photo.attach(
  io: File.open(Rails.root.join("db/missions/lecture_pour_tous.jpg")),
  filename: "lecture_pour_tous.jpg",
  content_type: "image/jpg"
)
lecture_pour_tous.save

collecte_jouets = Mission.create!(title: "Collecte solidaire de jouets",
  description: "Organisation d'une collecte de jouets neufs ou en bon état à redistribuer à Noël à des enfants issus de familles défavorisées.",
  category: "Collecte et distribution", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Paris", organisation: solidarite_partagee)
collecte_jouets.photo.attach(
  io: File.open(Rails.root.join("db/missions/collecte_jouets.jpg")),
  filename: "collecte_jouets.jpg",
  content_type: "image/jpg"
)
collecte_jouets.save

jardin_partage = Mission.create!(title: "Jardin partagé",
  description: "Aménagement et entretien d’un jardin partagé au cœur d’un quartier : plantations, désherbage, récoltes, animations avec les enfants.",
  category: "Environnement et écologie", start_date: Date.new(2025, 11, 2), end_date: Date.new(2025, 11, 4), address: "Marseille", organisation: main_dans_la_main)
jardin_partage.photo.attach(
  io: File.open(Rails.root.join("db/missions/jardin_partage.jpg")),
  filename: "jardin_partage.jpg",
  content_type: "image/jpg"
)
jardin_partage.save

distribution_repas = Mission.create!(title: "Distribution de repas chauds",
  description: "Préparation et distribution de repas chauds aux personnes sans domicile, en collaboration avec une association locale.",
  category: "Collecte et distribution", start_date: Date.new(2025, 4, 12), end_date: Date.new(2025, 4, 13), address: "Lille", organisation: coeurs_solidaires)
distribution_repas.photo.attach(
  io: File.open(Rails.root.join("db/missions/distribution_repas.jpg")),
  filename: "distribution_repas.jpg",
  content_type: "image/jpg"
)
distribution_repas.save

atelier_theatre = Mission.create!(title: "Atelier théâtre",
  description: "Animation d’un atelier théâtre réunissant enfants et personnes âgées autour d’exercices d’expression, de mémoire et de mise en scène.",
  category: "Animation culturelle", start_date: Date.new(2025, 07, 15), end_date: Date.new(2025, 07, 15), address: "Paris", organisation: solidarite_partagee)
atelier_theatre.photo.attach(
  io: File.open(Rails.root.join("db/missions/atelier_theatre.jpg")),
  filename: "atelier_theatre",
  content_type: "image/jpg"
)
atelier_theatre.save

# modèle : Mission.create!(title: "", description: "", category: "", start_date: "", end_date: "", address: "", organisation_id:, photo_url: "")
# 4 catégories : "Collecte et distribution", "Environnement et écologie", "Soutien scolaire", "Animation culturelle"
# 3 missions par catégorie
# 3 dates : start_date:"2025 11 02", end_date: "2025 11 04", start_date: "2025 07 15", end_date: "2025 07 15", start_date: "2025 04 12", end_date: "2025 04 13"
# 3 villes : "Toulouse", "Albi", "Carcassonne"
# 3 organisations : "Cœurs Solidaires", "Main dans la Main", "Solidarité Partagée"

puts "Finished!"
puts "Created #{Mission.count} missions"
