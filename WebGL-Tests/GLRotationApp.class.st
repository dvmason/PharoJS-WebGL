"
I contain examples from https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context done using PharoJS and WebGL.
"
Class {
	#name : #GLRotationApp,
	#superclass : #PjWebApplication,
	#instVars : [
		'gl'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #description }
GLRotationApp class >> appJsSubFolder [
	<pharoJsSkip>
	^ 'js'
]

{ #category : #accessing }
GLRotationApp class >> exportVersion [
	<jsLiteralGenerator>
	^ exportVersion
]

{ #category : #'start-stop' }
GLRotationApp >> start [
	| version angle |
	super start.
	gl := GLContext new.
	console log: gl webGLVersion.
	version := self class exportVersion.
	{GLLevel1 . GLLevel1 . GLLevel1} withIndexDo: [: level : position |
		position > version ifTrue: [ ^ self ].
		angle := 360 degreesToRadians / (version + 1) * position.
		gl addObject: (level new translateX: -0.5 - angle sin y: angle cos z: 0).
	]

]
