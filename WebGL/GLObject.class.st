"
I am the superclass of renderable objects.
"
Class {
	#name : #GLObject,
	#superclass : #Object,
	#instVars : [
		'gl'
	],
	#pools : [
		'GLConstants',
		'GLGlobals'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #accessing }
GLObject >> draw: secondsSinceLastDraw [
	^ self subclassResponsibility

]

{ #category : #accessing }
GLObject >> gl: aGLContext [
	gl := aGLContext.
	self initializeGL.

]

{ #category : #accessing }
GLObject >> initializeGL [
	^ self subclassResponsibility

]
