"use strict";

function UIcookieInit() {
	const cookies = document.cookie;

	if ( cookies.indexOf( "cookieAccepted" ) > -1 ) {
		DOM.eatCookies.remove();
	} else {
		DOM.eatCookies.onclick = UIcookieClick;
	}

	// Delete all the cookies if it's not only accepted.
	if ( cookies && cookies !== "cookieAccepted" ) {
		cookies.split( ";" ).forEach( c => {
			const eq = c.indexOf( "=" );

			document.cookie = ( eq < 0 ? c : c.substr( 0, eq ) )
				+ "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
		} );
	}
}

function UIcookieClick() {
	gsuiPopup.confirm(
		"Cookie",
		"Вы разрешаете использовать DAW<br/>"
		+ "использование файлов cookie для предоставления Вам функции "
		+ "локального сохранения композиций (localStorage)",
		"Принять", "Отмена"
	).then( b => {
		if ( b ) {
			document.cookie = "cookieAccepted";
			DOM.eatCookies.remove();
		}
	} );
	return false;
}
