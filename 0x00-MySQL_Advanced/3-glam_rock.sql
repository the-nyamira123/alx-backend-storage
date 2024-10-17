-- Lists all bands with Glam rock as their main style, ranked by their longevity.
SELECT band_name, (IFNULL(split, 2022) - formed) AS lifespan
    FROM metal_bands
    WHERE style = 'Glam rock' -- Use '=' if style is a single value column
    ORDER BY lifespan DESC;

