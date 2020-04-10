"
I provide a mock GLContext so that tests can run.
"
Class {
	#name : #GLContextForTest,
	#superclass : #GLContext,
	#instVars : [
		'shaderSource'
	],
	#category : #'WebGL-Tests-Tests'
}

{ #category : #'mock for WebGL' }
GLContextForTest >> attachShader: aGLContextForTest shader: aGLContextForTest2 [
]

{ #category : #'mock for WebGL' }
GLContextForTest >> compileShader: aGLContextForTest [
]

{ #category : #'mock for WebGL' }
GLContextForTest >> createProgram: anObject [

]

{ #category : #'mock for WebGL' }
GLContextForTest >> createShader: anUndefinedObject [
]

{ #category : #initialization }
GLContextForTest >> fromCanvas: unused [
	webGL := self.

]

{ #category : #'mock for WebGL' }
GLContextForTest >> getAttribLocation: aGLContextForTest named: name [ 
	^ name
]

{ #category : #'mock for WebGL' }
GLContextForTest >> getProgramParameter: aGLContextForTest parameter: unused [
	^ true
]

{ #category : #'mock for WebGL' }
GLContextForTest >> getShaderParameter: aGLContextForTest parameter: anUndefinedObject [
	^ true
]

{ #category : #'mock for WebGL' }
GLContextForTest >> getUniformLocation: aGLContextForTest named: name [
	^ name
]

{ #category : #'mock for WebGL' }
GLContextForTest >> linkProgram: aGLContextForTest [
]

{ #category : #accessing }
GLContextForTest >> shaderSource [
	^ shaderSource
]

{ #category : #'mock for WebGL' }
GLContextForTest >> shaderSource: shader source: source [
	shaderSource := source
]
