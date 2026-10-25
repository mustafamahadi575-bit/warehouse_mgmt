# Warehouse Management Database Project

## Project Overview
This database system is designed for managing warehouse inventory, category cataloging, and stock transactions using MySQL.

## Database Name
`mustafa_20241234_warehouse_mgmt`

## Entity Relationship Diagram (ERD)
The database structure consists of three main tables:
1. `categories` (Parent Table)
2. `products` (Child Table linked to categories)
3. `stock_transactions` (Child Table linked to products)

![ERD Diagram](erd.png)

## Repository Structure
- `schema.sql`: Complete SQL script including table creation, initial data, and JOIN queries.
- `erd.png`: Entity Relationship Diagram image.
- `README.md`: Project documentation file.