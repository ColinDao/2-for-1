# 2-for-1 Special

## Project Description

This project entails the creation of a SQLite database documenting the prices of 150 different food items from a New Zealand 
supermarket over a span of 17 years, comprising approximately 30,000 data points. The database serves as a comprehensive 
repository for historical food price data, facilitating analysis and insights into food pricing trends, inflation rates, and consumer purchasing patterns.
The project includes SQL scripts for creating tables, views, indexes, and sample queries for data analysis.

## Table of Contents

- [Tables](#tables)
- [Indexes](#indexes)
- [Views](#views)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Technologies](#technologies)
- [Credit](#credit)
- [License](#license)

## Tables
The database schema includes three main tables:

1. **Dates**: Records all the logged months and years.
2. **Items**: Stores information about the logged food items and their descriptions.
3. **Prices**: Contains the prices per item and date.
 
## Indexes
Indexes are created for fast lookup based on specific attributes to optimize query performance. The indexes are as follows:

1. **item_index**: Index for fast lookup based on the item name.
2. **year_index**: Index for fast lookup based on the year.
3. **price_index**: Composite index for fast lookup based on date, item, and price.

**Views**
Several views are defined to facilitate data analysis and reporting:

1. **food_prices**: Displays all the dates and prices for the logged items.
2. **avg_orange_price**: Shows the average price per year for oranges.
3. **peak_price_eggs**: Displays the peak price for a dozen eggs.
4. **cheapest_apples**: Lists the months when apples are cheapest for recent years.
5. **recent_sandwich_prices**: Provides prices of sandwiches for the most recent year.
   
## Sample Queries
Sample queries are provided to demonstrate the functionality of the database and its potential use cases. These queries include:

1. Checking the top months to *buy cheap apples*.
2. Listing *all prices for vinegar*.
3. Calculating the *lifetime average price for mayonnaise*.

## Installation

1. Clone the repository:

```bash
git clone https://github.com/ColinDao/2-for-1.git
```

2. Navigate to the project directory:

```bash
cd 2-for-1
```

3. Create the database schema and tables:

```bash
sqlite3 food-prices.db < schema.sql
```

4. (Optional) Create the sample indexes:
   
```bash
sqlite3 food-prices.db < indexes.sql
```

5. (Optional) Create the sample views:
   
```bash
sqlite3 food-prices.db < views.sql
```

## Usage

To interact with the database, run the following command:

```bash
sqlite3 food-prices.db
```

To execute the sample queries, run the following command:

```bash
sqlite3 food-prices.db < queries.sql
```

Refer to the above sections to see what each view, index, and query does.

## Features

**Data Collection**: Gather price data for 150 distinct food items from various New Zealand supermarkets, spanning 17 years. 
Collect data points regularly to maintain an up-to-date and comprehensive dataset. <br />
<br />
**Database Schema**: Design a well-structured SQLite database schema to organize and store the collected price data efficiently. 
Define tables for food items, prices, and dates.<br />
<br />
**Data Analysis**: Perform exploratory data analysis (EDA) on the database to uncover trends, patterns, and insights into food price 
fluctuations over time. Utilize SQLite queries and statistical analysis techniques to derive meaningful conclusions from the data.<br />
<br />
**Data Retrieval**: Create SQLite indexes and views in order to optimize data retrieval for complex queries.

## Credit

This project was completed as a part of [CS50's Introduction to Databases with SQL](https://cs50.harvard.edu/sql/2024/). Go check them out!

## Technologies
**Database Management System**: SQLite <br />
**Datasets**: (Presumably) archived "New Zealand Food Prices" dataset from [New Zealand Government Stats](https://www.stats.govt.nz/large-datasets/csv-files-for-download/)

## License

MIT License

Copyright (c) 2024 Colin Dao

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
