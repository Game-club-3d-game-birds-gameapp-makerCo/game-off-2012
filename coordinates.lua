Coordinates = Class {}

function Coordinates:pixels_to_tiles(pixel_x, pixel_y)
    local tile_x = math.floor(pixel_x / kTileSize)
    local tile_y = math.floor(pixel_y / kTileSize)
    return tile_x, tile_y
end

function Coordinates:tiles_to_pixels(column, row)
    local pixel_x = column * kTileSize
    local pixel_y = row * kTileSize
    return pixel_x, pixel_y
end

function Coordinates:tile_at_pixels(pixel_x, pixel_y, layer)
    local tile_x, tile_y = Coordinates:pixels_to_tiles(pixel_x, pixel_y)
    return TiledMap_GetMapTile(tile_x,tile_y,layer)
end
