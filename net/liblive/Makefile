# $NetBSD: Makefile,v 1.23 2019/11/03 11:45:40 rillig Exp $

DISTNAME=	live.2014.12.11
PKGNAME=	lib${DISTNAME:S/./-/:S/.//g}
CATEGORIES=	net
MASTER_SITES=	http://www.live555.com/liveMedia/public/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.live555.com/liveMedia/
COMMENT=	Set of C++ libraries for multimedia streaming
LICENSE=	gnu-lgpl-v2.1

WRKSRC=		${WRKDIR}/live
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake
USE_LIBTOOL=	YES

INSTALLATION_DIRS=	bin lib include/BasicUsageEnvironment include/UsageEnvironment
INSTALLATION_DIRS+=	include/groupsock include/liveMedia
INSTALLATION_DIRS+=	share/examples/liblive

.include "../../mk/bsd.fast.prefs.mk"

.if ${OPSYS} == "SunOS"
.  if ${MACHINE_ARCH} == "x86_64"
LIVE_BITNESS=	-64bit
.  else
LIVE_BITNESS=	-32bit
.  endif
.else
LIVE_BITNESS=	# empty
.endif

do-configure:
	${CP} ${FILESDIR}/config.netbsd ${WRKSRC}
	${CP} ${FILESDIR}/config.netbsd ${WRKSRC}/config.dragonfly
	${CP} ${FILESDIR}/config.netbsd ${WRKSRC}/config.darwin
	cd ${WRKSRC} && ${SH} ./genMakefiles ${LOWER_OPSYS}${LIVE_BITNESS}

do-install:
.for lib in BasicUsageEnvironment UsageEnvironment groupsock liveMedia
	cd ${WRKSRC}/${lib} &&						\
	${LIBTOOL} --mode=install ${INSTALL_LIB} lib${lib}.la ${DESTDIR}${PREFIX}/lib
	cd ${WRKSRC}/${lib}/include &&					\
	for i in *.h *.hh ; do						\
		[ ! -f $$i ] ||						\
		${INSTALL_DATA} $$i 					\
			${DESTDIR}${PREFIX}/include/${lib} ;		\
	done
.endfor
.for bin in testMP3Streamer testMPEG1or2VideoStreamer 			\
	testMPEG1or2AudioVideoStreamer testMPEG2TransportStreamer 	\
	testMPEG4VideoStreamer testWAVAudioStreamer testAMRAudioStreamer\
	vobStreamer testMP3Receiver testMPEG1or2VideoReceiver sapWatch 	\
	testRelay testOnDemandRTSPServer \
	openRTSP playSIP testMPEG1or2Splitter 	\
	testMPEG1or2ProgramToTransportStream
	cd ${WRKSRC}/testProgs &&					\
	${LIBTOOL} --mode=install ${INSTALL_PROGRAM} 			\
		${bin} ${DESTDIR}${PREFIX}/share/examples/liblive
.endfor

.include "../../mk/bsd.pkg.mk"
