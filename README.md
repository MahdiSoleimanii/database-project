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