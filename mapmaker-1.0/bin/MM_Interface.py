
## Module - MM_Interface.py

# Constants
MAPX = 10
MAPY = 10
VERSION = "1.0"
DEFAULT_LAYERS = ["FLOORS", "WALLS", "AFLOOR", "FOLIAGE"]

from MM_Functions import *

def build_map_configuration_dialog(root):
		
	print("Building configuration interface ...")
	
	root.WindowNewMap = tkinter.Toplevel()
	
	# Map properties
	root.WindowNewMap.config_mapsize_x	= tkinter.IntVar()
	root.WindowNewMap.config_mapsize_y	= tkinter.IntVar()
	root.WindowNewMap.config_mapsize_x.set(10)
	root.WindowNewMap.config_mapsize_y.set(10)
	
	root.WindowNewMap.LabelEntryMapsizeX = tkinter.Label(root.WindowNewMap, text="X Dimension")
	root.WindowNewMap.LabelEntryMapsizeX.grid(column=0, row=0)
	root.WindowNewMap.LabelEntryMapsizeY = tkinter.Label(root.WindowNewMap, text="Y Dimension")
	root.WindowNewMap.LabelEntryMapsizeY.grid(column=0, row=1)
	
	root.WindowNewMap.EntryMapsizeX = tkinter.Entry(root.WindowNewMap, textvariable=root.WindowNewMap.config_mapsize_x, justify='center')
	root.WindowNewMap.EntryMapsizeX.grid(column=1, row=0)
	root.WindowNewMap.EntryMapsizeY = tkinter.Entry(root.WindowNewMap, textvariable=root.WindowNewMap.config_mapsize_y, justify='center')
	root.WindowNewMap.EntryMapsizeY.grid(column=1, row=1)
	
	# Set layer names
	root.WindowNewMap.LabelEntryLayers = tkinter.Label(root.WindowNewMap, text="Layer Names (Bottom to Top)")
	root.WindowNewMap.LabelEntryLayers.grid(column=0, row=2, columnspan=2)
	
	root.WindowNewMap.LayerFrame = tkinter.Frame(root.WindowNewMap)
	root.WindowNewMap.LayerFrame.grid(column=0, row=3, columnspan=2)
	
	root.WindowNewMap.LayerEntries = []
	root.WindowNewMap.LayerVars = []
	
	for layer in DEFAULT_LAYERS:
		add_layer(root, layer)
	
	root.WindowNewMap.AddLayerButton = tkinter.Button(root.WindowNewMap, text="Add Layer", command=lambda:add_layer(root))	
	root.WindowNewMap.AddLayerButton.grid(column=0, row=4)
	root.WindowNewMap.RemoveLayerButton = tkinter.Button(root.WindowNewMap, text="Remove Layer", command=lambda:remove_layer(root))	
	root.WindowNewMap.RemoveLayerButton.grid(column=1, row=4)
	
	root.WindowNewMap.ButtonConfigureMap = tkinter.Button(root.WindowNewMap, text="Build New Map", command=lambda:build_interface(root, False))
	root.WindowNewMap.ButtonConfigureMap.grid(column=0, row=5)
	
	root.WindowNewMap.EntryMapsizeX.focus()
	
	print("Done.")

def add_layer(root, name="NEW"):
	newLayerVar = tkinter.StringVar()
	newLayerVar.set(name)
	root.WindowNewMap.LayerVars.append(newLayerVar)
	
	newLayerEntry = tkinter.Entry(root.WindowNewMap.LayerFrame, textvariable=newLayerVar)
	newLayerEntry.grid(column=0, row=len(root.WindowNewMap.LayerFrame.winfo_children()))
	root.WindowNewMap.LayerEntries.append(newLayerEntry)
	
def remove_layer(root):
	if len(root.WindowNewMap.LayerVars)-1 > 0:
		del root.WindowNewMap.LayerVars[-1]
		root.WindowNewMap.LayerEntries.pop().destroy()

