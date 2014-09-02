levenshtein.so: levenshtein.c
	gcc -Wall -fpic $(CFLAGS) -I/usr/include/mysql -shared -o $@ $<

install: levenshtein.so
	cp levenshtein.so /usr/lib/mysql/plugin/
	echo 'CREATE FUNCTION levenshtein RETURNS INTEGER soname "levenshtein.so"' | mysql -u root -p

clean:
	rm -f levenshtein.so
