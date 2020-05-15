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
		'program'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLCamera >> cameraTransform [
	| projectionMatrix |
	projectionMatrix := mat4 create.
	mat4
		perspective: projectionMatrix
		fieldOfView: 45 degreesToRadians
		aspect: program aspect
		near: 0.1
		far: 100.
	program
		uniformMatrix4fv: #uProjectionMatrix
		matrix: projectionMatrix.

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
GLCamera >> program: aGLProgram [
	program := aGLProgram.

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
