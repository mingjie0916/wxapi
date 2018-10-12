import db

sql = 'select catecode, ename, cname from categorys order by catecode'

rows = db.queryAll( sql )

for row in rows:
    print '"'+row["catecode"]+'" => ',  "array(" ,   '"'+row["ename"]+'",',    '"'+ row["cname"].encode("utf-8") +'"' + "),"

