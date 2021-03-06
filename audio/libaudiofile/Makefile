# $NetBSD: Makefile,v 1.65 2019/10/19 11:29:48 nia Exp $

DISTNAME=	audiofile-0.3.6
PKGNAME=	lib${DISTNAME}
PKGREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=mpruett/}

MAINTAINER=	pkgsrc-users@NetBSD.org
#HOMEPAGE=	http://andromeda.68k.org/~michael/audiofile/
HOMEPAGE=	https://github.com/mpruett/audiofile/
COMMENT=	Sound library for SGI audio file
LICENSE=	gnu-gpl-v2 AND gnu-lgpl-v2.1

GITHUB_PROJECT= audiofile
GITHUB_TAG=	audiofile-0.3.6

USE_LANGUAGES=		c99 c++
USE_TOOLS+=		autoconf automake gmake
USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
PKGCONFIG_OVERRIDE=	audiofile.pc.in
TEST_TARGET=		check

DOCDIR=			${PREFIX}/share/doc/libaudiofile

INSTALLATION_DIRS=	${DOCDIR}

BUILD_DEPENDS+=		asciidoc-[0-9]*:../../textproc/asciidoc

CONFIGURE_ENV+=		A2X=${PREFIX}/bin/a2x
CONFIGURE_ENV+=		ASCIIDOC=${PREFIX}/bin/asciidoc

do-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${SH} ./autogen.sh ${CONFIGURE_ARGS}

post-build:
	cd ${WRKSRC}/docs && \
	for i in af*3; do \
		if grep -q '^.so ' $$i >/dev/null; then \
			sed -e "s_.so _.so man3/_" $$i > $$i.new && mv $$i.new $$i; \
		fi; \
	done

post-install:
	cd ${WRKSRC}/docs && ${INSTALL_DATA} af* sf* ${DESTDIR}${DOCDIR}

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "Linux"
.  include "../../audio/alsa-lib/buildlink3.mk"
.endif
.include "../../mk/bsd.pkg.mk"
