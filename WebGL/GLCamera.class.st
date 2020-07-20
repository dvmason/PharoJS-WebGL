"
I implement a camera that can be moved around.
"
Class {
	#name : #GLCamera,
	#superclass : #Object,
	#instVars : [
		'position',
		'worldUp',
		'yaw',
		'pitch',
		'speed',
		'sensitivity',
		'zoom',
		'cameraTransform',
		'context'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLCamera >> cameraTransform [
	cameraTransform ifNil: [
		cameraTransform := mat4 create.
		mat4
			perspective: cameraTransform
			fieldOfView: 45 degreesToRadians
			aspect: context aspect
			near: 0.1
			far: 100
		].
	^ cameraTransform
]

{ #category : #accessing }
GLCamera >> context: aGLContext [
	context := aGLContext.

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
GLCamera >> sensitivity: s [
	sensitivity := s.
	cameraTransform := nil.

]

{ #category : #accessing }
GLCamera >> speed: s [
	speed := s.
	cameraTransform := nil.

]

{ #category : #accessing }
GLCamera >> yaw: v [
	yaw := v.
	cameraTransform := nil.

]

{ #category : #accessing }
GLCamera >> zoom: v [
	zoom := (v min: 150) max: 45.
	cameraTransform := nil.

]
