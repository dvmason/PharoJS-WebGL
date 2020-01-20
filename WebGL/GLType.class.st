"
I code the GLtypes
"
Class {
	#name : #GLType,
	#superclass : #Object,
	#instVars : [
		'strings'
	],
	#category : #'WebGL-Kernel'
}

{ #category : #'instance creation' }
GLType class >> named: aString [ 
	^ self new named: aString; yourself
]

{ #category : #converting }
GLType >> asGLType [
	^ self
]

{ #category : #converting }
GLType >> asString [
	^ ' ' join: strings
]

{ #category : #'instance creation' }
GLType >> highp [
	strings addFirst: 'highp'.

]

{ #category : #initialization }
GLType >> initialize [
	super initialize.
	strings := OrderedCollection new.

]

{ #category : #'instance creation' }
GLType >> lowp [
	strings addFirst: 'lowp'.

]

{ #category : #'instance creation' }
GLType >> mediump [
	strings addFirst: 'mediump'.

]

{ #category : #'instance creation' }
GLType >> named: aString [
	strings addLast: aString.

]
