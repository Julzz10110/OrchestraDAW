"use strict";

function UIshortcutsPopupInit() {
	DOM.shortcuts.onclick = UIshortcutsPopupShow;
}

function UIshortcutsPopupShow() {
	gsuiPopup.custom( {
		title: "Шорткаты",
		element: DOM.shortcutsPopupContent,
	} );
	return false;
}