def build_tilesheet_configuration_dialog(root):
	# Tilesheet properties
	#root.WindowNewMap.config_tilesize 	= tkinter.IntVar()
	#root.WindowNewMap.config_tilesheet = tkinter.IntVar()
	#root.WindowNewMap.config_tilesize.set(root.tile_size)
	#root.WindowNewMap.config_tilesheet.set(root.tilesheet_width)
	
	#root.WindowNewMap.LabelEntryTilesize = tkinter.Label(root.WindowNewMap, text="Tilesize (in px)")
	#root.WindowNewMap.LabelEntryTilesize.grid(column=0, row=2)
	#root.WindowNewMap.EntryTilesize = tkinter.Entry(root.WindowNewMap, textvariable=root.WindowNewMap.config_tilesize, justify='center')
	#root.WindowNewMap.EntryTilesize.grid(column=1, row=2)
	
	#root.WindowNewMap.LabelEntryTilesheet = tkinter.Label(root.WindowNewMap, text="Tilesheet Width (in tiles)")
	#root.WindowNewMap.LabelEntryTilesheet.grid(column=0, row=3)
	#root.WindowNewMap.EntryTilesheet = tkinter.Entry(root.WindowNewMap, textvariable=root.WindowNewMap.config_tilesheet, justify='center')
	#root.WindowNewMap.EntryTilesheet.grid(column=1, row=3)
	pass
	
def build_interface(root, import_needed):
	
	# Check if imported or new map
	if import_needed:
		import_map(root)
	else:
		configure_map(root, root.WindowNewMap)
		root.layer_array = numpy.zeros((root.mapsize_x, root.mapsize_y, len(root.layer_names)))
	
	print("Building interface ...")
	print("\tMap's X Dimension: ", root.mapsize_x)
	print("\tMap's Y Dimension: ", root.mapsize_y)
	
	# Clear the window
	for child in root.winfo_children():
		child.destroy()
	
	# Build the interface
	build_menubar(root)
	build_toolbar(root)
	if root.tilesheet_directory == None:
		set_tilesheet(root)
	build_map_visual(root)
	build_tile_selectors(root)
	
	# Setup keyboard controls
	set_coords(root, 0, 0)
	root.bind("<Left>", lambda event:set_coords(root, root.coord_x-1, root.coord_y))
	root.bind("<Up>", lambda event:set_coords(root, root.coord_x, root.coord_y-1))
	root.bind("<Right>", lambda event:set_coords(root, root.coord_x+1, root.coord_y))
	root.bind("<Down>", lambda event:set_coords(root, root.coord_x, root.coord_y+1))
	
	# Set window expansion aesthetics
	root.columnconfigure(0, weight=1)
	root.rowconfigure(1, weight=1)
	
	print("Done.")

def build_menubar(root):
	print("\tBuilding Menu Bar ...")
	MenuBar = tkinter.Menu(root)

	# create a pulldown menu, and add it to the menu bar
	FileMenu = tkinter.Menu(MenuBar, tearoff=0)
	FileMenu.add_command(label="New Map", command=lambda:build_map_configuration_dialog(root))
	FileMenu.add_separator()
	FileMenu.add_command(label="Import Map", command=lambda:build_interface(root, True))
	FileMenu.add_command(label="Export Map", command=lambda:export_map(root))
	FileMenu.add_separator()
	FileMenu.add_command(label="Exit", command=root.quit)
	MenuBar.add_cascade(label="File", menu=FileMenu)

	# create more pulldown menus
	OptionsMenu = tkinter.Menu(MenuBar, tearoff=0)
	OptionsMenu.add_command(label="Set Tilesheet", command=lambda:build_tile_selectors(root))
	OptionsMenu.add_command(label="Set Layer Separation Key", command=lambda:separate_layers(root))
	MenuBar.add_cascade(label="Options", menu=OptionsMenu)

	HelpMenu = tkinter.Menu(MenuBar, tearoff=0)
	HelpMenu.add_command(label="About", command=lambda:build_about_dialog(root))
	HelpMenu.add_command(label="Help", command=lambda:open_help())
	MenuBar.add_cascade(label="Help", menu=HelpMenu)

	# display the menu
	root.config(menu=MenuBar)

	print("\tDone.")
	
