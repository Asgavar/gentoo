# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit golang-build golang-vcs-snapshot

EGO_PN="github.com/genuinetools/reg"
EGIT_COMMIT="v${PV}"
GIT_COMMIT="d25a2c83ae5414c8a72f2e1ab96529fb1744fe26"
ARCHIVE_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

DESCRIPTION="Docker registry v2 command line client"
HOMEPAGE="https://github.com/genuinetools/reg"
SRC_URI="${ARCHIVE_URI}"
LICENSE="MIT"
SLOT="0"
IUSE=""

RESTRICT="test"

src_compile() {
	pushd src/${EGO_PN} || die
	GOPATH="${S}" go build -v -ldflags "-X ${EGO_PN}/version.GITCOMMIT=${GIT_COMMIT} -X ${EGO_PN}/version.VERSION=${PV}" -o "${S}"/bin/reg . || die
	popd || die
}

src_install() {
	dobin bin/*
	dodoc src/${EGO_PN}/README.md
}
