# W04
### 이메일 유효성 검사 프로그램 만들기(1 - 3)
```python
userMail = list()
while True :
    email = input('메일 입력 : ')
    if not email.strip() :
        break
    elif email.count('@') == 1 :
        if email.find('@') < email.find('.') :
            userMail.append(email)
        else :
            print('잘못된 형식의 메일')
    else :
        print('잘못된 형식의 메일')
for mail in userMail :
    print(mail, end =' ')
```
### URL에서 도메인 이름 추출 (1 - 4)
```python
url = input('URL : ')
url = url.replace('https://', '')
url = url.replace('http://', '')
url = url.replace('www.', '')
url = url.split('/')
domain = url[0]
print(domain)
```
### 문자열 암호화 (1 - 5)
```python
pw = input('문자열 입력 : ')
ch_data = list()
# ch_data = ''.join(chr(ord(ch) + 2)for ch in pw)
for ch in pw :
    word = chr(ord(ch) + 2)
    ch_data.append(word)
print(''.join(ch_data))
```
### 리스트에서 중복 제거(2 - 3)
```python
num_list = input('숫자열 입력 : ')
unique_list = list()
for unique in num_list.split() :
    unique = int(unique)
    if unique not in unique_list :
        unique_list.append(unique)
unique_list.sort()
print(unique_list)
# set 사용
result = sorted(set(map(int, num_list.split())))
print(result)
```
### 문자열 정렬 프로그램 (리스트 활용) (2 - 4)
```python
text_list = list()
while True :
    userText = input('문장 입력 : ')
    if not userText.strip() :
        break
    else :
        user_string = sorted(userText.split())
        text_list.append(user_string)

for result in text_list :
    print(' '.join(result))
```
