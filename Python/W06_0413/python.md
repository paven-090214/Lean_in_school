# W06
### (LAB 2-3) 집합(set)을 활용한 수행과제
set 사용
```python
emails = [
 "alice@example.com", "bob@example.com", "alice@example.com",
 "charlie@example.com", "dave@example.com", "bob@example.com",
 "eve@example.com", "frank@example.com"
 ]
uniqueEmails = list(set(emails))
uniqueEmails.sort()
print(', '.join(uniqueEmails))
```
list 사용
```python
emails = [
 "alice@example.com", "bob@example.com", "alice@example.com",
 "charlie@example.com", "dave@example.com", "bob@example.com",
 "eve@example.com", "frank@example.com"
]
newArr = []

for _ in emails :
    if _ not in newArr :
        newArr.append(_)
newArr.sort()
print(newArr)
```
### (LAB 2-4) 집합(set)을 활용한 수행과제
```python
allowed_ips = {"192.168.1.1", "192.168.1.2", "192.168.1.3", "192.168.1.4"}
blocked_ips = {"192.168.1.3", "192.168.1.5"}
current_access_ips = {"192.168.1.1", "192.168.1.3", "192.168.1.5", "192.168.1.6"}

print(' 허용된 IP 중에서 실제 접속 가능한 IP 목록 : ',allowed_ips & current_access_ips)
print('차단된 IP : ',blocked_ips & current_access_ips)
print('접속 시도했으나 목록에 없는 IP : ', (allowed_ips | blocked_ips) - current_access_ips)
```
### (LAB 1-3 – 수행 과제) 지역변수와 전역변수의 차이 이해하기
```python
balance = 1000
def deposit(amount) :
    global balance
    balance += amount
    print(f'{amount}원이 입급 되었습니다. 현재 잔액 : {balance}원')

def withdraw(amount) :
    global balance
    if balance >= amount :
        balance -= amount
        print(f'{amount}원이 출금 되었습니다. 현재 잔액 : {balance}원')
    else :
        print(f'잔액이 부족합니다. 현재 잔액 : {balance}원')    
deposit(2000)
withdraw(1000)
deposit(2000)
```
### (LAB 1-4 – 심화 수행 과제) 
 global 키워드를 사용하지 않고 함수에서 전역 변수를 수정할 수 있는 방법을 찾아 보세요
```python
balance = 1000
def deposit(amount) :
    result = balance + amount
    print(f'{amount}원이 입급 되었습니다. 현재 잔액 : {result}원')
    return result

def withdraw(amount) :
    if balance >= amount :
        result = balance - amount
        print(f'{amount}원이 출금 되었습니다. 현재 잔액 : {result}원')
        return result
    else :
        print(f'잔액이 부족합니다. 현재 잔액 : {balance}원')    
balance = deposit(2000)
balance = withdraw(1000)
balance = deposit(2000)
```
### (LAB 1-5 – 내친김에 - 심화 과제) 
지역 변수만을 사용하여 잔액을 관리하는 함수형 프로그래밍 방식
```python

```
