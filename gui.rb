# Authors: Bright Zhou, Matt Nehez, Akul Gulrajani
require 'gtk2'
require_relative 'game'

# insert comment here
class GUI
  # initialize window and other necessary attributes
  attr_accessor :table
  def initialize(game)
    window = Gtk::Window.new('The Game of Set')
    window.set_default_size(700, 700)
    window.border_width = 10
    # when the X is clicked, the window gets destroyed
    window.signal_connect('destroy') do
      Gtk.main_quit
    end

    # initialize boxes and tables
    @table = Gtk::Table.new(4, 6, true)
    window.add(@table)

    # set up starting board of 12 cards
    4.times do |i|
      3.times do |j|
        button = Gtk::Button.new
        button.image = game.user_cards[(3 * i) + j].image
        button.signal_connect('clicked') do
          # something with returning the table's coordinates
	  puts button.image.file
        end
        @table.attach_defaults(button, j, j + 1, i, i + 1)
        # start timer again after redealing cards
        # timer.continue
      end
    end

    # add Timer
    # timer = GLib::Timer.new('Timer') #line 40
    # timerbox = Glib::Boxed.new
    # timerbutton = Gtk::Button.new
    timer = Gtk::Label.new('Timer')
    table.attach_defaults(timer, 4, 6, 0, 1)

    # add Player points
    scoreboard = Gtk::Label.new("Player1 points: \n \n Player2 points: ")
    @table.attach_defaults(scoreboard, 4, 6, 1, 3)

    # add Quit button
    button = Gtk::Button.new('Quit')
    button.signal_connect('clicked') do
      puts 'Quit button pressed, goodbye!'
      # timer.stop
      Gtk.main_quit
    end
    @table.attach_defaults(button, 4, 6, 3, 4)
    # initialize windows and tables
    window.show_all
    Gtk.main
  end

  # if a set is found then stop the clock before congratulating
  # the player and resettling the board
  # def set_found
  # timer.stop
  # end

  # add cards in rows of 3 with the specified number of rows
  # RM: should it be columns of 3?
  # how to concat new cards
  def add_cards(user_cards)
    num_rows = 4
    3.times do |i|
      button = Gtk::Button.new
      button.image = user_cards[(3 * num_rows) + i].image
      button.signal_connect('clicked') do
        puts 'Button in table clicked'
      end
    end
    @table.attach_defaults(button, j, j + 1, num_rows, num_rows + 1)
  end
end
