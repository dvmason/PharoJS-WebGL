"
I contain examples from https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/Tutorial/Adding_2D_content_to_a_WebGL_context done using PharoJS and WebGL.
"
Class {
	#name : #GLLevel1,
	#superclass : #GLObject,
	#instVars : [
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
		vertexShader: [: vertexShader |
			vertexShader
				attribute: #vec4 named: #aVertexPosition;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #main;
				assign: #gl_Position equals: #(uProjectionMatrix * uModelViewMatrix * aVertexPosition);
				yourself
			];
		fragmentShader: [: fragmentShader |
			fragmentShader
				function: #main;
				assign: #gl_FragColor equals: #(vec4 (1.0 1.0 1.0 1.0));
				yourself
			];
		linkProgram.

]

{ #category : #rendering }
GLLevel1 class >> initializeProgram: program [
	program
		createBuffer: #position then: [: buffer |
			program
				arrayBuffer: #position;
				fillBuffer: #(
						-1  1
						 1  1
						-1 -1
						 1 -1
					)
		].
	self log: 'initializeProgram:'.

]

{ #category : #rendering }
GLLevel1 >> drawDelta: ignored total: rotation [
	mat4
			copy: rotatedViewMatrix
			from: modelViewMatrix.
	program
		uniformMatrix4fv: #uModelViewMatrix matrix: rotatedViewMatrix;
		point: #aVertexPosition at: #position components: 2;
		drawArrays: TRIANGLE_STRIP offset: 0 vertexCount: 4.
	console log: 'draw triangle_strip'.

]

{ #category : #initialization }
GLLevel1 >> initializeStatic [
	rotatedViewMatrix := mat4 create.
	console log: 'initializeStatic'.

]
