"use strict";

function UItitle() {
	const name = DAW.get.name() || "DAW";

	document.title = DAW.compositionNeedSave()
		? "*" + name
		: name;
}
