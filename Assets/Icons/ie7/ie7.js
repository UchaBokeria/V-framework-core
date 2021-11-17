/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icony\'">' + entity + '</span>' + html;
	}
	var icons = {
		'icon-about': '&#xe900;',
		'icon-analytics': '&#xe901;',
		'icon-approved': '&#xe902;',
		'icon-area': '&#xe903;',
		'icon-bed': '&#xe904;',
		'icon-bigDownArrow': '&#xe905;',
		'icon-bookmark': '&#xe906;',
		'icon-close': '&#xe907;',
		'icon-conditioner': '&#xe908;',
		'icon-customize': '&#xe909;',
		'icon-dashboard': '&#xe90a;',
		'icon-delete': '&#xe90b;',
		'icon-displayType': '&#xe90c;',
		'icon-door': '&#xe90d;',
		'icon-edit': '&#xe90e;',
		'icon-favorite': '&#xe90f;',
		'icon-floor': '&#xe910;',
		'icon-gas': '&#xe911;',
		'icon-hamgurger': '&#xe912;',
		'icon-heating': '&#xe913;',
		'icon-location': '&#xe914;',
		'icon-logout': '&#xe915;',
		'icon-message': '&#xe916;',
		'icon-notAprroved': '&#xe917;',
		'icon-parking': '&#xe918;',
		'icon-phone': '&#xe919;',
		'icon-playRight': '&#xe91a;',
		'icon-plus': '&#xe91b;',
		'icon-pool': '&#xe91c;',
		'icon-print': '&#xe91d;',
		'icon-profile': '&#xe91e;',
		'icon-rightArrow': '&#xe91f;',
		'icon-search': '&#xe920;',
		'icon-selectedFavorite': '&#xe921;',
		'icon-share': '&#xe922;',
		'icon-wifi': '&#xe923;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