def build_toolbar(root):
	
	print("\tBuilding tool menu ...")
	
	# Build Menu Frame
	ToolFrame = tkinter.Frame(root)
	ToolFrame.grid(column=0, row=0, sticky='NW')
	
	HorizontalRuleTop = ttk.Separator(ToolFrame, orient='horizontal')
	HorizontalRuleTop.grid(column=0, row=0, pady=2, columnspan=3, sticky='EW')
	
	HorizontalRuleBottom = ttk.Separator(ToolFrame, orient='horizontal')
	HorizontalRuleBottom.grid(column=0, row=2, pady=2, columnspan=3, sticky='EW')
	
	print("\t\t Adding file tools ...")
	FileToolsFrame = tkinter.Frame(ToolFrame)
	FileToolsFrame.grid(column=0, row=1)
	
	ButtonNewMap = tkinter.Button(FileToolsFrame, text="New Map", image=root.icons[root.icon['newmap']], command=lambda:build_map_configuration_dialog(root))
	ButtonNewMap.grid(column=0, row=0, padx=(2,0))
	
	ButtonImport = tkinter.Button(FileToolsFrame, text="Import", image=root.icons[root.icon['import']], command=lambda:build_interface(root, True))
	ButtonImport.grid(column=1, row=0)
	
	ButtonExport = tkinter.Button(FileToolsFrame, text="Export", image=root.icons[root.icon['export']], command=lambda:export_map(root))
	ButtonExport.grid(column=2, row=0)
	
	ButtonHelp = tkinter.Button(FileToolsFrame, text="Help", image=root.icons[root.icon['help']], command=lambda:open_help())
	ButtonHelp.grid(column=3, row=0, padx=(0,2))
	
	VRFileTools = ttk.Separator(FileToolsFrame, orient='vertical')
	VRFileTools.grid(column=4, row=0, sticky='NS')
	
	print("\t\tAdding map tools ...")
	MapToolsFrame = tkinter.Frame(ToolFrame)
	MapToolsFrame.grid(column=1, row=1)
	
	ButtonRectSelect = tkinter.Button(MapToolsFrame, text="RectSelect", image=root.icons[root.icon['rectselect']], command=lambda:rect_select(root))
	ButtonRectSelect.grid(column=0, row=0, padx=(2,0))
	root.rsel_button = ButtonRectSelect
	
	ButtonSeparate= tkinter.Button(MapToolsFrame, text="Separate Layers", image=root.icons[root.icon['separatelayers']], command=lambda:separate_layers(root))
	ButtonSeparate.grid(column=1, row=0, padx=(0,2))
	
	VRMapTools = ttk.Separator(MapToolsFrame, orient='vertical')
	VRMapTools.grid(column=2, row=0, sticky='NS')
	
	print("\t\tAdding layer selectors ...")
	LayerSelectionFrame = tkinter.Frame(ToolFrame)
	LayerSelectionFrame.grid(column=2, row=1)
	
	root.layer_buttons = []
	
	for layer in range(len(root.layer_names)):
		newButton = tkinter.Button(LayerSelectionFrame, text=root.layer_names[layer], command=lambda layer=layer:select_layer(root, layer))
		root.layer_buttons.append(newButton)
		if layer == 0:
			root.layer_buttons[layer].grid(column=layer, row=0, padx=(2,0), pady=2, sticky='NW')
		else:
			root.layer_buttons[layer].grid(column=layer, row=0, pady=2, sticky='NW')
	
	print("\tDone.")
	
