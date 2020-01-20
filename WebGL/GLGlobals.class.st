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
GLGlobals class >> browserPolyfill: aStream [
	<pharoJsSkip>
	super browserPolyfill: aStream.
	aStream
		nextPutAll: 'const mat4 = glMatrix.mat4._clone();';cr
]
