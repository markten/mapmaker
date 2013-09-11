# Import necessary modules

from MM_Interface import *

# GUI Class
class MapmakerGui(tkinter.Tk):
	
	def __init__(root, parent):
		tkinter.Tk.__init__(root)
		root.parent = parent
		root.initialize()
		
	def initialize(root):
		
		# Constants
		root.UP			= 0
		root.DOWN		= 1
		root.LEFT		= 2
		root.RIGHT		= 3

		# Tilesheet Properties
		root.tile_size = 16
		root.tilesheet_size = 0
		root.tilesheet_width = 4
		root.tilesheet_directory = None
		root.tilebuttons = None
		
		# Map Properties
		root.mapsize_x 	= 0
		root.mapsize_y 	= 0
		root.layer_names = ["None"]
		
		# Editor status
		root.coord_x 		= 0
		root.coord_x_old 	= 0
		root.coord_y	 	= 0
		root.coord_y_old 	= 0
		root.current_layer 	= 0
		
		# Rectanglar selection vars
		root.rsel_button = None
		root.rselect_on = False
		
		# Build the configuration interface
		load_icons(root)
		build_menubar(root)
		build_toolbar(root)
		
		root.update()
		
if __name__=="__main__":
	app = MapmakerGui(None)
	app.title('Map Maker')
	app.mainloop()
