"
I am the superclass of renderable objects.
"
Class {
	#name : #GLObject,
	#superclass : #Object,
	#instVars : [
		'program',
		'modelViewMatrix'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #rendering }
GLObject class >> createProgram: program [
	^ self subclassResponsibility
]

{ #category : #rendering }
GLObject class >> initializeProgram: program [

]

{ #category : #accessing }
GLObject class >> programClass [
	^ ((self hasClassMethod: #createProgram:) or: [ self hasClassMethod: #initializeProgram: ] )
				ifTrue: [ self ]
				ifFalse: [ self superclass programClass ]
]

{ #category : #rendering }
GLObject class >> setupForDraw: program [

]

{ #category : #rendering }
GLObject >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart [
	^ self subclassResponsibility

]

{ #category : #accessing }
GLObject >> modelViewMatrix [
	^ modelViewMatrix ifNil: [ modelViewMatrix := mat4 create ]
]

{ #category : #accessing }
GLObject >> program: aGLProgram [
	program := aGLProgram
]

{ #category : #accessing }
GLObject >> translateX: x y: y z: z [
	mat4
		translate: self modelViewMatrix
		from: modelViewMatrix
		translation: { x . y . z }.

]
