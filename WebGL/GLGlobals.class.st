"
I contain names of Javascript globals that are needed for manipulating WebGL
"
Class {
	#name : #GLGlobals,
	#superclass : #PjJavascriptGlobals,
	#classVars : [
		'Float32Array',
		'Uint16Array',
		'mat4'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #polyfill }
GLGlobals class >> browserPolyfill: aTranspiler [
	<pharoJsSkip>
	super browserPolyfill: aTranspiler.
	aTranspiler
		nextPutAll: 'const mat4 = glMatrix.mat4.';
		nextPutAll: aTranspiler pharoJsSelectorPrefix;
		nextPutAll: 'copy();';cr
]
