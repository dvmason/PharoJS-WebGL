"
I contain tests that can run on the Pharo side that verify that programs are built correctly.
"
Class {
	#name : #GLContextTest,
	#superclass : #TestCase,
	#instVars : [
		'gl'
	],
	#category : #'WebGL-Tests-Tests'
}

{ #category : #running }
GLContextTest >> setUp [
	super setUp.
	gl := GLMockContext new.

]

{ #category : #tests }
GLContextTest >> testBuild [
	| program |
	gl addObject: GLLevel1 new.
	gl addObject: GLLevel1 new.
	self assert: (gl programs includesKey: #GLLevel1).
	program := gl programs at: #GLLevel1.
	program classes keysAndValuesDo: [: key : glObjects |
		self assert: key equals: #GLLevel1.
		self assert: glObjects size equals: 2.
	].
]

{ #category : #tests }
GLContextTest >> testProgram [
	| program |
	program := gl createProgram.
	program suffix: #X.
	program
		varying: #vec4 asGLType lowp named: #vColor;
		vertexShader: [: vertexShader |
			vertexShader
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec4 named: #aVertexColor;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #void named: #main;
				assign: 'gl_Position' equals: #( uProjectionMatrix * uModelViewMatrix * aVertexPosition );
				assign: 'vColor' equals: 'aVertexColor';
				yourself
			].
	self assert: program shaders second asString equals: 'varying lowp vec4 vColorX;
attribute vec4 aVertexPositionX;
attribute vec4 aVertexColorX;
uniform mat4 uProjectionMatrixX;
uniform mat4 uModelViewMatrixX;
void main(void){
	gl_Position = uProjectionMatrixX * uModelViewMatrixX * aVertexPositionX;
	vColorX = aVertexColorX;
}
'.
	program
		fragmentShader: [: fragmentShader |
			fragmentShader
				function: #void named: #main;
				assign: 'gl_FragColor' equals: #(vec4 (1.0 1.0 1.0 1.0));
				assign: 'gl_FragColor' equals: 'vColor';
				yourself
			].
	self assert: program shaders first equals: 'varying lowp vec4 vColorX;
void main(void){
	gl_FragColor = vec4 (1.0,1.0,1.0,1.0);
	gl_FragColor = vColorX;
}
'.

]
