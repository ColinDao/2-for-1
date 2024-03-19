-- Import food-prices-nz.csv into a temporary table
.import --csv food-prices-nz.csv temp

-- Update all dates where the January logs aren't two digits
UPDATE "temp"
    SET "Period" = substr("Period", 1, 5) || "01"
    WHERE "Period" LIKE '%.1';

-- Create a table for all the logged months and years
CREATE TABLE dates (
    "id" INTEGER,
    "year" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

-- Upload dates data to "dates" table
INSERT INTO "dates" ("year", "month")
    SELECT substr("Period", 1, 4), substr("Period", 6, 2) FROM (
        SELECT DISTINCT "Period" FROM "temp"
    );

-- Create a table for all the logged items and their weight
CREATE TABLE items (
    "id" INTEGER,
    "item" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

-- Upload items data to "items" table
INSERT INTO "items" ("item")
    SELECT DISTINCT "Series_title_1" FROM "temp";

-- Create a table for all the prices per item and date
CREATE TABLE prices (
    "date_id" INTEGER,
    "item_id" INTEGER,
    "price" REAL NOT NULL,
    FOREIGN KEY("date_id") REFERENCES "dates"("id") ON DELETE CASCADE
    FOREIGN KEY("item_id") REFERENCES "items"("id") ON DELETE CASCADE
);

-- Upload prices data to "items" table along with respective date and item IDs
INSERT INTO "prices" ("date_id", "item_id", "price")
    SELECT "dates"."id", "items"."id", "Data_value" FROM "temp"
    JOIN "dates" ON ("dates"."year" = substr("temp"."Period", 1, 4) AND "dates"."month" = substr("temp"."Period", 6, 2))
    JOIN "items" ON "items"."item" = "temp"."Series_title_1";
