---------------------------------INDEXES---------------------------------



-- Create an index for fast lookup based on a given name
CREATE INDEX item_index ON "items" ("item");

-- Create an index for fast lookup based on a given year
CREATE INDEX year_index ON "dates" ("year");

-- Create an index for fast lookup based on a given price
CREATE INDEX price_index ON "prices" ("date_id", "item_id", "price");