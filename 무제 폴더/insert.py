
import pymysql
import random




category = ["'가나초콜릿'","'브라질원두'","'매일우유'","'생닭'","'포카리스웨트'","'석수'","'삼다수'","'서울우유'","'불고기'","'새우깡'","'아이셔'","'모나미볼펜'"
            ,"'모나미샤프'","'케밥'","'펩시콜라'","'코카콜라'","'콤비콜라'","'스케틀즈'","'크런키초콜릿'","'블루베리'","'딸기'","'바나나'","'수박'","'키위'","'나이키가방'",
            "'아이시스'","'아디다스가방'","'선풍기'","'운동화끈'","'원형책상'","'식탁'","'책장'","'의자'","'사무책상'","'보조베터리'","'원목책상'","'검은콩두유'",
            "'청바지'","'청반바지'","'셔츠'","'블랙야크패딩'","'축구유니폼'","'단체복'","'노스페이스패딩'","'네파패딩'","'마이크'","'마우스'","'인삼'","'산삼'","'더덕'","'홍삼'"]


#mysql 연결
cnx = pymysql.connect(user='root',password='1234',host='127.0.0.1',database='lastproject',charset='utf8')
#cnx.set_character_set('utf8')

#커서 생성
cursor = cnx.cursor()

for i in range(0,500) :
    sql = ("insert into item (name, stock_count, price) values (%s, %s, %s)")
    info = (category[random.randrange(0,51)],100,1000)
    cursor.execute(sql,info)
    cnx.commit()

cursor.close()
cnx.close()





