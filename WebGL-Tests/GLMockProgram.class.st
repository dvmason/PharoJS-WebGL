"
I provide a mock GLProgram so that tests can run.
"
Class {
	#name : #GLMockProgram,
	#superclass : #GLProgram,
	#category : #'WebGL-Tests-Mocks'
}

{ #category : #'testing support' }
GLMockProgram >> classes [
	^ classes
]

{ #category : #'test mock' }
GLMockProgram >> fillBuffer: positions [
]

{ #category : #'test mock' }
GLMockProgram >> initializeStatic: ignored [
]

{ #category : #mocks }
GLMockProgram >> shaderSource [
	self shouldBeImplemented.
]

{ #category : #accessing }
GLMockProgram >> shaders [
	^ webGL shaders
]
