<<<<<<< HEAD
#!/bin/bash

declare -a HEADER=(
	'<!DOCTYPE html>'
	'<html lang="en">'
	'<head>'
	'<title>DAW</title>'
	'<meta charset="UTF-8"/>'
	'<meta name="viewport" content="width=device-width, user-scalable=no"/>'
	'<meta name="theme-color" content="#3a5158"/>'
)

declare -a HEADEREND=(
	'</head>'
	'<body>'
	'<noscript>Нужен JavaScript для запуска</noscript>'
)

declare -a CSSfiles=(
	"ui-components/gsuiMixer/gsuiMixer.css"
	"ui-components/gsuiDragline/gsuiDragline.css"
	"ui-components/gsuiBlocksManager/gsuiBlocksManager.css"
	"ui-components/gsuiPatternroll/gsuiPatternroll.css"
	"ui-components/gsuiPianoroll/gsuiPianoroll.css"
	"ui-components/gsuiKeys/gsuiKeys.css"
	"ui-components/gsuiOscillator/gsuiOscillator.css"
	"ui-components/gsuiPeriodicWave/gsuiPeriodicWave.css"
	"ui-components/gsuiSynthesizer/gsuiSynthesizer.css"
	"ui-components/gsuiDotline/gsuiDotline.css"
	"ui-components/gsuiPanels/gsuiPanels.css"
	"ui-components/gsuiPopup/gsuiPopup.css"
	"ui-components/gsuiSlider/gsuiSlider.css"
	"ui-components/gsuiSliderGroup/gsuiSliderGroup.css"
	"ui-components/gsuiTimeline/gsuiTimeline.css"
	"ui-components/gsuiTrack/gsuiTrack.css"
	"src/css/root.css"
	"src/css/fonts.css"
	"src/css/icon.css"
	"src/css/app.css"
	"src/css/popup.css"
	"src/css/pan-leftside.css"
	"src/css/pan-rightside.css"
	"src/css/pan-cloud.css"
	"src/css/pan-history.css"
	"src/css/pan-patterns.css"
	"src/css/pan-synth-pianoroll.css"
	"src/css/pan-synth.css"
	"src/css/pan-pianoroll.css"
	"src/css/pan-mixer.css"
	"src/css/cmp.css"
	"src/css/synth.css"
	"src/css/pattern.css"
	"src/css/version.css"
	"src/css/controls.css"
	"src/css/historyAction.css"
)

declare -a HTMLfiles=(
	"src/html/_panels.html"
	"src/html/pan-cloud.html"
	"src/html/pan-local.html"
	"src/html/pan-history.html"
	"src/html/pan-patterns.html"
	"src/html/pan-maingrid.html"
	"src/html/pan-mixer.html"
	"src/html/pan-synth.html"
	"src/html/pan-pianoroll.html"
	"src/html/popup-open.html"
	"src/html/popup-about.html"
	"src/html/popup-render.html"
	"src/html/popup-settings.html"
	"src/html/popup-shortcuts.html"
	"src/html/cmp.html"
	"src/html/synth.html"
	"src/html/pattern.html"
	"src/html/historyAction.html"
	"ui-components/gsuiMixer/gsuiMixer.html"
	"ui-components/gsuiDragline/gsuiDragline.html"
	"ui-components/gsuiPatternroll/gsuiPatternroll.html"
	"ui-components/gsuiPianoroll/gsuiPianoroll.html"
	"ui-components/gsuiKeys/gsuiKeys.html"
	"ui-components/gsuiOscillator/gsuiOscillator.html"
	"ui-components/gsuiSynthesizer/gsuiSynthesizer.html"
	"ui-components/gsuiPopup/gsuiPopup.html"
	"ui-components/gsuiSlider/gsuiSlider.html"
	"ui-components/gsuiSliderGroup/gsuiSliderGroup.html"
	"ui-components/gsuiTimeline/gsuiTimeline.html"
	"ui-components/gsuiTrack/gsuiTrack.html"
	"ui-components/gsuiTracklist/gsuiTracklist.html"
)

