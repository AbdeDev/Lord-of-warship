class Grid
    attr_accessor :size, :matrix
  
    def initialize(size = 5)
      @size = size
      @matrix = Array.new(size) { Array.new(size, "°") }
    end
  
    def display
      @matrix.each { |row| puts row.join(" ") }
    end
  
    def place_ship(ship, x, y, orientation)
      if ship.valid_position?(self, x, y, orientation)
        ship.place_on_grid(self, x, y, orientation)
        true
      else
        false
      end
    end
  
    def shoot(x, y)
      if x < 0 || y < 0 || x >= @size || y >= @size
        puts "Hors limites ! Essayez encore."
        return nil
      end
  
      case @matrix[x][y]
      when "B"
        @matrix[x][y] = "X"
        puts "Touché !"
        return true
      when "°"
        @matrix[x][y] = "O"
        puts "Manqué !"
        return false
      when "X", "O"
        puts "Déjà ciblé ! Essayez encore."
        return nil
      end
    end
  
    def all_ships_sunk?
      @matrix.flatten.none? { |cell| cell == "B" }
    end
  end
  
  class Ship
    attr_accessor :size
  
    def initialize(size)
      @size = size
    end
  
    def valid_position?(grid, x, y, orientation)
      if orientation == "h"
        return false if y + @size > grid.size
        (0...@size).each { |i| return false if grid.matrix[x][y + i] != "°" }
      elsif orientation == "v"
        return false if x + @size > grid.size
        (0...@size).each { |i| return false if grid.matrix[x + i][y] != "°" }
      else
        return false
      end
      true
    end
  
    def place_on_grid(grid, x, y, orientation)
      if orientation == "h"
        (0...@size).each { |i| grid.matrix[x][y + i] = "B" }
      elsif orientation == "v"
        (0...@size).each { |i| grid.matrix[x + i][y] = "B" }
      end
    end
  end
  
  class BattleshipGame
    def initialize
      @player1_name = ""
      @player2_name = ""
      reset_grids
    end
  
    def reset_grids
      @player1_grid = Grid.new
      @player2_grid = Grid.new
    end
  
    def setup_players
      print "Entrez le pseudo du joueur 1: "
      @player1_name = gets.chomp
      print "Entrez le pseudo du joueur 2: "
      @player2_name = gets.chomp
    end
  
    def setup_ships
      [3, 4].each do |size|
        puts "#{@player1_name}, placez votre bateau de taille #{size}."
        place_ship_for_player(@player1_grid, size)
        puts "#{@player2_name}, placez votre bateau de taille #{size}."
        place_ship_for_player(@player2_grid, size)
      end
    end
  
    def place_ship_for_player(grid, size)
      ship = Ship.new(size)
      loop do
        puts "Entrez les coordonnées de départ pour le bateau de taille #{size} (format : x y) :"
        x, y = gets.chomp.split.map(&:to_i)
        puts "Entrez l'orientation (h pour horizontal, v pour vertical) :"
        orientation = gets.chomp
  
        if grid.place_ship(ship, x, y, orientation)
          grid.display
          break
        else
          puts "Placement invalide. Veuillez réessayer."
        end
      end
    end
  
    def play_game
      turn = rand(1..2)
      loop do
        current_player_name = turn == 1 ? @player1_name : @player2_name
        current_player_grid = turn == 1 ? @player2_grid : @player1_grid
        puts "Tour de #{current_player_name}"
        puts "Grille de #{@player1_name} :"
        @player1_grid.display
        puts "Grille de #{@player2_name} :"
        @player2_grid.display
  
        puts "Entrez les coordonnées pour tirer (x y) :"
        x, y = gets.chomp.split.map(&:to_i)
  
        valid_shot = current_player_grid.shoot(x, y)
  
        if valid_shot == nil
          next
        elsif valid_shot == false
          turn = turn == 1 ? 2 : 1
        end
  
        if @player2_grid.all_ships_sunk?
          puts "#{@player1_name} a gagne !"
          break
        elsif @player1_grid.all_ships_sunk?
          puts "#{@player2_name} a gagne !"
          break
        end
      end
    end
  
    def start_game
      setup_players
      setup_ships
      play_game
      puts "Voulez-vous rejouer ? (y/n)"
      answer = gets.chomp.downcase
      if answer == "y"
        reset_grids
        start_game
      else
        puts "Merci d'avoir joué !"
      end
    end
  end
  
  BattleshipGame.new.start_game  