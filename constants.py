ISBN_LOW, ISBN_HIGH = 1_000_000_000, 9_999_999_999
NUM_BOOKS = 12000
DISTINCT_BOOK_TITLES = 11800
PRINT_MIN, PRINT_MAX = 10, 50
PAGE_MIN, PAGE_MAX = 30, 2_000
PRICE_MAX = 200
EDITION_MAX = 8
PRINT_SERIES_MAX = 80
NUM_CATEGORIES = 40

NUM_PUBLISHERS = int(NUM_BOOKS * 0.01)
PUBLIHSER_ID_MIN = 10 ** (len(str(NUM_PUBLISHERS)) - 1)
PUBLISHER_ID_MAX = PUBLIHSER_ID_MIN + NUM_PUBLISHERS
NUM_CITIES = int(NUM_PUBLISHERS / 10)
DISTINCT_MANAGER_NAMES = NUM_PUBLISHERS - round(NUM_PUBLISHERS * 0.003)
PUBLISHER_SHARE = 0.4

NUM_AUTHORS = NUM_PUBLISHERS * 2
AUTHOR_ID_MIN = 10 ** (len(str(NUM_AUTHORS)) - 1)
AUTHOR_ID_MAX = AUTHOR_ID_MIN + NUM_AUTHORS
AGE_MIN, AGE_MAX = 15, 90
AUTHOR_SHARE = 1 - PUBLISHER_SHARE

CATEGORIES = ['Fiction',
              'Narrative',
              'Novel',
              'Historical Fiction',
              'Science Fiction',
              'Mystery',
              'Non-fiction',
              'Genre Fiction',
              'Romance Novel',
              'Thriller',
              "Women's Fiction",
              'Young Adult Fiction',
              'Literary Fiction',
              'Short Story',
              'History',
              'Graphic Novel',
              'Memoir',
              'Self-help',
              'Fantasy',
              "Children's Literature",
              'Biography',
              'Historical Fantasy',
              'Adventure Fiction',
              'Humor',
              'True Crime',
              'Contemporary Romance',
              'Essay',
              'Action Fiction',
              'Historical Romance',
              'Fantasy Fiction',
              'New adult Fiction',
              'Contemporary Literature',
              'Magical Realism',
              'Social science',
              'Autobiography',
              'Western Fiction',
              'Horror Fiction',
              'Speculative Fiction',
              'Poetry',
              'Satire']