declare -a JSfiles=(
	"daw-core/src/DAWCore.js"
	"daw-core/src/DAWCore.prototype.get.js"
	"daw-core/src/LocalStorage.js"
	"daw-core/src/Destination.js"
	"daw-core/src/History.js"
	"daw-core/src/History.prototype.nameAction.js"
	"daw-core/src/Pianoroll.js"
	"daw-core/src/Composition.js"
	"daw-core/src/Composition.epure.js"
	"daw-core/src/Composition.format.js"
	"daw-core/src/Composition.prototype.change.js"
	"daw-core/src/json/composition.js"
	"daw-core/src/json/synth.js"
	"daw-core/src/utils/uuid.js"
	"daw-core/src/utils/time.js"
	"daw-core/src/utils/trim2.js"
	"daw-core/src/utils/uniqueName.js"
	"daw-core/src/utils/composeUndo.js"
	"daw-core/src/utils/castToNumber.js"
	"daw-core/src/utils/objectIsEmpty.js"
	"daw-core/src/utils/objectDeepCopy.js"
	"daw-core/src/utils/objectDeepAssign.js"
	"daw-core/src/utils/objectDeepFreeze.js"
	"daw-core/src/actions/addCompositionsFromLocalStorage.js"
	"daw-core/src/actions/addNewComposition.js"
	"daw-core/src/actions/addComposition.js"
	"daw-core/src/actions/addCompositionByJSON.js"
	"daw-core/src/actions/addCompositionByBlob.js"
	"daw-core/src/actions/addCompositionByURL.js"
	"daw-core/src/actions/abortWAVExport.js"
	"daw-core/src/actions/liveChangeSynth.js"
	"daw-core/src/actions/exportCompositionToWAV.js"
	"daw-core/src/actions/exportCompositionToJSON.js"
	"daw-core/src/actions/changePatternSynth.js"
	"daw-core/src/actions/changePatternKeys.js"
	"daw-core/src/actions/deleteComposition.js"
	"daw-core/src/actions/closeComposition.js"
	"daw-core/src/actions/openComposition.js"
	"daw-core/src/actions/saveComposition.js"
	"daw-core/src/actions/newComposition.js"
	"daw-core/src/actions/removePattern.js"
	"daw-core/src/actions/clonePattern.js"
	"daw-core/src/actions/removeSynth.js"
	"daw-core/src/actions/openPattern.js"
	"daw-core/src/actions/namePattern.js"
	"daw-core/src/actions/newPattern.js"
	"daw-core/src/actions/openSynth.js"
	"daw-core/src/actions/nameSynth.js"
	"daw-core/src/actions/newSynth.js"

	"ui-components/gsuiMixer/gsuiMixer.js"
	"ui-components/gsuiDragline/gsuiDragline.js"
	"ui-components/gsuiBeatlines/gsuiBeatlines.js"
	"ui-components/gsuiBlocksManager/gsuiBlocksManager.js"
	"ui-components/gsuiPatternroll/gsuiPatternroll.js"
	"ui-components/gsuiPianoroll/gsuiPianoroll.js"
	"ui-components/gsuiKeys/gsuiKeys.js"
	"ui-components/gsuiOscillator/gsuiOscillator.js"
	"ui-components/gsuiPeriodicWave/gsuiPeriodicWave.js"
	"ui-components/gsuiSynthesizer/gsuiSynthesizer.js"
	"ui-components/gsuiDotline/gsuiDotline.js"
	"ui-components/gsuiPanels/gsuiPanels.js"
	"ui-components/gsuiPopup/gsuiPopup.js"
	"ui-components/gsuiRectMatrix/gsuiRectMatrix.js"
	"ui-components/gsuiSlider/gsuiSlider.js"
	"ui-components/gsuiSliderGroup/gsuiSliderGroup.js"
	"ui-components/gsuiTimeline/gsuiTimeline.js"
	"ui-components/gsuiTrack/gsuiTrack.js"
	"ui-components/gsuiTracklist/gsuiTracklist.js"
	"ui-components/gsuiSpectrum/gsuiSpectrum.js"

	"wa-components/gswaEncodeWAV/gswaEncodeWAV.js"
	"wa-components/gswaScheduler/gswaScheduler.js"
	"wa-components/gswaSynth/gswaSynth.js"
	"wa-components/gswaPeriodicWaves/gswaPeriodicWaves.js"

	"src/ui/dom.js"
	"src/ui/drop.js"
	"src/ui/title.js"
	"src/ui/synth.js"
	"src/ui/mixer.js"
	#"src/ui/cookie.js"
	"src/ui/synths.js"
	"src/ui/history.js"
	"src/ui/patterns.js"
	"src/ui/controls.js"
	"src/ui/keyboard.js"
	"src/ui/openPopup.js"
	"src/ui/pianoroll.js"
	"src/ui/aboutPopup.js"
	"src/ui/keysToRects.js"
	"src/ui/patternroll.js"
	"src/ui/renderPopup.js"
	"src/ui/compositions.js"
	"src/ui/settingsPopup.js"
	"src/ui/shortcutsPopup.js"
	"src/ui/compositionChanged.js"
	"src/ui/masterAnalyserInit.js"
	"src/run.js"
)

buildDev() {
	filename='index.html'
	echo "Сборка $filename"
	printf '%s\n' "${HEADER[@]}" > $filename;
	printf '<link rel="stylesheet" href="%s"/>\n' "${CSSfiles[@]}" >> $filename;
	printf '%s\n' "${HEADEREND[@]}" >> $filename;
	cat "${HTMLfiles[@]}" >> $filename
	echo '<script>function lg( a ) { return console.log.apply( console, arguments ), a; }</script>' >> $filename
	printf '<script src="%s"></script>\n' "${JSfiles[@]}" >> $filename;
	echo '</body>' >> $filename
	echo '</html>' >> $filename
}

buildMaster() {
	filename='index-gh-pages.html'
	echo "Сборка $filename"
	printf '%s\n' "${HEADER[@]}" > $filename;
	echo '<style>' >> $filename
	cat "${CSSfiles[@]}" | sed "s/..\/..\/assets/assets/g" >> $filename
	echo '</style>' >> $filename
	printf '%s\n' "${HEADEREND[@]}" >> $filename;
	cat "${HTMLfiles[@]}" >> $filename
	echo '<script>' >> $filename
	echo '"use strict";' >> $filename
	echo 'function lg( a ) { return console.log.apply( console, arguments ), a; }' >> $filename
	cat "${JSfiles[@]}" | grep -v '"use strict";' >> $filename
	echo '</script>' >> $filename
	echo '</body>' >> $filename
	echo '</html>' >> $filename
}

if [ $# -gt 0 ] && [ $1 = "gh-pages" ]
then
	buildMaster
else
	buildDev
fi
=======
#!/bin/bash

if [[ -z $1 || $1 == "css" ]]; then
	echo "Compressing CSS...";
	cd css;
	tail -n +3 style.scss > _style.scss;
	node-sass _style.scss style.css;
	rm _style.scss;
	cd ..;
fi
>>>>>>> c33d2a9c91e13a260a3d4cdce62aab0065f95837
