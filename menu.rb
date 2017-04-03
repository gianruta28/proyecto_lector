require_relative "./engine/news.rb"
require_relative "./engine/print.rb"

# Creating Class Menu, this is what the screen will show
class Menu
def self.get_keypressed
  system("stty raw -echo")
  t = STDIN.getc
  system("stty -raw echo")
  return t
end


def self.show_first
system 'clear'
puts 'Bienvenido al Lector de noticias DevToHack'
puts 'Seleccione alguna de las siguientes opciones'
puts
puts
puts 'Opcion 1: Leer noticias de Reddit'
puts 'Opcion 2: Leer noticias de Mashable'
puts 'Opcion 3: Leer noticias de Digg'
puts 'Opcion 4: Leer noticias de todos los noticieros anteriores'
puts 'Cualquier otra tecla cerrara el programa'

Menu.get_keypressed


end

def self.the_news 

  option = Menu.show_first
  case option
  when '1'
    PrintNews.print_reddit
  when '2'
    PrintNews.print_mashable
  when '3'
    PrintNews.print_digg
  when '4'
    PrintNews.print_reddit
    PrintNews.print_mashable
    PrintNews.print_digg
  else
  end
end

def self.go
  keep_loop = 'y'
  while keep_loop == 'y'
    Menu.the_news
    puts 'Desea correr el programa denuevo y/n'
    puts
    puts 'Copyright © 2017 Gianfranco Ruta All Rights Reserved'
    keep_loop = Menu.get_keypressed
    system 'clear'
  end
end
end

