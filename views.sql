---------------------------------VIEWS---------------------------------



-- Create a view to display all the dates and prices
CREATE VIEW food_prices AS
    SELECT "year", "month", "item", "price" FROM "prices"
    JOIN "dates" ON "dates"."id" = "prices"."date_id"
    JOIN "items" ON "items"."id" = "prices"."item_id";

-- Create a view to display average price per year for oranges
CREATE VIEW avg_orange_price AS
    SELECT "year", printf("%.2f", ROUND(AVG("price"), 2)) AS "average_price" FROM "prices"
    JOIN "dates" ON "dates"."id" = "prices"."date_id"
    WHERE "item_id" = (
        SELECT "id" FROM "items"
        WHERE "item" = 'Oranges, 1kg'
    )
    GROUP BY "year";

-- Create a view to display peak price for a dozen eggs
CREATE VIEW peak_price_eggs AS
    SELECT "year", "month", printf("%.2f", MAX("price")) AS "highest_price" FROM "prices"
    JOIN "dates" ON "dates"."id" = "prices"."date_id"
    WHERE "item_id" = (
        SELECT "id" FROM "items"
        WHERE "item" = 'Eggs, dozen'
    );

-- Create a view to display months when apples are cheapeast (most likely in season) for recent years
CREATE VIEW cheapeast_apples AS
    SELECT "month", ROUND(AVG("price"), 2) AS "average_price" FROM "prices"
    JOIN "dates" ON "dates"."id" = "prices"."date_id"
    WHERE "item_id" = (
        SELECT "id" FROM "items"
        WHERE "item" = 'Apples, 1kg'
    ) AND "year" >= 2020
    GROUP BY "month"
    ORDER BY "average_price";

-- Create a view to display prices of sandwiches for the most recent year
CREATE VIEW recent_sandwich_prices AS
    SELECT "year", "month", "price" FROM "prices"
    JOIN "dates" ON "dates"."id" = "prices"."date_id"
    WHERE "item_id" = (
        SELECT "id" FROM "items"
        WHERE "item" LIKE 'sandwich%'
    ) AND "year" = (
        SELECT MAX("year") FROM "dates"
    )
    ORDER BY "month" DESC;