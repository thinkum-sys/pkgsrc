# $NetBSD: Makefile,v 1.17 2020/07/30 14:14:38 gdt Exp $

DISTNAME=	unifi-5.13.32
CATEGORIES=	net
MASTER_SITES=	-http://dl.ubnt.com/unifi/${PKGVERSION_NOREV}/UniFi.unix.zip
EXTRACT_SUFX=	.zip

# Updates must be tested to not only build but actually function under
# at least NetBSD 8/amd64 with actual UBNT hardware.
MAINTAINER=	gdt@NetBSD.org
HOMEPAGE=	https://www.ubnt.com/download/unifi/
# The content that belongs in NEWS are often in a blog.
#BLOGPAGE=	https://community.ui.com/releases
COMMENT=	Provisioning software for network products made by Ubiquiti
LICENSE=	ubiquiti-license

# Bundled firmware images cannot be redistributed
RESTRICTED=		No permission to redistribute
NO_BIN_ON_CDROM=	${RESTRICTED}
NO_BIN_ON_FTP=		${RESTRICTED}
NO_SRC_ON_CDROM=	${RESTRICTED}
NO_SRC_ON_FTP=		${RESTRICTED}

DISTFILES=		${DEFAULT_DISTFILES}
EXTRACT_ONLY=		${DEFAULT_DISTFILES}

# Unifi bundles snappy-java-1.0.5.jar, which contains native code.
# We can use the bundled snappy-java but we must recompile the native portion
# because it only ship linux binaries. The rcd script takes care of loading the
# correct library.
SNAPPY_JAVA=		snappy-java-1.0.5.4
SITES.${SNAPPY_JAVA}.tar.gz=	-https://github.com/xerial/snappy-java/archive/${SNAPPY_JAVA:S/snappy-java-//}.tar.gz
DISTFILES+=		${SNAPPY_JAVA}.tar.gz
EXTRACT_ONLY+=		${SNAPPY_JAVA}.tar.gz

SNAPPY=			snappy-1.0.5
SITES.${SNAPPY}.tar.gz=	http://download.openpkg.org/components/cache/snappy/ \
			http://ftp.NetBSD.org/pub/pkgsrc/distfiles/snappy-java10/
DISTFILES+=		${SNAPPY}.tar.gz
EXTRACT_ONLY+=		${SNAPPY}.tar.gz

CHECK_SHLIBS_SKIP=	unifi/lib/native/*
INSTALLATION_DIRS=	unifi

# Emulated JDK doesn't work due to epoll issues.  Also, would require
# matching emulated native libraries, and we only compile actual
# native libaries.
PKG_JVMS_ACCEPTED=	openjdk8
PKGSRC_MAKE_ENV+=	JAVA_HOME=${PKG_JAVA_HOME}
USE_LANGUAGES=		c c++	# for snappy JNI library
USE_TOOLS+=		gmake pax
WRKSRC=			${WRKDIR}/UniFi

# Upstream documents 3.4.15, but 3.4.4 actually works.  Avoid mongodb4 because it
# has a problematic license.
DEPENDS+=		mongodb>=3.4.4:../../databases/mongodb3

FILES_SUBST+=		UNIFI_USER=${UNIFI_USER:Q} UNIFI_GROUP=${UNIFI_GROUP:Q}
FILES_SUBST+=		JAVA=${PKG_JAVA_HOME}/bin/java
RCD_SCRIPTS=		unifi
UNIFI_USER?=		unifi
UNIFI_GROUP?=		unifi
PKG_USERS_VARS=		UNIFI_USER
PKG_GROUPS_VARS=	UNIFI_GROUP
PKG_GROUPS=		${UNIFI_GROUP}
PKG_USERS=		${UNIFI_USER}:${UNIFI_GROUP}

.for d in data logs run work
OWN_DIRS_PERMS+=	${PREFIX}/unifi/${d} ${UNIFI_USER} ${UNIFI_GROUP} 0700
.endfor

.include "../../mk/bsd.prefs.mk"

post-extract:
# drop executable bit
	find ${WRKSRC} -type f -print0 | xargs -0 chmod -x
	mkdir ${WRKDIR}/${SNAPPY_JAVA}/target
	ln -s ${WRKDIR}/${SNAPPY} ${WRKDIR}/${SNAPPY_JAVA}/target

do-build:
# bundled mongod is a linux binary; replace with symlink to native binary
	rm -f ${WRKSRC}/bin/mongod
	ln -s ${PREFIX}/bin/mongod ${WRKSRC}/bin/mongod
	cd ${WRKDIR}/${SNAPPY_JAVA} && ${BUILD_MAKE_CMD} native

do-install:
	cd ${WRKSRC} && pax -rw . ${DESTDIR}${PREFIX}/unifi
	${INSTALL_LIB} ${WRKDIR}/${SNAPPY_JAVA}/target/snappy-1.0.5-Default/libsnappyjava.so ${DESTDIR}${PREFIX}/unifi/lib

.include "../../mk/java-vm.mk"
.include "../../mk/bsd.pkg.mk"
