# W04
## (LAB 3-6 - 수행과제)
```python
log_data = """ 
    192.168.0.1 - - [21/Jan/2025:10:00:00 +0000] "GET /index.html HTTP/1.1" 200 1024
    203.0.113.45 - - [21/Jan/2025:10:01:00 +0000] "POST /login HTTP/1.1" 200 2048
    198.51.100.23 - - [21/Jan/2025:10:02:00 +0000] "GET /dashboard HTTP/1.1" 403 512
"""

ip_list = list()
data = log_data.strip().split('\n')
for ip in data : 
    ip = ip.strip().split()
    ip_list.append(ip[0])

print(ip_list)


result = list()
arr = log_data.strip().split('\n')
for number in range(len(arr)) :
    value = arr[number].strip().split()[0]
    result.append(value)
print(result)
```
### 결과
```
['192.168.0.1', '203.0.113.45', '198.51.100.23']
['192.168.0.1', '203.0.113.45', '198.51.100.23']
```
## (LAB 3-7 - 수행과제)
```python
html_data = """
    <html>
        <head>
            <title>Welcome to My Website</title>
        </head>
        <body>
            <h1>Hello, World!</h1>
        </body>
    </html>
"""
x = html_data.find('<title>')  + len('<title>')
y = html_data.find('</title>')
print(html_data[x:y])
```
###  결과
```
Welcome to My Website
```
## (LAB 3-8 - 수행과제)
```python
arr = list()
input_text = "oolllleeHH !!ddllrrooww"
for text in input_text.split() :
    text = text[::-1]
    text = text[::2]
    arr.append(text)
print(' '.join(arr))
```
