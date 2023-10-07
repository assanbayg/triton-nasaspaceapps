from bs4 import BeautifulSoup as BS
import requests

pages = 1 # страница
domain = 'https://informburo.kz/' # домен
tag = f'{domain}tags/pozhar?page={pages}' # страница с пожаром

# получиить данные о странице
def get_html(url):
    response = requests.get(url)
    return response.text

# получть название, картинку и ссылку
def extract_article_info(html):
    articles = [] # список всех новостей на одну страницу (макс. 16)
    soup = BS(html, "html.parser")
    article_cards = soup.find_all('div', class_='uk-width-1-4@m uk-width-1-2@s uk-width-1-1 uk-margin-medium-bottom') # все новости

    if article_cards:
        for article_card in article_cards: # прохит по всем новостям и берет нужное
            article_text = article_card.h3.text.strip()
            image_url = f"{domain}{article_card.img['data-src'][1::]}"
            href = article_card.a['href']

            articles.append([article_text, image_url, href]) # добавление всех новостей в один список
    else:
        return 0
    
    return articles

# начать парсинг
def parse_site():
    html_content = get_html(tag)
    return extract_article_info(html_content) # возвращает список

print(parse_site()[:])
