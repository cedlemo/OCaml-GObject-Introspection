open Ctypes
open Foreign

type t = Invalid_code | Common | Inherited | Arabic | Armenian | Bengali | Bopomofo | Cherokee | Coptic | Cyrillic | Deseret | Devanagari | Ethiopic | Georgian | Gothic | Greek | Gujarati | Gurmukhi | Han | Hangul | Hebrew | Hiragana | Kannada | Katakana | Khmer | Lao | Latin | Malayalam | Mongolian | Myanmar | Ogham | Old_italic | Oriya | Runic | Sinhala | Syriac | Tamil | Telugu | Thaana | Thai | Tibetan | Canadian_aboriginal | Yi | Tagalog | Hanunoo | Buhid | Tagbanwa | Braille | Cypriot | Limbu | Osmanya | Shavian | Linear_b | Tai_le | Ugaritic | New_tai_lue | Buginese | Glagolitic | Tifinagh | Syloti_nagri | Old_persian | Kharoshthi | Unknown | Balinese | Cuneiform | Phoenician | Phags_pa | Nko | Kayah_li | Lepcha | Rejang | Sundanese | Saurashtra | Cham | Ol_chiki | Vai | Carian | Lycian | Lydian | Avestan | Bamum | Egyptian_hieroglyphs | Imperial_aramaic | Inscriptional_pahlavi | Inscriptional_parthian | Javanese | Kaithi | Lisu | Meetei_mayek | Old_south_arabian | Old_turkic | Samaritan | Tai_tham | Tai_viet | Batak | Brahmi | Mandaic | Chakma | Meroitic_cursive | Meroitic_hieroglyphs | Miao | Sharada | Sora_sompeng | Takri | Bassa_vah | Caucasian_albanian | Duployan | Elbasan | Grantha | Khojki | Khudawadi | Linear_a | Mahajani | Manichaean | Mende_kikakui | Modi | Mro | Nabataean | Old_north_arabian | Old_permic | Pahawh_hmong | Palmyrene | Pau_cin_hau | Psalter_pahlavi | Siddham | Tirhuta | Warang_citi | Ahom | Anatolian_hieroglyphs | Hatran | Multani | Old_hungarian | Signwriting | Adlam | Bhaiksuki | Marchen | Newa | Osage | Tangut
let of_value v =
if v = Int32.of_int (-1) then Invalid_code
else if v = Int32.of_int 0 then Common
else if v = Int32.of_int 1 then Inherited
else if v = Int32.of_int 2 then Arabic
else if v = Int32.of_int 3 then Armenian
else if v = Int32.of_int 4 then Bengali
else if v = Int32.of_int 5 then Bopomofo
else if v = Int32.of_int 6 then Cherokee
else if v = Int32.of_int 7 then Coptic
else if v = Int32.of_int 8 then Cyrillic
else if v = Int32.of_int 9 then Deseret
else if v = Int32.of_int 10 then Devanagari
else if v = Int32.of_int 11 then Ethiopic
else if v = Int32.of_int 12 then Georgian
else if v = Int32.of_int 13 then Gothic
else if v = Int32.of_int 14 then Greek
else if v = Int32.of_int 15 then Gujarati
else if v = Int32.of_int 16 then Gurmukhi
else if v = Int32.of_int 17 then Han
else if v = Int32.of_int 18 then Hangul
else if v = Int32.of_int 19 then Hebrew
else if v = Int32.of_int 20 then Hiragana
else if v = Int32.of_int 21 then Kannada
else if v = Int32.of_int 22 then Katakana
else if v = Int32.of_int 23 then Khmer
else if v = Int32.of_int 24 then Lao
else if v = Int32.of_int 25 then Latin
else if v = Int32.of_int 26 then Malayalam
else if v = Int32.of_int 27 then Mongolian
else if v = Int32.of_int 28 then Myanmar
else if v = Int32.of_int 29 then Ogham
else if v = Int32.of_int 30 then Old_italic
else if v = Int32.of_int 31 then Oriya
else if v = Int32.of_int 32 then Runic
else if v = Int32.of_int 33 then Sinhala
else if v = Int32.of_int 34 then Syriac
else if v = Int32.of_int 35 then Tamil
else if v = Int32.of_int 36 then Telugu
else if v = Int32.of_int 37 then Thaana
else if v = Int32.of_int 38 then Thai
else if v = Int32.of_int 39 then Tibetan
else if v = Int32.of_int 40 then Canadian_aboriginal
else if v = Int32.of_int 41 then Yi
else if v = Int32.of_int 42 then Tagalog
else if v = Int32.of_int 43 then Hanunoo
else if v = Int32.of_int 44 then Buhid
else if v = Int32.of_int 45 then Tagbanwa
else if v = Int32.of_int 46 then Braille
else if v = Int32.of_int 47 then Cypriot
else if v = Int32.of_int 48 then Limbu
else if v = Int32.of_int 49 then Osmanya
else if v = Int32.of_int 50 then Shavian
else if v = Int32.of_int 51 then Linear_b
else if v = Int32.of_int 52 then Tai_le
else if v = Int32.of_int 53 then Ugaritic
else if v = Int32.of_int 54 then New_tai_lue
else if v = Int32.of_int 55 then Buginese
else if v = Int32.of_int 56 then Glagolitic
else if v = Int32.of_int 57 then Tifinagh
else if v = Int32.of_int 58 then Syloti_nagri
else if v = Int32.of_int 59 then Old_persian
else if v = Int32.of_int 60 then Kharoshthi
else if v = Int32.of_int 61 then Unknown
else if v = Int32.of_int 62 then Balinese
else if v = Int32.of_int 63 then Cuneiform
else if v = Int32.of_int 64 then Phoenician
else if v = Int32.of_int 65 then Phags_pa
else if v = Int32.of_int 66 then Nko
else if v = Int32.of_int 67 then Kayah_li
else if v = Int32.of_int 68 then Lepcha
else if v = Int32.of_int 69 then Rejang
else if v = Int32.of_int 70 then Sundanese
else if v = Int32.of_int 71 then Saurashtra
else if v = Int32.of_int 72 then Cham
else if v = Int32.of_int 73 then Ol_chiki
else if v = Int32.of_int 74 then Vai
else if v = Int32.of_int 75 then Carian
else if v = Int32.of_int 76 then Lycian
else if v = Int32.of_int 77 then Lydian
else if v = Int32.of_int 78 then Avestan
else if v = Int32.of_int 79 then Bamum
else if v = Int32.of_int 80 then Egyptian_hieroglyphs
else if v = Int32.of_int 81 then Imperial_aramaic
else if v = Int32.of_int 82 then Inscriptional_pahlavi
else if v = Int32.of_int 83 then Inscriptional_parthian
else if v = Int32.of_int 84 then Javanese
else if v = Int32.of_int 85 then Kaithi
else if v = Int32.of_int 86 then Lisu
else if v = Int32.of_int 87 then Meetei_mayek
else if v = Int32.of_int 88 then Old_south_arabian
else if v = Int32.of_int 89 then Old_turkic
else if v = Int32.of_int 90 then Samaritan
else if v = Int32.of_int 91 then Tai_tham
else if v = Int32.of_int 92 then Tai_viet
else if v = Int32.of_int 93 then Batak
else if v = Int32.of_int 94 then Brahmi
else if v = Int32.of_int 95 then Mandaic
else if v = Int32.of_int 96 then Chakma
else if v = Int32.of_int 97 then Meroitic_cursive
else if v = Int32.of_int 98 then Meroitic_hieroglyphs
else if v = Int32.of_int 99 then Miao
else if v = Int32.of_int 100 then Sharada
else if v = Int32.of_int 101 then Sora_sompeng
else if v = Int32.of_int 102 then Takri
else if v = Int32.of_int 103 then Bassa_vah
else if v = Int32.of_int 104 then Caucasian_albanian
else if v = Int32.of_int 105 then Duployan
else if v = Int32.of_int 106 then Elbasan
else if v = Int32.of_int 107 then Grantha
else if v = Int32.of_int 108 then Khojki
else if v = Int32.of_int 109 then Khudawadi
else if v = Int32.of_int 110 then Linear_a
else if v = Int32.of_int 111 then Mahajani
else if v = Int32.of_int 112 then Manichaean
else if v = Int32.of_int 113 then Mende_kikakui
else if v = Int32.of_int 114 then Modi
else if v = Int32.of_int 115 then Mro
else if v = Int32.of_int 116 then Nabataean
else if v = Int32.of_int 117 then Old_north_arabian
else if v = Int32.of_int 118 then Old_permic
else if v = Int32.of_int 119 then Pahawh_hmong
else if v = Int32.of_int 120 then Palmyrene
else if v = Int32.of_int 121 then Pau_cin_hau
else if v = Int32.of_int 122 then Psalter_pahlavi
else if v = Int32.of_int 123 then Siddham
else if v = Int32.of_int 124 then Tirhuta
else if v = Int32.of_int 125 then Warang_citi
else if v = Int32.of_int 126 then Ahom
else if v = Int32.of_int 127 then Anatolian_hieroglyphs
else if v = Int32.of_int 128 then Hatran
else if v = Int32.of_int 129 then Multani
else if v = Int32.of_int 130 then Old_hungarian
else if v = Int32.of_int 131 then Signwriting
else if v = Int32.of_int 132 then Adlam
else if v = Int32.of_int 133 then Bhaiksuki
else if v = Int32.of_int 134 then Marchen
else if v = Int32.of_int 135 then Newa
else if v = Int32.of_int 136 then Osage
else if v = Int32.of_int 137 then Tangut
else raise (Invalid_argument "Unexpected Unicode_script value")
let to_value = function
| Invalid_code -> Int32.of_int (-1)
| Common -> Int32.of_int 0
| Inherited -> Int32.of_int 1
| Arabic -> Int32.of_int 2
| Armenian -> Int32.of_int 3
| Bengali -> Int32.of_int 4
| Bopomofo -> Int32.of_int 5
| Cherokee -> Int32.of_int 6
| Coptic -> Int32.of_int 7
| Cyrillic -> Int32.of_int 8
| Deseret -> Int32.of_int 9
| Devanagari -> Int32.of_int 10
| Ethiopic -> Int32.of_int 11
| Georgian -> Int32.of_int 12
| Gothic -> Int32.of_int 13
| Greek -> Int32.of_int 14
| Gujarati -> Int32.of_int 15
| Gurmukhi -> Int32.of_int 16
| Han -> Int32.of_int 17
| Hangul -> Int32.of_int 18
| Hebrew -> Int32.of_int 19
| Hiragana -> Int32.of_int 20
| Kannada -> Int32.of_int 21
| Katakana -> Int32.of_int 22
| Khmer -> Int32.of_int 23
| Lao -> Int32.of_int 24
| Latin -> Int32.of_int 25
| Malayalam -> Int32.of_int 26
| Mongolian -> Int32.of_int 27
| Myanmar -> Int32.of_int 28
| Ogham -> Int32.of_int 29
| Old_italic -> Int32.of_int 30
| Oriya -> Int32.of_int 31
| Runic -> Int32.of_int 32
| Sinhala -> Int32.of_int 33
| Syriac -> Int32.of_int 34
| Tamil -> Int32.of_int 35
| Telugu -> Int32.of_int 36
| Thaana -> Int32.of_int 37
| Thai -> Int32.of_int 38
| Tibetan -> Int32.of_int 39
| Canadian_aboriginal -> Int32.of_int 40
| Yi -> Int32.of_int 41
| Tagalog -> Int32.of_int 42
| Hanunoo -> Int32.of_int 43
| Buhid -> Int32.of_int 44
| Tagbanwa -> Int32.of_int 45
| Braille -> Int32.of_int 46
| Cypriot -> Int32.of_int 47
| Limbu -> Int32.of_int 48
| Osmanya -> Int32.of_int 49
| Shavian -> Int32.of_int 50
| Linear_b -> Int32.of_int 51
| Tai_le -> Int32.of_int 52
| Ugaritic -> Int32.of_int 53
| New_tai_lue -> Int32.of_int 54
| Buginese -> Int32.of_int 55
| Glagolitic -> Int32.of_int 56
| Tifinagh -> Int32.of_int 57
| Syloti_nagri -> Int32.of_int 58
| Old_persian -> Int32.of_int 59
| Kharoshthi -> Int32.of_int 60
| Unknown -> Int32.of_int 61
| Balinese -> Int32.of_int 62
| Cuneiform -> Int32.of_int 63
| Phoenician -> Int32.of_int 64
| Phags_pa -> Int32.of_int 65
| Nko -> Int32.of_int 66
| Kayah_li -> Int32.of_int 67
| Lepcha -> Int32.of_int 68
| Rejang -> Int32.of_int 69
| Sundanese -> Int32.of_int 70
| Saurashtra -> Int32.of_int 71
| Cham -> Int32.of_int 72
| Ol_chiki -> Int32.of_int 73
| Vai -> Int32.of_int 74
| Carian -> Int32.of_int 75
| Lycian -> Int32.of_int 76
| Lydian -> Int32.of_int 77
| Avestan -> Int32.of_int 78
| Bamum -> Int32.of_int 79
| Egyptian_hieroglyphs -> Int32.of_int 80
| Imperial_aramaic -> Int32.of_int 81
| Inscriptional_pahlavi -> Int32.of_int 82
| Inscriptional_parthian -> Int32.of_int 83
| Javanese -> Int32.of_int 84
| Kaithi -> Int32.of_int 85
| Lisu -> Int32.of_int 86
| Meetei_mayek -> Int32.of_int 87
| Old_south_arabian -> Int32.of_int 88
| Old_turkic -> Int32.of_int 89
| Samaritan -> Int32.of_int 90
| Tai_tham -> Int32.of_int 91
| Tai_viet -> Int32.of_int 92
| Batak -> Int32.of_int 93
| Brahmi -> Int32.of_int 94
| Mandaic -> Int32.of_int 95
| Chakma -> Int32.of_int 96
| Meroitic_cursive -> Int32.of_int 97
| Meroitic_hieroglyphs -> Int32.of_int 98
| Miao -> Int32.of_int 99
| Sharada -> Int32.of_int 100
| Sora_sompeng -> Int32.of_int 101
| Takri -> Int32.of_int 102
| Bassa_vah -> Int32.of_int 103
| Caucasian_albanian -> Int32.of_int 104
| Duployan -> Int32.of_int 105
| Elbasan -> Int32.of_int 106
| Grantha -> Int32.of_int 107
| Khojki -> Int32.of_int 108
| Khudawadi -> Int32.of_int 109
| Linear_a -> Int32.of_int 110
| Mahajani -> Int32.of_int 111
| Manichaean -> Int32.of_int 112
| Mende_kikakui -> Int32.of_int 113
| Modi -> Int32.of_int 114
| Mro -> Int32.of_int 115
| Nabataean -> Int32.of_int 116
| Old_north_arabian -> Int32.of_int 117
| Old_permic -> Int32.of_int 118
| Pahawh_hmong -> Int32.of_int 119
| Palmyrene -> Int32.of_int 120
| Pau_cin_hau -> Int32.of_int 121
| Psalter_pahlavi -> Int32.of_int 122
| Siddham -> Int32.of_int 123
| Tirhuta -> Int32.of_int 124
| Warang_citi -> Int32.of_int 125
| Ahom -> Int32.of_int 126
| Anatolian_hieroglyphs -> Int32.of_int 127
| Hatran -> Int32.of_int 128
| Multani -> Int32.of_int 129
| Old_hungarian -> Int32.of_int 130
| Signwriting -> Int32.of_int 131
| Adlam -> Int32.of_int 132
| Bhaiksuki -> Int32.of_int 133
| Marchen -> Int32.of_int 134
| Newa -> Int32.of_int 135
| Osage -> Int32.of_int 136
| Tangut -> Int32.of_int 137
let t_view = view
~read:of_value
~write:to_value
int32_t

