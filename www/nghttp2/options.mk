# $NetBSD: options.mk,v 1.8 2020/03/30 13:54:29 adam Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.nghttp2
PKG_SUPPORTED_OPTIONS=	nghttp2-asio nghttp2-tools jemalloc
PKG_SUGGESTED_OPTIONS=	#

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	asio

###
### Build the ASIO C++ library
###
.if !empty(PKG_OPTIONS:Mnghttp2-asio)
# Upstream documents C++14 and gcc>=6 or clang>=6
USE_LANGUAGES+=		c++14
GCC_REQD+=		6
CONFIGURE_ARGS+=	--enable-asio-lib
CONFIGURE_ARGS+=	--with-boost=${BUILDLINK_PREFIX.boost-libs}
CONFIGURE_ARGS+=	--with-boost-asio
CONFIGURE_ARGS+=	--with-boost-system
CONFIGURE_ARGS+=	--with-boost-thread
PLIST.asio=		yes
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--with-boost=no
.endif

###
### Build apps and tools
###
.if !empty(PKG_OPTIONS:Mnghttp2-tools)
# Upstream documents C++14 and gcc>=6 or clang>=6
USE_LANGUAGES+=		c++14
GCC_REQD+=		6
CONFIGURE_ARGS+=	--enable-app
CONFIGURE_ARGS+=	--enable-hpack-tools
PLIST.tools=		yes
.include "../../devel/libev/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../net/libcares/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/jansson/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-app
CONFIGURE_ARGS+=	--disable-hpack-tools
.endif

##
## Enable building with jemalloc
##
.if !empty(PKG_OPTIONS:Mjemalloc)
.include "../../devel/jemalloc/buildlink3.mk"
CONFIGURE_ARGS+=	--with-jemalloc
.else
CONFIGURE_ARGS+=	--without-jemalloc
.endif
