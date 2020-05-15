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
GLLevel1 class >> createProgram: program [
	program
		addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				yourself
			);
		addShader: (
			GLFragmentShader new
				function: #main;
				code: 'gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0)';
				yourself
			);
		linkProgram.

]

{ #category : #rendering }
GLLevel1 class >> initializeProgram: program [
	program
		createBuffer: #position then: [
			self halt.
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

{ #category : #rendering }
GLLevel1 >> drawDelta: ignored total: rotation [
	self halt.
	mat4
			copy: rotatedViewMatrix
			from: modelViewMatrix.
	program
		uniformMatrix4fv: #uModelViewMatrix
		matrix: rotatedViewMatrix;
		drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4

]

{ #category : #initialization }
GLLevel1 >> initializeStatic [
	modelViewMatrix := mat4 create.
	mat4
		translate: modelViewMatrix
		from: modelViewMatrix
		translation: #(0 0 -6).
	rotatedViewMatrix := mat4 create.

]
