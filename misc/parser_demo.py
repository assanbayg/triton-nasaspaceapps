from bs4 import BeautifulSoup as BS
import requests

#create a request from a webpage
def get_html(url):
    response = requests.get(url)
    return response.text

def extract_article_info(html):
    soup = BS(html, "html.parser")
    article_cards = soup.find_all('div', class_='uk-width-1-4@m uk-width-1-2@s uk-width-1-1 uk-margin-medium-bottom') #find all elements with given classes

    if article_cards: #going through all of them and get the name, image, and link
        for article_card in article_cards:
            article_text = article_card.h3.text.strip()
            image_url = f"https://informburo.kz{article_card.img['data-src'][1::]}"
            href = article_card.a['href']

            print(f'article:       {article_text}\nthumbnail_url: {image_url}\nlink:          {href}\n')
    else:
        print("Не найден.")

html_content = get_html('https://informburo.kz/tags/pozhar?page=1') #info parsed from informoburo.kz
extract_article_info(html_content)
