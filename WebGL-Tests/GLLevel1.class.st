"
I contain examples from https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context done using PharoJS and WebGL.
"
Class {
	#name : #GLLevel1,
	#superclass : #GLObject,
	#instVars : [
		'modelViewMatrix',
		'rotatedViewMatrix'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Tests-Examples'
}

{ #category : #rendering }
GLLevel1 class >> createProgram: gl [
| p |
self halt.
	p := gl createProgram.
	p addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				yourself
			).
	p addShader: (
			GLFragmentShader new
				function: #main;
				code: 'gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0)';
				yourself
			).
	self halt.
	p linkProgram.
	^ p
]

{ #category : #rendering }
GLLevel1 >> drawDelta: ignored total: rotation [
	mat4
			copy: rotatedViewMatrix
			from: modelViewMatrix.
	program
		uniformMatrix4fv: #uModelViewMatrix
		matrix: rotatedViewMatrix.
	gl drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4

]

{ #category : #initialization }
GLLevel1 >> initColours [

]

{ #category : #initialization }
GLLevel1 >> initMatrices [
	| projectionMatrix |
	projectionMatrix := mat4 create.
	mat4
		perspective: projectionMatrix
		fieldOfView: 45 degreesToRadians
		aspect: gl aspect
		near: 0.1
		far: 100.
	program
		uniformMatrix4fv: #uProjectionMatrix
		matrix: projectionMatrix.
	modelViewMatrix := mat4 create.
	mat4
		translate: modelViewMatrix
		from: modelViewMatrix
		translation: #(0 0 -6).
	rotatedViewMatrix := mat4 create.

]

{ #category : #initialization }
GLLevel1 >> initVertices [
	program
		createBuffer: #position then: [
			program
				arrayBuffer: #position;
				fillBuffer: #(
						-1  1
						 1  1
						-1 -1
						 1 -1
					);
				point: #aVertexPosition components: 2
	].

]

{ #category : #initialization }
GLLevel1 >> initializeGL [
	self initVertices.
	self initColours.
	self initMatrices.

]
