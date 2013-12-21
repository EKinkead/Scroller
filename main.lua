
require ("loq_util")

display.setStatusBar( display.HiddenStatusBar ) -- Get rid of that thing
display.setDefault ("magTextureFilter", "nearest") -- make it nice and pixeled

-- Test = display.newImage( "images/img_Backdrop2.png")

-- Some kind of map thing
--foot = display.newImage("mapTile1.png", 100, 100)
local myText = display.newText( "Hello World!", 0, 0, native.systemFont, 16 )
local currentMap = {}

-- Set up the map. Best to NOT do this with hardcoded Numbers, so you can make minimaps, etc.

currentMap.mapWidth = 13 -- This is how many items(rows) are in 1 row of a map.
currentMap.mapHeigth = 12 -- This is how many down
currentMap.TileSizeSquare = 20 -- how many pixels a square

currentMap.mapData = {

			2,2,3,1,1,1,1,1,1,1,1,1,2,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,1,
			1,1,1,1,1,1,1,1,1,1,1,1,2,

			}

-- OK.  We have a map.  Now we draw it...

-- think of Y as Rows, and X as columns
local row = 0
local column =0
local mapLocation = 0
local myMapGroup = display.newGroup()
local tileNumber

local drawX = -10
local drawY = 0

for row=1, (currentMap.mapHeigth) do  -- This will start at the top first row and work down
										   -- The reason it starts at 0 and to mapHeigth-1 is because of MAGIC STEP below...

			for column=1, (currentMap.mapWidth) do
				-- mapLocation = mapLocation + 1 
				drawX = drawX+ 20
					
				
				tileNumber = currentMap.mapData [((currentMap.mapWidth*(row-1))+ (column)  ) ] 
				-- print (currentMap.mapData [((currentMap.mapWidth*(row-1))+ (column)  ) ] )
				io.write (tileNumber)
				--Now that we have the correct tile, lets append the correct filename for the tile.
				--currentTile = display.newImage( "/images/mapTile1.png" )
				currentTile = display.newImage( "images/mapTile" .. tileNumber .. ".png" )
				currentTile.x = 10
				currentTile.y = 10 
				

				currentTile.x = currentTile.x + (column-1) * 20  -- more MAGIC STEP. since we set that first row to ZERO, if you are on it it won't multiply an extra 20
 				currentTile.y = currentTile.y + drawY

			end

			drawY = drawY + 20

			io.write ("\n")
			-- IGNORE BELOW
			-- group.maps.groups['ScrollMap']:insert(myMapGroup)
			-- group.maps.groups['ScrollMap']:insert(pointer)

			----print ("WTF")
			--
			--
			--  Draw the exclamations on the screen or something
			--
			--
			--

end
