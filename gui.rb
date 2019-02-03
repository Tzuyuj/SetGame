# Authors: Bright Zhou, Matt Nehez, Akul Gulrajani
require 'gtk2'
require_relative 'game'

# insert comment here
class GUI
  # initialize window and other necessary attributes
  def initialize
    window = Gtk::Window.new('The Game of Set')
    window.set_default_size(700, 700)
    window.border_width = 10
    # when the X is clicked, the window gets destroyed
    window.signal_connect('destroy') do
      Gtk.main_quit
    end

    # initialize boxes and tables
    table = Gtk::Table.new(4, 6, true)
    window.add(table)

    add_cards(12)

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
    game = Game.new
  end

  def toggle_em(widget, other_tgg)
    # Gtk::Widget#sensitive=boolean |or #set_sensitive(boolean)
    other_tgg.sensitive = widget.active? ? false : true
  end

  # add 12 cards
  def add_cards(number_of_cards)
    (1..number_of_cards).each do |i|
      button = Gtk::ToggleButton.new("card #{i}")
      table.attach_defaults(button, i - 1, i, 0, 1)
      button.signal_connect('toggled') { |w| toggle_em(w, button) }
    end
  end
end
