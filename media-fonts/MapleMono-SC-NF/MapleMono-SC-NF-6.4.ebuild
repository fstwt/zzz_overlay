# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Maple Mono SC font patched with Nerd fonts"
HOMEPAGE="https://github.com/subframe7536/maple-font"
SRC_URI="https://github.com/subframe7536/maple-font/releases/download/v${PV}/${PN}.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 arm64 ~loong ppc64 ~riscv x86"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/fonts/ttf"
FONT_SUFFIX="ttf"
