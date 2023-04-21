"use strict";

DAWCore.prototype.addCompositionByURL = function( url ) {
	return fetch( url )
		.then( res => {
			if ( !res.ok ) {
				throw "Файл недоступен: " + url;
			}
			return res.json();
		} )
		.then(
			cmp => this.addComposition( cmp ),
			e => { throw e; }
		);
};
