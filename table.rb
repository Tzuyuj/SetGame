require 'gtk2'
require_relative 'game'


# initialize window
window = Gtk::Window.new('The Game of Set')
window.set_default_size(700, 700)
window.border_width = 10
window.signal_connect('destroy') do
  puts 'destroy event occurred'
  Gtk.main_quit
end
game = Game.new




#catImage = Gtk::Image.new("cat.jpeg")
#event_box = Gtk::EventBox.new.add(catImage)
#event_box.signal_connect("button_press_event") do
# puts "Clicked"
#end

# initialize boxes and tables
table = Gtk::Table.new(4, 6, true)
window.add(table)

#add 12 cards
(1..4).each do |i|
  button = Gtk::Button.new("card #{i}")
  
   #insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 1, i, 0,1)
end
(5..8).each do |i|
  button = Gtk::Button.new("card #{i}")
  
   #insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 5, i - 4, 1,2)
end

(9..12).each do |i|
  button = Gtk::Button.new("card #{i}")
  
   #insert 12 cards in the upper left corner
  table.attach_defaults(button, i - 9, i - 8, 2,3)
end

#add Timer button
button=Gtk::Button.new("Timer")

table.attach_defaults(button,4,6,0,1)

 #add Player points button
button=Gtk::Button.new("Player1 points: \n \n Player2 points: ")
table.attach_defaults(button,4,6,1,3)

#add Quit button
button=Gtk::Button.new("Quit")
button.signal_connect("clicked") do
  puts "Hello again - button #{i} was pressed"
end


table.attach_defaults(button,0,6,3,4)


#window_box = Gtk::VBox.new(false, 0)
#window_box.pack_start(table, true, true, 0)
#window_box.pack_start(button, false, false, 0)

#textview.buffer.insert_pixbuf(iter, catImage)

#window.add(event_box)
#window.add(window_box)
# box1 = Gtk::VBox.new(false, 0)
# window.add(box1)
# box1.pack_start(button, true, true, 3)
# box1.pack_start(quit_button, true, true, 0)

window.show_all

Gtk.main
