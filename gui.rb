# Authors: Bright Zhou, Matt Nehez, Akul Gulrajani
require 'gtk2'
require_relative 'game'

# insert comment here
class GUI
  # initialize window and other necessary attributes
  attr_accessor :table, :user_input, :prompt, :player_one_points,
                :player_two_points
  def initialize(game)
    window = Gtk::Window.new('The Game of Set')
    window.set_default_size(700, 700)
    window.border_width = 10
    # when the X is clicked, the window gets destroyed
    window.signal_connect('destroy') do
      Gtk.main_quit
    end

    # initialize boxes and tables
    @user_input = []
    @table = Gtk::Table.new(4, 6, true)
    window.add(@table)
    add_cards(game.user_cards)
 
    # add Prompt
    # timer = GLib::Timer.new('Timer') #line 40
    # timerbox = Glib::Boxed.new
    # timerbutton = Gtk::Button.new
    @prompt = Gtk::Label.new('Welcome to Set!')
    table.attach_defaults(@prompt, 4, 6, 0, 1)

    # add Player points
    @player_one_point_label = Gtk::Label.new("Player 1 points: #{game.player_one_points}")
    @player_two_point_label = Gtk::Label.new("Player 2 points: #{game.player_two_points}")
    @table.attach_defaults(@player_one_point_label, 4, 6, 1, 2)
    @table.attach_defaults(@player_two_point_label, 4, 6, 2, 3)

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

  # adds cards to the table
  def add_cards(user_cards)
    num_rows = user_cards.length / 3
    @table.resize(num_rows, 6)
    num_rows.times do |i|
      3.times do |j|
        button = Gtk::Button.new
        button.image = user_cards[(3 * i) + j].image
        button.state = Gtk::STATE_PRELIGHT #may need STATE_NORMAL but atm any button could be clicked
        button.signal_connect('clicked') do
          # something with returning the table's coordinates
          @user_input.push(image_2_card(button.image))
          button.set_state(Gtk::STATE_ACTIVE)
          button.modify_bg(Gtk::STATE_ACTIVE, Gdk::Color.parse("#000000")) # ("#A9A9A9"))
          button.set_state(Gtk::STATE_INSENSITIVE)
          button.modify_bg(Gtk::STATE_INSENSITIVE, Gdk::Color.parse("#000000")) # ("#A9A9A9"))
        end
        @table.attach_defaults(button, j, j + 1, i, i + 1)
      end
    end
  end

  # returns a card for the given Gtk image
  def image_2_card(image)
    color_char = image.file[4, 1]
    color = case color_char
            when 'R' then 'RED'
            when 'B' then 'BLUE'
            when 'G' then 'GREEN'
            end
    number = image.file[5, 1].to_i
    fill_char = image.file[7, 1]
    fill = case fill_char
           when 'E' then 'EMPTY'
           when 'S' then 'STRIPED'
           when 'F' then 'SOLID'
           end
    shape_char = image.file[6, 1]
    shape = case shape_char
            when 'D' then 'DIAMOND'
            when 'O' then 'OVAL'
            when 'S' then 'SQUIGGLE'
            end
    Card.new(color, number, fill, shape)
  end

  # adds a point to the scoreboard for the given player
  def update_scoreboard(player)
    if player == 1
      @player_one_points_label = Gtk::Label.new("Player 1 points: #{game.player_one_points}")
    else
      @player_two_points_label = Gtk::Label.new("Player 2 points: #{game.player_two_points}")
    end
  end
end