def build_map_visual(root):
	
	print("\tBuilding map view ...")
	
	MapFrame = tkinter.Frame(root)
	MapFrame.grid(column=0, row=1, sticky='NESW')
	
	MapFrame.columnconfigure(0, weight=1)
	MapFrame.rowconfigure(0, weight=1)
	
	# Build Canvas for map visual
	VScrollBar = tkinter.Scrollbar(MapFrame)
	VScrollBar.grid(column=1, row=0, padx=5, rowspan=2, sticky='NS')
	HScrollBar = tkinter.Scrollbar(MapFrame, orient='horizontal')
	HScrollBar.grid(column=0, row=1, sticky='EW')
	
	MapVisualCanvas = tkinter.Canvas(MapFrame, yscrollcommand=VScrollBar.set, xscrollcommand=HScrollBar.set, bg='gray')
	MapVisualCanvas.grid(column=0, row=0, sticky='NESW')
	
	VScrollBar.config(command=MapVisualCanvas.yview)
	HScrollBar.config(command=MapVisualCanvas.xview)
	
	MapVisualFrame = tkinter.Frame(MapVisualCanvas)
	MapVisualFrame.grid(column=0, row=1, sticky='NW')
	
	# Construct buttons with unique callbacks
	root.mapbuttons = []
	
	for index_y in range(root.mapsize_y):
		for index_x in range(root.mapsize_x):
			newButton = tkinter.Button(MapVisualFrame, image=root.tiles[0], command=lambda x=index_x, y=index_y: set_coords(root, x, y))
			root.mapbuttons.append(newButton)
	
	for index in range(root.mapsize_x*root.mapsize_y):
		root.mapbuttons[index].grid(column=int(index%root.mapsize_x), row=int(index/root.mapsize_x))
	
	# Draw the canvas
	MapVisualCanvas.create_window(0, 0, anchor='nw', window=MapVisualFrame)
	MapVisualFrame.update_idletasks()
	MapVisualCanvas.config(scrollregion=MapVisualCanvas.bbox("all"))
		
	print("\tDone.")
	
def build_tile_selectors(root):
	
	print("\tBuilding tile selection interface ...")
	
	if root.tilebuttons != None:
		set_tilesheet(root)
		for Button in root.tilebuttons:
			Button.destroy()
		
	# Build Frame, label and spacer for tile selectors
	VRTileSelection = ttk.Separator(root, orient='vertical')
	VRTileSelection.grid(column=2, row=0, rowspan=4, pady=6, sticky='NS')
	
	TileSelectorFrame = tkinter.Frame(root, pady=10)
	TileSelectorFrame.grid(column=3, row=0, rowspan=4, sticky='NW')
	
	TileSelectorLabel = tkinter.Label(TileSelectorFrame, text="Tile Sheet")
	TileSelectorLabel.grid(column=0, row=0)
	
	HRTileSelection = ttk.Separator(TileSelectorFrame, orient='horizontal')
	HRTileSelection.grid(column=0, row=1, pady=6, sticky='EW')
	
	TileSelectorButtonFrame = tkinter.Frame(TileSelectorFrame, padx=5, pady=5)
	TileSelectorButtonFrame.grid(column=0, row=2, sticky='NW')
	
	# Allocate array for storing dynamic button array
	
	root.tilebuttons = []
	
	# Construct buttons with unique callbacks
	for index in range(root.tilesheet_size):
		newButton = tkinter.Button(TileSelectorButtonFrame, text=str(index), image=root.tiles[index], command=lambda tile_num=index: set_tile(root, tile_num))
		root.tilebuttons.append(newButton)
		root.tilebuttons[index].grid(column=int(index%root.tilesheet_width), row=int(index/root.tilesheet_width))
	
	# Load images from base map layer
	select_layer(root, 0)
	
	print("\tDone.")

def build_about_dialog(root):
	message = "-- MapMaker v"+VERSION+"--\nA GUI for creating map arrays for the Flixel engine.\nUsed in part to create Starwatcher by the GW Game Developers.\n\nCreated by:\nMark Tentindo - 2013\nhttps://github.com/markten/mapmaker"
	tkinter.messagebox.showinfo("About", message)
	
