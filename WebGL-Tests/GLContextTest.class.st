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
	gl := GLContextForTest new.

]

{ #category : #tests }
GLContextTest >> testProgram [
	| program |
	program := gl initProgram;
		varying: #vec4 asGLType lowp named: #vColor;
		addShader: (
			GLVertexShader new
				attribute: #vec4 named: #aVertexPosition;
				attribute: #vec4 named: #aVertexColor;
				uniform: #mat4 named: #uModelViewMatrix;
				uniform: #mat4 named: #uProjectionMatrix;
				function: #void named: #main;
				code: 'gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition';
				code: 'vColor = aVertexColor';
				yourself
			).
	self assert: program shaderSource equals: 'varying lowp vec4 vColor;
attribute vec4 aVertexPosition;
attribute vec4 aVertexColor;
uniform mat4 uProjectionMatrix;
uniform mat4 uModelViewMatrix;
void main(void){
	gl_Position = uProjectionMatrix * uModelViewMatrix * aVertexPosition;
	vColor = aVertexColor;
}
'.
	program addShader: (
			GLFragmentShader new
				function: #void named: #main;
				code: 'gl_FragColor = vColor';
				yourself
			).
	self assert: program shaderSource equals: 'varying lowp vec4 vColor;
void main(void){
	gl_FragColor = vColor;
}
'.
	program linkProgram.
	#(aVertexPosition aVertexColor uProjectionMatrix uModelViewMatrix) do: [ : name |
		self assert: (program ref: name) equals: name.
	].

]
