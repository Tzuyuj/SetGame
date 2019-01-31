# Author: Akul Gulrajani
require 'gtk2'
require_relative 'game'
require_relative 'helper'

# initialize window
window = Gtk::Window.new('The Game of Set')
window.set_default_size(700, 700)
window.border_width = 10
window.signal_connect('destroy') do
  puts 'destroy event occurred'
  Gtk.main_quit
end
game = Game.new

# initialize boxes and tables
card_table = Gtk::Table.new(4, 3, true)
# add click logic of card table here here
# cards to box here
quit_button = Gtk::Button.new('Quit')
quit_button.signal_connect('clicked') do
  Gtk.main_quit
  true
end
window_box = Gtk::VBox.new(false, 0)
window_box.pack_start(card_table, true, true, 0)
window_box.pack_start(quit_button, false, false, 0)

window.add(card_table)
# box1 = Gtk::VBox.new(false, 0)
# window.add(box1)
# box1.pack_start(button, true, true, 3)
# box1.pack_start(quit_button, true, true, 0)
window.show_all

Gtk.main
