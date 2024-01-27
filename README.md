In this project we aim to implement and analyze a library database containing information about books, publishers, authors and relationships between them.

---
# Relations and Tables
***Books*** Table containing information about books with the following attributes:
- ISBN
- title
- pages
- price
- edition_num
- print_series
- category_id

***Publishers*** Table containing information about publishers with the following attributes:
- ID
- publisher_name
- city
- manager_name
- total_printed
- total_revenue

***Authors*** Table containing information about authors with the following attributes:
- ID
- author_name
- age
- total_revenue

***PubBooks*** Table containing information about the publisher of each book with the following attributes:
- ISBN
- publisher_id
- publish_date
- publisher_revenue

***AuthBooks*** Table containing information about the author of each book with the following attributes:
- ISBN
- author_id
- author_revenue

***Categories*** Table containing a list of categories for books with the following attributes:
- ID
- category_name

# Value Domains
***‌Books***
- $12,000$ books
- $10^9 \leq$ ISBN $< 10^{10}$ (since ISBN has 10 digits)
- $11,800$ distinct book titles
- $10,000 \leq$ prints/book $\leq 50,000$
- $30 \leq$ pages/book $\leq 2000$
- Max book price: $\$200$
- Max number of editions: $8$
- Max print series: $80$

***Publishers***
- $120$ publishers (%$1$ of books)
- $101 \leq$ ID $\leq 220$
- $12$ cities (%$10$ of publishers)
- $116$ distinct manager names
- Publisher share/book: %$40$

***Authors***
- $240$ Authors (twice the publishers)
- $101 \leq$ ID $\leq 340$
- $15 \leq$ age $\leq 90$
- Author share/book: %$60$

***Categories***
- $40$ distinct categories
- Fiction, Narrative, Novel, Historical Fiction, Science Fiction, Mystery, Non-fiction, Genre Fiction, Romance Novel, Thriller, Women's Fiction, Young Adult Fiction, Literary Fiction, Short Story, History, Graphic Novel, Memoir, Self-help, Fantasy, Children's Literature, Biography, Historical Fantasy, Adventure Fiction, Humor, True Crime, Contemporary Romance, Essay, Action Fiction, Historical Romance, Fantasy Fiction, New adult Fiction, Contemporary Literature, Magical Realism, Social science, Autobiography, Western Fiction, Horror Fiction, Speculative Fiction, Poetry, Satire

# Phase ONE
in this phase, an E-R diagram is designed

![ER-Diagram](imgs/1.%20ER%20Diagram.png)
Using [draw.io](https://app.diagrams.net/)

# Phase TWO
in this phase, simple SQL queries are executed
- Queries to create tables
- Insertion queries and checking data types to be valid
- Insert, modify and delete data
- `Name` and `Age` of all the `Authors` that authored a `Book`
- `Revenue` of each `Author` for each book they have authored. if an `Author` doesn't have any books their revenue is `0`
- 5 `Books` with most number of `Pages` for each `Publisher`
- Average `Revenue` of each publisher in a specific `Month`
- Number of published `Books` for each `Publisher` in a given `Time Period`
- Average `Time Period` between each publish for each `Publisher`
- `Authors` that authored books in more than 2 `Categories`

# Phase THREE
in this phase, advanced analytical queries are implemented
- Average number of `Books` published per `Day of Week`
- 3 `Cities` that publish the most number of `Books`
- Average `Author Revenue` for each `Category`
- Favorite `Category` of each `Author`. Favorite category of each author is the one they've authored the most books in.
- `Authors` that authored more books than authors. Basically the author/authors with most books.
- A `Time of Year` where `Publishers`' revnue is most.

# Phase FOUR
This phase, deals with normalization of the database relations.
## Functional Dependencies

Database schema is shown below:

```
Categories(ID, category_name)

Books(ISBN, title, pages, price, edition_num, print_series, category_id)

Publishers(ID, publisher_name, city, manager_name, total_printed, total_revenue)

Authors(ID, author_name, age, total_revenue)

PubBooks(ISBN, publisher_id, published_date, publisher_revenue)

AuthBooks(ISBN, author_id, author_revenue)
```

### Categories
$$
\begin{array}{l}
\text{ID} \rightarrow \text{category\_name} \\
\text{category\_name} \rightarrow \text{ID}
\end{array}
$$

### Books
$$
\begin{array}{l}
\text{ISBN} \rightarrow \text{title, pages, price, edition\_num, print\_series, category\_id} \\
\end{array}
$$

### Publishers
$$
\begin{array}{l}
\text{ID} \rightarrow \text{city, manager\_name, total\_printed, total\_revenue} \\
\text{publisher\_name} \rightarrow \text{city, manager\_name, total\_printed, total\_revenue} \\
\text{publisher\_name} \rightarrow \text{ID} \\
\text{ID} \rightarrow \text{publisher\_name}
\end{array}
$$

### Authors
$$
\begin{array}{l}
\text{ID} \rightarrow \text{author\_name, age, total\_revenue}
\end{array}
$$

### PubBooks
$$
\begin{array}{l}
\text{ISBN} \rightarrow \text{publisher\_id, publish\_date, publisher\_revenue} \\
\end{array}
$$

### AuthBooks
$$
\begin{array}{l}
\text{ISBN} \rightarrow \text{author\_id, author\_revenue} \\
\end{array}
$$

## Normalization
All relations are in 1NF: All columns contain only atomic values

All relations are in 2NF: There is no partial functional dependency (there is only one FD for each relation)

All relations are in 3NF (except Publishers): There is no transitive FD

To normalize Publishers, we turn it into 2 relations: 
- PublishersNames
- PublishersInfo

as below:
```
PublishersNames(ID, publisher_name)
PublishersInfo(ID, city, manager_name, total_printed, total_revenue)
```

## Candidate Keys
$$
\begin{align*}
    \text{Categories}&: \text{ID}, \text{category\_name} \\
    \text{Books}&: \text{ISBN} \\
    \text{PublishersNames}&: \text{ID}, \text{publisher\_name} \\
    \text{PublishersInfo}&: \text{ID}\\
    \text{Authors}&: \text{ID} \\
    \text{PubBooks}&: \text{ISBN} \\
    \text{AuthBooks}&: \text{ISBN} \\
\end{align*}
$$

# How to `Run`

## Data Generation & Extraction
1. run `genrator.ipynb`. this code creates a file named `data.csv` which contains the raw data to be processed later.
2. run `extractor.ipynb`. this code extracts all the 6 tables from `data.csv` and saves them in `data/` directory.

## Test Queries
1. Go to `test_queries/`.
2. Run `create_temp_db.ipynb`. This code creates a *SQLite* database inside `test_database/` directory and creates all the tables inside it. The query to create the tables is located in `sql_files/0. create.sql`
3. Run `test_insertion.ipynb`. This code inserts few values into the database, modifies one of them and then deletes it.

## Phase TWO Queries
1. All queries are located in `sql_files/`.
2. To run the queries, open `queries/queries.ipynb` and run the file.
3. All the queries are executed and the results are saved in **.txt** format inside `query_results/` directory.

## Phase THEREE Queries
1. All queries are located in `adv_sql_files/`.
2. To run the queries, open `queries/adv_queries.ipynb` and run the file.
3. All the queries are executed and the results are saved in **.txt** format inside `adv_query_results/` directory.