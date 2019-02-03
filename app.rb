# Author: Akul Gulrajani
require 'gtk2'
require_relative 'gui'
require_relative 'game'

game = Game.new
gui = GUI.new(game)
