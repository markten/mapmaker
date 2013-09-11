
## Module - MM_Functions.py

import os,sys						# File detection and directory construction
import tkinter
from tkinter import *				# GUI Module
from tkinter import filedialog		# File Dialogue module for GUI
from tkinter import ttk			# Additional widgets for GUI module
from tkinter import messagebox		# Easy message boxes
from PIL import Image				# Image manipulation module
from PIL import ImageTk			# Extended image format handling for tkinter
import re							# Regex Module
import numpy						# Mathematics module (used for 3D arrays)
import webbrowser					# Import web browser for help docs
import shutil						# Directory removal tools

def select_layer(root, layer):

	root.current_layer = layer
	print("\tCurrent Layer: ", root.layer_names[layer])
	
	for index in range(len(root.layer_names)):
		if index == root.current_layer:
			root.layer_buttons[index].config(bg='gray')
		else:
			root.layer_buttons[index].config(bg=root.cget('bg'))
	
	for index_y in range(root.mapsize_y):
		for index_x in range(root.mapsize_x):
			tile_num = int(root.layer_array[index_x, index_y, root.current_layer])
			if tile_num < len(root.tiles):
				root.mapbuttons[find_position(index_x, index_y, root.mapsize_x)].config(image=root.tiles[tile_num])
			else:
				print("Warning: Tilesheet too small for values of current map. All images after the offending tile will not be shown.")
				return

def set_coords(root, x, y):
	if x < root.mapsize_x and x >= 0 and y < root.mapsize_y and y >= 0:
		root.mapbuttons[find_position(root.coord_x, root.coord_y, root.mapsize_x)].config(bg=root.cget('bg')) 
		root.mapbuttons[find_position(x, y, root.mapsize_x)].config(bg="#FF0000")
		root.coord_x_old = root.coord_x
		root.coord_y_old = root.coord_y
		root.coord_x = x
		root.coord_y = y
		
	else:
		pass # map boundary reached
	
def set_tile(root, tile_num):
	if root.rselect_on:
		for index_y in range(root.coord_y_old, root.coord_y+1):
			for index_x in range(root.coord_x_old, root.coord_x+1):
				root.mapbuttons[find_position(index_x, index_y, root.mapsize_x)].config(image=root.tiles[tile_num])
				root.layer_array[index_x, index_y, root.current_layer] = tile_num
	else:
		root.mapbuttons[find_position(root.coord_x, root.coord_y, root.mapsize_x)].config(image=root.tiles[tile_num])
		root.layer_array[root.coord_x, root.coord_y, root.current_layer] = tile_num

def find_position(x, y, row_size):
	position = (y*row_size)+x
	return position
	
def find_coords(position, row_size):
	coords = (int(position%row_size), int(position/row_size))
	return coords

def set_tilesheet(root):
	root.tilesheet_directory = tkinter.filedialog.askopenfilename(title='Select a tile sheet ...', initialdir = '../tilesheets')
	if root.tilesheet_directory != "":
		slice_tilesheet(root)

def slice_tilesheet(root):
	
	print("\tSlicing tilesheet ...")
	
	# Variables for tracking location in tilesheet
	left_x 		= 0
	right_x 	= root.tile_size
	top_y 		= 0
	bottom_y 	= root.tile_size
	filenum 	= 0
	root.tiles = []
	
	# Create Directory to store tiles
	if not os.path.exists("../tiles"):
		os.makedirs("../tiles")
		
	# Open TileSheet for slicing
	tilesheet = Image.open(root.tilesheet_directory)
	
	tilesheet_dimensions = tilesheet.size

	# Slice tilesheet and sequentially name the tiles
	while bottom_y <= tilesheet_dimensions[1]:
		while right_x <= tilesheet_dimensions[0]:
			box = (left_x, top_y, right_x, bottom_y)
			tilesheet.crop(box).save("../tiles/"+str(filenum)+'.png',"PNG")
			newPhotoImage = ImageTk.PhotoImage(file="../tiles/"+str(filenum)+".png")
			root.tiles.append(newPhotoImage)
			tilesheet.load()
			right_x += root.tile_size
			left_x 	+= root.tile_size
			filenum += 1
		
		bottom_y += root.tile_size
		top_y += root.tile_size
		right_x = root.tile_size
		left_x 	= 0
	root.tilesheet_size = int(tilesheet_dimensions[1]/root.tile_size*root.tilesheet_width)
	shutil.rmtree('../tiles')
	print("\tDone.")
		
