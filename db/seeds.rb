# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rails.logger.debug "Creating default header characters.."
[ {nombre: "titulo", profundidad: -3, posicion_horizontal: 66, posicion_vertical: -6},
  {nombre: "gimb", profundidad: 5, posicion_horizontal: 7, posicion_vertical: -73},
  {nombre: "camila", profundidad: 4, posicion_horizontal: 15, posicion_vertical: -42},
  {nombre: "hector", profundidad: 3, posicion_horizontal: 25, posicion_vertical: -41},
  {nombre: "lina", profundidad: 2, posicion_horizontal: 37, posicion_vertical: -150},
  {nombre: "elder", profundidad: 6, posicion_horizontal: 33, posicion_vertical: 41},
  {nombre: "robin", profundidad: 5, posicion_horizontal: 40, posicion_vertical: -44},
  {nombre: "destructor", profundidad: 6, posicion_horizontal: 68, posicion_vertical: 103},
  {nombre: "sonia", profundidad: 3, posicion_horizontal: 81, posicion_vertical: -92},
  {nombre: "boris", profundidad: 4, posicion_horizontal: 95, posicion_vertical: -22},
  {nombre: "demi", profundidad: 4, posicion_horizontal: 75, posicion_vertical: -30},
  {nombre: "samsa", profundidad: 1, posicion_horizontal: 58, posicion_vertical: 0}].each do |character|
  HeaderCharacter.create character
end

Rails.logger.debug "Creating default preferences.."
[{name: "landing_page", value: 1},
 {name: "subscribers", value: 1}].each do |preference|
  Preference.create preference
end

unless Post.exists?(title: "Inicio")
  Rails.logger.debug "Creating Inicio page"
  Post.create published: true, user_id: 1, title: "Inicio", body: "<div class=\"row\">\r\n<div class=\"col-xs-6 bg_mensaje_tokiro\">\r\nEste juego es gratuito gracias al esfuerzo de creadores independientes y sus patrocinadores, descárgatelo gratis pero no te olvides de apoyar el proyecto dándole un like a nuestros socios, así podremos seguir haciendo esto de manera gratuita, de fans para fans.\r\nGracias.\r\n<div class=\"align_right\">Tokiro</div>\r\n<div class=\"post_division\"></div>\r\n<div class=\"align_center\"><div class=\"post_descarga\"></div></div>\r\n<div class=\"align_center\"><div class=\"post_logo_atixx\"></div></div>\r\n</div>\r\n<div class=\"col-xs-6\">\r\n<div class=\"post_bg_sponsor align_center\"><div class=\"post_logo_arcimego\"></div></div>\r\n<div class=\"post_bg_sponsor align_center\"><div class=\"post_logo_ile\"></div></div>\r\n</div>\r\n</div>"
end
