---------------------------------SELECT---------------------------------



-- Check top 3 months to buy cheap apples
SELECT * FROM "cheapeast_apples"
LIMIT 3;

-- Check all listed prices for vinegar
SELECT * FROM "food_prices"
WHERE "item" LIKE 'vinegar%';

-- Check lifetime average price for mayonnaise
SELECT AVG("price") AS "average_price" FROM "food_prices"
WHERE "item" LIKE 'mayonnaise%';



---------------------------------INSERT---------------------------------



-- Insert most recent month
INSERT INTO "dates" ("year", "month")
VALUES (2023, 10);

-- Insert new food
INSERT INTO "items" ("item")
VALUES ('Black pepper, 1kg');

-- Insert new price for black pepper for most recent month
INSERT INTO "prices" ("date_id", "item_id", "price")
VALUES ((
        SELECT "id" FROM "dates"
        WHERE "year" = 2023 AND "month" = 10
    ), (
        SELECT "id" FROM "items"
        WHERE "item" LIKE 'Black pepper'
    ),
    600.11
);



---------------------------------UPDATE---------------------------------



-- Change pricing typo
UPDATE "prices"
SET "price" = 6.11
WHERE "date_id" = (
    SELECT "id" FROM "dates"
    WHERE "year" = 2023 AND "month" = 10
) AND "item_id" = (
    SELECT "id" FROM "items"
    WHERE "item" LIKE 'black pepper%'
);

-- Change item name
UPDATE "items"
SET "item" = 'Black pepper, 0.5kg'
WHERE "item" LIKE 'black pepper%';

-- Change date logged for item price
UPDATE "prices"
SET "date_id" = (
    SELECT "id" FROM "dates"
    WHERE "year" = 2016 AND "month" = 4
)
WHERE "item" LIKE 'black pepper%' AND "date_id" = (
    SELECT "id" FROM "dates"
    WHERE "year" = 2023 AND "month" = 10
);



---------------------------------DELETE---------------------------------



-- Delete time with no recorded prices
DELETE FROM "dates"
WHERE "year" = 2023 AND "month" = 10;

-- Delete all recorded prices for a given year
DELETE FROM "dates"
WHERE "year" = 2006;

-- Delete item and all recorded prices along with it
DELETE FROM "items"
WHERE "item" LIKE 'bananas%';
