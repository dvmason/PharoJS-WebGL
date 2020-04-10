"
I am the superclass of renderable objects.
"
Class {
	#name : #GLObject,
	#superclass : #Object,
	#instVars : [
		'gl',
		'program'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#classInstVars : [
		'program'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #rendering }
GLObject class >> createProgram: gl [
	^ self subclassResponsibility
]

{ #category : #accessing }
GLObject class >> program: gl [
	^ program
		ifNil: [ program := (self hasClassMethod: #createProgram:)
				ifTrue: [ self createProgram: gl ]
				ifFalse: [ self superclass program: gl ] ]
]

{ #category : #rendering }
GLObject class >> setupForDraw [
]

{ #category : #rendering }
GLObject >> drawDelta: secondsSinceLastDraw total: secondsSinceProgramStart [
	^ self subclassResponsibility

]

{ #category : #accessing }
GLObject >> gl: aGLContext [
	gl := aGLContext.

]

{ #category : #initialization }
GLObject >> initializeGL [
	^ self subclassResponsibility

]

{ #category : #accessing }
GLObject >> program [
	^ program ifNil: [ program := self class program: gl ]
]

{ #category : #accessing }
GLObject >> translateX: x y: y z: z [
	self halt
]
