.PHONY: all install clean

all:
	cd /opt/compiled/openresty/openresty-opt/build/LuaJIT-2.1-20190507 && $(MAKE) TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/openresty/luajit
	cd /opt/compiled/openresty/openresty-opt/build/lua-cjson-2.1.0.7 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-signal-0.02 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-redis-parser-0.13 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-rds-parser-0.06 && $(MAKE) DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/nginx-1.15.8 && $(MAKE)

install: all
	mkdir -p $(DESTDIR)/usr/local/openresty/
	-cp /opt/compiled/openresty/openresty-opt/COPYRIGHT $(DESTDIR)/usr/local/openresty/
	cd /opt/compiled/openresty/openresty-opt/build/LuaJIT-2.1-20190507 && $(MAKE) install TARGET_STRIP=@: CCDEBUG=-g XCFLAGS='-DLUAJIT_ENABLE_LUA52COMPAT -DLUAJIT_ENABLE_GC64 -msse4.2' CC=cc PREFIX=/usr/local/openresty/luajit DESTDIR=$(DESTDIR)
	cd /opt/compiled/openresty/openresty-opt/build/lua-cjson-2.1.0.7 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_CMODULE_DIR=/usr/local/openresty/lualib LUA_MODULE_DIR=/usr/local/openresty/lualib CJSON_CFLAGS="-g -fpic" CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-signal-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-redis-parser-0.13 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-rds-parser-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_INCLUDE_DIR=/opt/compiled/openresty/openresty-opt/build/luajit-root/usr/local/openresty/luajit/include/luajit-2.1 LUA_LIB_DIR=/usr/local/openresty/lualib CC=cc
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-dns-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-memcached-0.14 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-redis-0.27 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-mysql-0.21 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-string-0.11 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-upload-0.10 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-websocket-0.07 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-lock-0.08 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-lrucache-0.09 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-core-0.1.17 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-upstream-healthcheck-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-limit-traffic-0.06 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-resty-shell-0.02 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/lua-tablepool-0.01 && $(MAKE) install DESTDIR=$(DESTDIR) LUA_LIB_DIR=/usr/local/openresty/lualib INSTALL=/opt/compiled/openresty/openresty-opt/build/install
	cd /opt/compiled/openresty/openresty-opt/build/opm-0.0.5 && /opt/compiled/openresty/openresty-opt/build/install bin/* $(DESTDIR)/usr/local/openresty/bin/
	cd /opt/compiled/openresty/openresty-opt/build/resty-cli-0.24 && /opt/compiled/openresty/openresty-opt/build/install bin/* $(DESTDIR)/usr/local/openresty/bin/
	cp /opt/compiled/openresty/openresty-opt/build/resty.index $(DESTDIR)/usr/local/openresty/
	cp -r /opt/compiled/openresty/openresty-opt/build/pod $(DESTDIR)/usr/local/openresty/
	cd /opt/compiled/openresty/openresty-opt/build/nginx-1.15.8 && $(MAKE) install DESTDIR=$(DESTDIR)
	mkdir -p $(DESTDIR)/usr/local/openresty/site/lualib $(DESTDIR)/usr/local/openresty/site/pod $(DESTDIR)/usr/local/openresty/site/manifest
	ln -sf /usr/local/openresty/nginx/sbin/nginx $(DESTDIR)/usr/local/openresty/bin/openresty

clean:
	rm -rf build
