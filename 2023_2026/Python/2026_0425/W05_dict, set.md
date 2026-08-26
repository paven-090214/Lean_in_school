## 5주차 실습 1 - 5
```python
logs = {
    "user1": [("/home", 200, "2025-01-20T10:00:00"),
    ("/admin", 500, "2025-01-20T10:10:00"),
    ("/dashboard", 200, "2025-01-20T10:20:00")],
    "user2": [("/home", 200, "2025-01-20T11:00:00"),
    ("/admin", 403, "2025-01-20T11:15:00"),
    ("/settings", 500, "2025-01-20T11:30:00")],
    "user3": [("/home", 200, "2025-01-20T12:00:00"),
    ("/dashboard", 200, "2025-01-20T12:20:00")]
}

userCount = dict()
for key in logs.keys() :
    count = 0
    for user in logs[key] :
        count += 1
    userCount[key] = count
print(userCount.items())
userCount.clear()
for key, value in logs.items() :#파이썬 스러운 방법
    userCount[key] = len(value)
print(userCount.items())

errorUser = dict()
for user, data in logs.items() :
    count = 0
    for host, code, date in data :
        if 500 <= code < 600 :
            count += 1
    if count > 0 :
        errorUser[user] = count
print(errorUser.items())

admin_user = dict()
for key, data in logs.items() :
    count = 0
    for host, code, date in data :
        if 'admin' in host :
            count += 1
        if count > 0 :
            admin_user[key] = count
print(admin_user.items())
```
### 결과
```
dict_items([('user1', 3), ('user2', 3), ('user3', 2)])
dict_items([('user1', 3), ('user2', 3), ('user3', 2)])
dict_items([('user1', 1), ('user2', 1)])
```
## 5주차 2 - 3
```python
emails = [
    "alice@example.com", "bob@example.com", "alice@example.com",
    "charlie@example.com", "dave@example.com", "bob@example.com",
    "eve@example.com", "frank@example.com"
 ]
email_data = sorted(set(emails))
print(email_data)
```
### 결과
```
['alice@example.com', 'bob@example.com', 'charlie@example.com', 'dave@example.com', 'eve@example.com', 'frank@example.com']
```
## 5주차 2 - 4
```python
allowed_ips = {"192.168.1.1", "192.168.1.2", "192.168.1.3", "192.168.1.4"}
blocked_ips = {"192.168.1.3", "192.168.1.5"}
current_access_ips = {"192.168.1.1", "192.168.1.3", "192.168.1.5", "192.168.1.6"}
print(
    '허용 접속된 IP : '
      f'{allowed_ips & current_access_ips}'
      )
print(f'차단된 IP : {current_access_ips & blocked_ips}')
print(f'미등록 IP : {current_access_ips - (allowed_ips | blocked_ips)}')
```
### 결과
```
허용 접속된 IP : {'192.168.1.3', '192.168.1.1'}
차단된 IP : {'192.168.1.3', '192.168.1.5'}
미등록 IP : {'192.168.1.4', '192.168.1.2'}
```
