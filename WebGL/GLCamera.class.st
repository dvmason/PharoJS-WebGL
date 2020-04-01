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
	position := GLFloat32Array x: 0 y: 0 z: 0.
	worldUp := GLFloat32Array x: 0 y: 0 z: 0.
	self
		yaw: -90;
		pitch: 0;
		speed: 2.5;
		sensitivity: 0.1;
		zoom: 45.

]

{ #category : #accessing }
GLCamera >> pitch: v [
	pitch := (v min: 89) max: -89.
	cameraTransform := nil.

]

{ #category : #accessing }
GLCamera >> yaw: v [
	yaw := v.
	cameraTransform := nil.

]

{ #category : #accessing }
GLCamera >> zoom: v [
	zoom := (v min: 45) max: 150.
	cameraTransform := nil.

]
