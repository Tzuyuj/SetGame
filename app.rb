# Author: Akul Gulrajani
require 'gtk2'
require_relative 'main'

button = Gtk::Button.new('Hello World')
button.signal_connect('clicked') { puts 'Hello World' }
quit_button = Gtk::Button.new('Quit')
quit_button.signal_connect('clicked') do
  Gtk.main_quit
  true
end

window = Gtk::Window.new('The Game of Set')
window.set_default_size(700, 700)
window.signal_connect('delete_event') do
  puts 'delete event occurred'
  # true
  false
end

window.signal_connect('destroy') do
  puts 'destroy event occurred'
  Gtk.main_quit
end

window.border_width = 10
box1 = Gtk::VBox.new(false, 0)
window.add(box1)
box1.pack_start(button, true, true, 3)
box1.pack_start(quit_button, true, true, 0)
window.show_all

Gtk.main
