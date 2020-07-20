"
I'm a mock WebGL object for tests

"
Class {
	#name : #GLMockWebGL,
	#superclass : #Object,
	#instVars : [
		'shaders'
	],
	#category : #'WebGL-Tests-Mocks'
}

{ #category : #mocks }
GLMockWebGL >> at: aString [
	aString = 'FRAGMENT_SHADER' ifTrue: [ ^ 1 ].
	aString = 'VERTEX_SHADER' ifTrue: [ ^ 2 ].
	^ aString
]

{ #category : #'mock for WebGL' }
GLMockWebGL >> attachShader: aGLContextForTest shader: aGLContextForTest2 [
]

{ #category : #mocks }
GLMockWebGL >> bindBuffer: anUndefinedObject buffer: aGLMockWebGL [ 

]

{ #category : #'mock for WebGL' }
GLMockWebGL >> compileShader: aGLContextForTest [
]

{ #category : #mocks }
GLMockWebGL >> createBuffer [

]

{ #category : #mocks }
GLMockWebGL >> createProgram [

]

{ #category : #mocks }
GLMockWebGL >> createShader: anInteger [
	^ anInteger
]

{ #category : #mocks }
GLMockWebGL >> enableVertexAttribArray: aGLMockWebGL [ 

]

{ #category : #mocks }
GLMockWebGL >> getAttribLocation: aGLMockWebGL named: aString [
]

{ #category : #mocks }
GLMockWebGL >> getProgramParameter: aGLMockWebGL parameter: anUndefinedObject [ 
	^ true
]

{ #category : #mocks }
GLMockWebGL >> getShaderParameter: anInteger parameter: anUndefinedObject [
	^ true
]

{ #category : #mocks }
GLMockWebGL >> getUniformLocation: aGLMockWebGL named: aString [ 

]

{ #category : #initialization }
GLMockWebGL >> initialize [
	super initialize.
	shaders := Array new: 2.

]

{ #category : #mocks }
GLMockWebGL >> linkProgram: aGLMockWebGL [

]

{ #category : #mocks }
GLMockWebGL >> shaderSource: aWebGLProgram source: aString [ 
	shaders at: aWebGLProgram put: aString.

]

{ #category : #accessing }
GLMockWebGL >> shaders [
	^ shaders
]

{ #category : #mocks }
GLMockWebGL >> vertexAttribPointer: aGLMockWebGL numComponents: anInteger type: anUndefinedObject normalize: aFalse stride: anInteger5 offset: anInteger6 [ 

]
