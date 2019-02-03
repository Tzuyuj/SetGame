require 'gtk2'
require_relative 'game'

def toggle_em(widget, other_tgg)
  # Gtk::Widget#sensitive=boolean |or #set_sensitive(boolean)
  other_tgg.sensitive = widget.active? ? false : true
end

# initialize window
window = Gtk::Window.new('The Game of Set')
window.set_default_size(700, 700)
window.border_width = 10
window.signal_connect('destroy') do
  puts 'destroy event occurred'
  Gtk.main_quit
end
# game = Game.new

# initialize boxes and tables
table = Gtk::Table.new(4, 6, true)
window.add(table)

# add 12 cards
(1..4).each do |i|
  button = Gtk::ToggleButton.new("card #{i}")
  # insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 1, i, 0, 1)
  button.signal_connect('toggled') { |w| toggle_em(w, button) }
end
(5..8).each do |i|
  button = Gtk::ToggleButton.new("card #{i}")
  # insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 5, i - 4, 1, 2)
  button.signal_connect('toggled') { |w| toggle_em(w, button) }
end

(9..12).each do |i|
  button = Gtk::ToggleButton.new("card #{i}")
  # insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 9, i - 8, 2, 3)
  button.signal_connect('toggled') { |w| toggle_em(w, button) }
end

# add Timer button
timer = Gtk::Label.new('Timer')
table.attach_defaults(timer, 4, 6, 0, 1)

# add Player points button
scoreboard = Gtk::Label.new("Player1 points: \n \n Player2 points: ")
table.attach_defaults(scoreboard, 4, 6, 1, 3)

# add Quit button
button = Gtk::Button.new('Quit')
button.signal_connect('clicked') do
  puts 'Quit button pressed, goodbye!'
  Gtk.main_quit
end

# initialize windows and tables
table.attach_defaults(button, 0, 6, 3, 4)
window.show_all

Gtk.main
