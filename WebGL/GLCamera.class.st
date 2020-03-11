"
I implement a camera that can be moved around.
"
Class {
	#name : #GLCamera,
	#superclass : #Object,
	#instVars : [
		'gl',
		'position',
		'worldUp',
		'yaw',
		'pitch',
		'speed',
		'sensitivity',
		'zoom',
		'cameraTransform'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLCamera >> cameraTransform [
	^ cameraTransform ifNil: [
			cameraTransform := nil
		]
]

{ #category : #initialization }
GLCamera >> gl: aGlContext [
	gl := aGlContext.

]

{ #category : #initialization }
GLCamera >> initialize [
	super initialize.
	position := vec3 x: 0 y: 0 z: 0.
	worldUp := vec3 x: 0 y: 0 z: 0.
	self
		yaw: -90;
		pitch: 0.
	speed := 2.5.
	sensitivity := 0.1.
	zoom := 45.
	self cameraTransform.

]

{ #category : #initialization }
GLCamera >> pitch: v [
	pitch := (v min: 89) max: -89.

]

{ #category : #initialization }
GLCamera >> yaw: v [
	yaw := v.

]

{ #category : #initialization }
GLCamera >> zoom: v [
	zoom := (v min: 45) max: 150.

]
