from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service

service = Service('/Users/liujinliang/workspace/music/vms/utils/chromedriver')
service.start()
driver = webdriver.Remote(service.service_url)


driver.get("https://www.zxzj.fun/video/2416-1-1.html")
elem = driver.find_element_by_css_selector("video source")
print(elem.get_attribute("src"))
driver.quit()
service.stop()

