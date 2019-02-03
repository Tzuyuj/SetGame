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
    table = Gtk::Table.new(4, 5, true)
    window.add(table)
    add_cards(table, 4)

    # add Timer button
    timer = Gtk::Label.new('Timer')
    table.attach_defaults(timer, 4, 5, 0, 1)

    # add Player points button
    scoreboard = Gtk::Label.new("Player1 points: \n \n Player2 points: ")
    table.attach_defaults(scoreboard, 4, 5, 1, 3)

    # add Quit button
    button = Gtk::Button.new('Quit')
    button.signal_connect('clicked') do
      puts 'Quit button pressed, goodbye!'
      Gtk.main_quit
    end
    # initialize windows and tables
    table.attach_defaults(button, 4, 5, 3, 4)
    window.show_all

    Gtk.main
    game = Game.new
  end

  def toggle_em(widget, other_tgg)
    # Gtk::Widget#sensitive=boolean |or #set_sensitive(boolean)
    other_tgg.sensitive = widget.active? ? false : true
  end

  # add cards in rows of 3 with the specified number of rows
  def add_cards(table, number_of_rows)
    number_of_rows.times do |i|
      3.times do |j|
        button = Gtk::ToggleButton.new("card #{i + j}")
        table.attach_defaults(button, j, j + 1, i, i + 1)
        button.signal_connect('toggled') { |w| toggle_em(w, button) }
      end
    end
  end
end
