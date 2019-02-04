# Authors: Bright Zhou, Matt Nehez, Akul Gulrajani
require 'gtk2'
require_relative 'game'

# insert comment here
class GUI
  # initialize window and other necessary attributes
  attr_accessor :table
  def initialize(game)
    window = Gtk::Window.new('The Game of Set')
    window.set_default_size(700, 700) #line 10
    window.border_width = 10
    # when the X is clicked, the window gets destroyed
    window.signal_connect('destroy') do
      Gtk.main_quit
    end

    # initialize boxes and tables
    @table = Gtk::Table.new(4, 6, true)
    window.add(@table)
    # add_cards(4, game.user_cards) #line 20
    # set up 12 cards for starting board
    4.times do |i|
      3.times do |j|
        button = Gtk::EventBox.new.add(game.user_cards[(3 * i) + j].image)
        button.signal_connect('button_press_event') do
          # something with user_cards[(3 * i) + j]
          # or something with returning the table's coordinates, idk
          button.modify_bg(Gtk::STATE_ACTIVE, Gdk::Color.parse("#A9A9A9")) # make button grey
        end
        @table.attach(button, j, j + 1, i, i + 1) #line 30
        # button = Gtk::ToggleButton.new("card #{(3 * i) + j + 1}")
        # button.set_image (user_cards[(3 * i) + j].image)
        # button.signal_connect('toggled') { |w| toggle_em(w, button) }
        # start timer again after redealing cards
        # timer.continue
      end
    end

    # add Timer
    # timer = GLib::Timer.new('Timer') #line 40
    #timerbox = Glib::Boxed.new
    # timerbutton = Gtk::Button.new
    # table.attach_defaults(timerbutton, 4, 6, 0, 1)

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
    # initialize windows and tables
    @table.attach_defaults(button, 4, 6, 3, 4)
    window.show_all
    Gtk.main
  end

  # if a set is found then stop the clock before congratulating
  # the player and resettling the board
  #def set_found
  #  timer.stop
  #end

  # add cards in rows of 3 with the specified number of rows
  # RM: should it be columns of 3?
  # how to concat new cards
  def add_cards(user_cards)
      num_rows = 4;
      3.times do |j|
        button = Gtk::EventBox.new.add(user_cards[(3 * num_rows) + j].image)
        button.signal_connect('button_press_event') do
          # something with user_cards[(3 * i) + j]
          # or something with returning the table's coordinates, idk
          button.pressed
          button.modify_bg(Gtk::STATE_ACTIVE, Gdk::Color.parse("#A9A9A9"))
          card_fected button.label
          # button.get_internal_child(Gtk::Builder, child_name)
        end
        @table.attach(button, j, j + 1, num_rows, num_rows + 1)
        # button = Gtk::ToggleButton.new("card #{(3 * i) + j + 1}")
        # button.set_image (user_cards[(3 * i) + j].image)
        # button.signal_connect('toggled') { |w| toggle_em(w, button) }
        # start timer again after redealing cards
        # timer.continue
      end
  end
end
