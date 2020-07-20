"
I provide a mock GLContext so that tests can run.
"
Class {
	#name : #GLMockContext,
	#superclass : #GLContext,
	#instVars : [
		'shaderSource'
	],
	#category : #'WebGL-Tests-Mocks'
}

{ #category : #initialization }
GLMockContext >> fromCanvas: unused [
	webGL := GLMockWebGL new.
	GLConstants loadConstants: webGL.

]

{ #category : #'mock for WebGL' }
GLMockContext >> programClass [
	^ GLMockProgram
]

{ #category : #accessing }
GLMockContext >> programs [
	^ programs
]
