# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit font
FONT_SUFFIX="ttf"

DESCRIPTION="Maple Mono: Open source monospace font."
HOMEPAGE="https://font.subf.dev"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

BDEPEND="app-arch/unzip"

IUSE="base cjk-cn liga nerd normal opentype truetype woff2"
REQUIRED_USE="
	base? ( truetype )
	liga? ( || ( base cjk-cn nerd opentype truetype woff2 ) )
	normal? ( || ( base cjk-cn nerd opentype truetype woff2 ) )

	|| ( base cjk-cn nerd opentype truetype woff2 )
	?? ( base || ( cjk-cn nerd opentype woff2 ) )
"

BASE_SRC_URI="https://github.com/subframe7536/maple-font/releases/download/v${PV}/MapleMono${NORMAL_FONT}${NO_LIGATURE_FONT}"
SRC_URI="
	liga? (
		cjk-cn? (
			nerd? (
				normal? (
					"${BASE_SRC_URI}Normal-NF-CN-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}-NF-CN-unhinted.zip"
				)
			)
			!nerd? (
				normal? (
					"${BASE_SRC_URI}Normal-CN-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}-CN-unhinted.zip"
				)
			)
		)
		!cjk-cn? (
			nerd? (
				normal? (
					"${BASE_SRC_URI}Normal-NF-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}-NF-unhinted.zip"
				)
			)
			!nerd? (
				normal? (
					base? (
						"${BASE_SRC_URI}Normal-Variable.zip"
					)
					!base? ( truetype? (
						"${BASE_SRC_URI}Normal-TTF.zip"
					) )
				)
				!normal? (
					base? (
						"${BASE_SRC_URI}-Variable.zip"
					)
					!base? ( truetype? (
						"${BASE_SRC_URI}-TTF.zip"
					) )
				)
			)
		)
		normal? (
			opentype? (
				"${BASE_SRC_URI}Normal-OTF.zip"
			)
			woff2? (
				"${BASE_SRC_URI}Normal-Woff2.zip"
			)
		)
		!normal? (
			opentype? (
				"${BASE_SRC_URI}-OTF.zip"
			)
			woff2? (
				"${BASE_SRC_URI}-Woff2.zip"
			)
		)
	)

	!liga? (
		cjk-cn? (
			nerd? (
				normal? (
					"${BASE_SRC_URI}NormalNL-NF-CN-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}NL-NF-CN-unhinted.zip"
				)
			)
			!nerd? (
				normal? (
					"${BASE_SRC_URI}NormalNL-CN-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}NL-CN-unhinted.zip"
				)
			)
		)
		!cjk-cn? (
			nerd? (
				normal? (
					"${BASE_SRC_URI}NormalNL-NF-unhinted.zip"
				)
				!normal? (
					"${BASE_SRC_URI}NL-NF-unhinted.zip"
				)
			)
			!nerd? (
				normal? (
					base? (
						"${BASE_SRC_URI}NormalNL-Variable.zip"
					)
					!base? ( truetype? (
						"${BASE_SRC_URI}NormalNL-TTF.zip"
					) )
				)
				!normal? (
					base? (
						"${BASE_SRC_URI}NL-Variable.zip"
					)
					!base? ( truetype? (
						"${BASE_SRC_URI}NL-TTF.zip"
					) )
				)
			)
		)
		normal? (
			opentype? (
				"${BASE_SRC_URI}NormalNL-OTF.zip"
			)
			woff2? (
				"${BASE_SRC_URI}NormalNL-Woff2.zip"
			)
		)
		!normal? (
			opentype? (
				"${BASE_SRC_URI}NL-OTF.zip"
			)
			woff2? (
				"${BASE_SRC_URI}NL-Woff2.zip"
			)
		)
	)
"

S="${WORKDIR}"

src_install() {
	for i in otf woff2; do
		_font_file=`compgen -G *.$i`
		FONT_SUFFIX+=" ${_font_file##*.}"
	done

	font_src_install
}
