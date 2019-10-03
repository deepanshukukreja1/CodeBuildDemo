kill -9 `ps axuw|grep java|grep HelloWorld|awk '{print $2}'`
