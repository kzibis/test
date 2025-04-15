from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from pyvirtualdisplay import Display

service = Service(executable_path=r'/usr/bin/chromedriver')

# Chromeのオプション設定
def get_chrome_options(temp_dir=None):
    opts = webdriver.ChromeOptions()
    opts.add_argument('--no-sandbox')
    opts.add_argument('--disable-dev-shm-usage')
    opts.add_argument('--disable-gpu')
    opts.add_argument('--window-size=1200x1800')
    if temp_dir:
        opts.add_argument(f"--user-data-dir={temp_dir}")
    return opts

def scrape():
    driver = None
    num_of_pages = None
    
    try:
        temp_dir = tempfile.mkdtemp()
        options = get_chrome_options(temp_dir)
        driver = webdriver.Chrome(options=options, service=service)
        
        url = f"https://example.com"
        driver.get(url)
        time.sleep(1)

# メイン処理
def main(area):
    display = Display(visible=0, size=(800, 600))
    display.start()
    try:  
        paths = []
        start_time = time.time()
        path = scrape()
        return paths
    finally:
        display.stop()