def import_map(root):
	
	print("Importing Map ...")
	
	# Query user for map file in plaintext
	try:
		imported_map = tkinter.filedialog.askopenfile(mode='r', title='Select a map file ...', initialdir='../mapfiles')
		print("\tOpening File ...")
	except IOError:
		print("Error: Could not open file.")
	
	# Copy map file into storage arrays
	if imported_map != None:
			
		# Determine map width
		map_width_expression = re.findall('(?<=public static const TILESPERROW\t:uint = ).+(?=;)', imported_map.read())
		map_width = eval(map_width_expression[0])
		imported_map.seek(0)
		
		# Extract tile numbers for each layer
		print("\tExtracting Layers ...")
		
		map_width_expression = re.findall('(?<=public static const TILESPERROW\t:uint = ).+(?=;)', imported_map.read())
		map_width = eval(map_width_expression[0])
		imported_map.seek(0)

		# Extract tile numbers for each layer
		print("\tExtracting Layers ...")
		regex_string 	= '(?<=protected static var )(.+?)(?::Array = new Array\()(.*?;)'
		layer_blocks 	= re.findall(regex_string, imported_map.read(), re.DOTALL)
		
		for layer in range(len(layer_blocks)):
			print("\t\tExtracting Layer: ", layer)
			layer_strings = re.findall(r'\d+', str(layer_blocks[layer][1]))
			if layer == 0:
				map_height = int(len(layer_strings)/map_width)
				root.layer_array = numpy.zeros((map_width, map_height, len(layer_blocks)))
			for index in range(len(layer_strings)):
				i = index % map_width
				j = int(index/map_width)
				k = layer
				root.layer_array[i,j,k] = int(layer_strings[int(index)])
		if root.layer_names != None:
			del root.layer_names
			
		root.layer_names = []
		
		for layer in range(len(layer_blocks)):
			root.layer_names.append(layer_blocks[layer][0])
		
		# Provide information on imported map
		print("\tExtracted Map Height: ", map_height)
		print("\tExtracted Map Width: ", map_width)
		print("\tClosing File ...")
		imported_map.close()
		print("Done.")
		root.mapsize_x = map_width
		root.mapsize_y = map_height

def export_map(root):
	
	print("Exporting map ...")
	
	new_map_name = tkinter.filedialog.asksaveasfilename(defaultextension='.as', initialdir='../mapfiles', title='Select a save path ...')
	
	if new_map_name != None:
		try:
			exported_map = open(new_map_name, 'w')
			# Write storage array to file including formatting
			temp_string = "// constants\n\npublic static const TILESPERROW\t:uint = "+str(root.mapsize_x)+";\n\n"
			exported_map.write(temp_string)
			
			for layer in range(len(root.layer_names)):
				temp_string = "// "+root.layer_names[layer]+" layer\n\nprotected static var "+root.layer_names[layer]+":Array = new Array(\n"
				exported_map.write(temp_string)
				
				for row in range(root.mapsize_y):
					
					exported_map.write('\t')
					
					for column in range (root.mapsize_x):
						if root.layer_array[column, row, layer] < 10:
							temp_string = ' '+str(int(root.layer_array[column, row, layer]))
							exported_map.write(temp_string)
						else:
							exported_map.write(str(int(root.layer_array[column, row, layer])))
						if column == (root.mapsize_x-1) and row == root.mapsize_y-1:
							pass
						else:
							exported_map.write(",")
					
					exported_map.write('\n')
				
				exported_map.write(');\n\n')
			
			exported_map.close()
		except:
			print("Error: Unable to export map")
	print("Done.")
				
def load_icons(root):
	root.icon = {'newmap': 0, 'import': 1, 'export': 2, 'rectselect': 3, 'separatelayers': 4, 'help': 5}
	root.icons = []
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/newmap.png")
	root.icons.append(newPhotoImage)
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/import.png")
	root.icons.append(newPhotoImage)
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/export.png")
	root.icons.append(newPhotoImage)
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/rectselect.png")
	root.icons.append(newPhotoImage)
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/separatelayers.png")
	root.icons.append(newPhotoImage)
	
	newPhotoImage = ImageTk.PhotoImage(file="../icons/help.png")
	root.icons.append(newPhotoImage)

def configure_map(root, parent):
	# Tilesheet properties config
	#root.tile_size = int(parent.config_tilesize.get())
	#root.tilesheet_width = int(parent.config_tilesheet.get())
	
	# Map properties config
	root.mapsize_x = int(parent.config_mapsize_x.get())
	root.mapsize_y = int(parent.config_mapsize_y.get())
	
	del root.layer_names
	root.layer_names = []
	
	for index in range(len(root.WindowNewMap.LayerVars)):
		root.layer_names.append(root.WindowNewMap.LayerVars[index].get())

def open_help():
	if os.name == 'nt':
		os.startfile('..\docs\index.html')
	else:
		webbrowser.open('../docs/index.html')
	
def rect_select(root):
	root.rselect_on = not root.rselect_on
	if root.rselect_on == True:
		root.rsel_button.config(bg='#FF0000')
	else:
		root.rsel_button.config(bg=root.cget('bg'))
			
def separate_layers(root):
	try:
		separation_profile = tkinter.filedialog.askopenfile(mode='r', title='Select a separation profile ...', initialdir='../tilesheets')
		print("\tOpening File ...")
	except IOError:
		print("Error: Could not open file.")
	
	# Copy map file into storage arrays
	if separation_profile != None:
			
		# Determine map width
		separation_array = re.findall('\d+', separation_profile.read())
		print(separation_array)
		
		for layer in range(len(root.layer_names)):
			print("Layer: ", layer)
			for index_y in range(root.mapsize_y):
				for index_x in range(root.mapsize_x):
					if (root.layer_array[index_x, index_y, layer] != 0):
						root.layer_array[index_x, index_y, int(separation_array[int(root.layer_array[index_x, index_y, layer])])] = root.layer_array[index_x, index_y, layer]
						if layer != int(separation_array[int(root.layer_array[index_x, index_y, layer])]):
							root.layer_array[index_x, index_y, layer] = 0
	
	select_layer(root, root.current_layer)
				
def generate_preview(root):
	pass
	
