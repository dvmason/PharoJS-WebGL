"
I contain examples from https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context done using PharoJS and WebGL.
"
Class {
	#name : #GLRotationApp,
	#superclass : #PjWebApplication,
	#instVars : [
		'gl',
		'glObjects'
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

{ #category : #accessing }
GLRotationApp class >> pharoJsSelectorPrefix [
	<pharoJsSkip>
	^ '_'
]

{ #category : #initialization }
GLRotationApp >> initialize [
	super initialize.
	glObjects := {GLLevel1 . GLLevel2 . GLLevel2 . GLLevel3 . GLLevel3 . GLLevel4 . GLLevel5 . GLLevel6 } first: self class exportVersion.

]

{ #category : #'start-stop' }
GLRotationApp >> start [
	| angle |
	super start.
	gl := GLContext "noAnimate"new.
	glObjects withIndexDo: [: objectClass : position |
		angle := 360 degreesToRadians / glObjects size * position.
		gl addObject: (objectClass new translateX: (-0.5 - angle sin) * 3 y: angle cos * 3 z: -10).
	].
"	gl drawOnce.
"
]
